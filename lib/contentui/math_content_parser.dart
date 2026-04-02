import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

class MathContentParser {
  static final _blockMathRegex = RegExp(r'\$\$(.*?)\$\$', dotAll: true);
  static final _inlineContentRegex = RegExp(r'\$([^\$]*?)\$|\*\*(.*?)\*\*');

  static Widget buildFormattedText(
    String text, {
    double? maxWidth,
    double fontSize = 16.0,
    Color color = const Color(0xFF2E3A59),
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double height = 1.6,
    TextAlign textAlign = TextAlign.start,
  }) {
    if (text.trim().isEmpty) return const SizedBox.shrink();

    try {
      if (_blockMathRegex.hasMatch(text)) {
        return _buildBlockMath(text, fontSize, color, fontWeight, fontStyle, height, textAlign);
      }
      if (_inlineContentRegex.hasMatch(text)) {
        return _buildInlineContent(text, maxWidth, fontSize, color, fontWeight, fontStyle, height, textAlign);
      }
      return _buildPlainText(text, fontSize, color, fontWeight, fontStyle, height, textAlign);
    } catch (e) {
      return _buildPlainText(text, fontSize, color, fontWeight, fontStyle, height, textAlign);
    }
  }

  static Widget buildHeader(String text, {int level = 1}) {
    return buildFormattedText(
      text,
      fontSize: level == 1 ? 26 : 22,
      fontWeight: FontWeight.bold,
    );
  }

  static Widget buildBody(String text, {double? maxWidth}) {
    return buildFormattedText(
      text,
      maxWidth: maxWidth,
      fontSize: 18,
      height: 1.5,
    );
  }

  static Widget buildCaption(String text) {
    return buildFormattedText(
      text,
      fontSize: 14,
      color: Colors.grey[700]!,
      fontStyle: FontStyle.italic,
    );
  }

  static Widget buildSmall(String text, {Color? color, FontWeight? fontWeight}) {
    return buildFormattedText(
      text,
      fontSize: 16,
      color: color ?? const Color(0xFF2E3A59),
      fontWeight: fontWeight,
    );
  }

  static Widget _buildBlockMath(
    String text,
    double fontSize,
    Color color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double height,
    TextAlign textAlign,
  ) {
    final parts = text.split(r'$$');
    final widgets = <Widget>[];

    for (int i = 0; i < parts.length; i++) {
      final part = parts[i].trim();
      if (part.isEmpty) continue;

      if (i % 2 == 1) {
        widgets.add(Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 16),
          child: Center(
            child: _SelectableOverlay(
              visible: Math.tex(
                part,
                textStyle: TextStyle(fontSize: fontSize + 2, color: color),
                mathStyle: MathStyle.display,
                onErrorFallback: (error) => _buildError(part),
              ),
              overlayText: '\$\$$part\$\$',
              fontSize: fontSize + 2,
            ),
          ),
        ));
      } else if (part.isNotEmpty) {
        widgets.add(_buildInlineContent(part, null, fontSize, color, fontWeight, fontStyle, height, textAlign));
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }

  static Widget _buildInlineContent(
    String text,
    double? maxWidth,
    double fontSize,
    Color color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double height,
    TextAlign textAlign,
  ) {
    final spans = <InlineSpan>[];
    int lastEnd = 0;

    for (final match in _inlineContentRegex.allMatches(text)) {
      if (match.start > lastEnd) {
        spans.add(TextSpan(text: text.substring(lastEnd, match.start)));
      }

      final mathContent = match.group(1);
      final boldContent = match.group(2);

      if (mathContent != null) {
        if (mathContent.trim().isNotEmpty) {
          spans.add(WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            baseline: TextBaseline.alphabetic,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final effectiveMaxWidth = maxWidth ?? constraints.maxWidth * 0.97;
                return InlineMathWidget(
                  mathContent: mathContent.trim(),
                  originalLatex: '\$$mathContent\$',
                  maxWidth: effectiveMaxWidth,
                  fontSize: fontSize,
                  color: color,
                );
              },
            ),
          ));
        }
      } else if (boldContent != null) {
        spans.add(TextSpan(
          text: boldContent,
          style: TextStyle(fontWeight: FontWeight.bold),
        ));
      }
      lastEnd = match.end;
    }

    if (lastEnd < text.length) {
      spans.add(TextSpan(text: text.substring(lastEnd)));
    }

    return Text.rich(  // REMOVED: SelectableRegion wrapper
      TextSpan(
        style: TextStyle(
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          fontFamily: 'Roboto',
          height: height,
        ),
        children: spans,
      ),
      textAlign: textAlign,
      textScaleFactor: 1.0,
    );
  }

  static Widget _buildPlainText(
    String text,
    double fontSize,
    Color color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double height,
    TextAlign textAlign,
  ) {
    if (text.trim().isEmpty) return const SizedBox.shrink();

    if (_inlineContentRegex.hasMatch(text)) {
      return _buildInlineContent(text, null, fontSize, color, fontWeight, fontStyle, height, textAlign);
    }

    return Text(  // REMOVED: SelectableRegion wrapper
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        height: height,
      ),
      textAlign: textAlign,
    );
  }

  static Widget _buildError(String content) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.1),
        borderRadius: BorderRadius.circular(3),
        border: Border.all(color: Colors.orange.withOpacity(0.3)),
      ),
      child: Text(
        '\$\$$content\$\$',
        style: const TextStyle(
          fontSize: 14,
          color: Colors.orange,
          fontFamily: 'monospace',
        ),
      ),
    );
  }
}

class _SelectableOverlay extends StatelessWidget {
  final Widget visible;
  final String overlayText;
  final double fontSize;

  const _SelectableOverlay({
    required this.visible,
    required this.overlayText,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        visible,
        Positioned.fill(
          child: Opacity(
            opacity: 0.01,
            child: Text(
              overlayText,
              style: TextStyle(fontSize: fontSize, color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}

class InlineMathWidget extends StatefulWidget {
  final String mathContent;
  final String originalLatex;
  final double maxWidth;
  final double fontSize;
  final Color color;

  const InlineMathWidget({
    Key? key,
    required this.mathContent,
    required this.originalLatex,
    required this.maxWidth,
    this.fontSize = 16.0,
    this.color = const Color(0xFF2E3A59),
  }) : super(key: key);

  @override
  _InlineMathWidgetState createState() => _InlineMathWidgetState();
}

class _InlineMathWidgetState extends State<InlineMathWidget> {
  final _key = GlobalKey();
  bool _needsScroll = false;
  bool _measured = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _measure());
  }

  @override
  void didUpdateWidget(covariant InlineMathWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.mathContent != widget.mathContent ||
        oldWidget.maxWidth != widget.maxWidth) {
      setState(() {
        _measured = false;
      });
      WidgetsBinding.instance.addPostFrameCallback((_) => _measure());
    }
  }

  void _measure() {
    final box = _key.currentContext?.findRenderObject() as RenderBox?;
    if (box != null && mounted) {
      setState(() {
        _needsScroll = box.size.width > widget.maxWidth;
        _measured = true;
      });
    }
  }

  Widget _buildMath() {
    return Math.tex(
      widget.mathContent,
      textStyle: TextStyle(fontSize: widget.fontSize, color: widget.color),
      mathStyle: MathStyle.text,
      onErrorFallback: (_) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        decoration: BoxDecoration(
          color: Colors.orange.withOpacity(0.1),
          borderRadius: BorderRadius.circular(3),
          border: Border.all(color: Colors.orange.withOpacity(0.3)),
        ),
        child: Text(
          widget.originalLatex,
          style: TextStyle(
            fontSize: widget.fontSize - 2,
            color: Colors.orange,
            fontFamily: 'monospace',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final math = _buildMath();

    if (!_measured) {
      return Opacity(
        opacity: 0,
        child: Container(key: _key, child: math),
      );
    }

    if (_needsScroll) {
      return Container(
        constraints: BoxConstraints(maxWidth: widget.maxWidth),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                margin: const EdgeInsets.symmetric(horizontal: 1),
                child: _SelectableOverlay(
                  visible: math,
                  overlayText: widget.originalLatex,
                  fontSize: widget.fontSize,
                ),
              ),
            ),
            Container(
              height: 3,
              margin: const EdgeInsets.only(top: 2),
              child: Center(
                child: Container(
                  width: 20,
                  height: 2,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      constraints: BoxConstraints(maxWidth: widget.maxWidth),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        margin: const EdgeInsets.symmetric(horizontal: 1),
        child: _SelectableOverlay(
          visible: math,
          overlayText: widget.originalLatex,
          fontSize: widget.fontSize,
        ),
      ),
    );
  }
}