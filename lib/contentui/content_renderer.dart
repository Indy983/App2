import 'package:flutter/material.dart';
import 'drop_zone.dart';
import 'fill_box.dart';
import 'graph_registry.dart';
import 'math_content_parser.dart';

class ContentRenderer extends StatelessWidget {
  final List content;
  final Map? state;
  final String? questionId;
  final bool isChecked;
  final Color? Function(String id)? getBorderColor;
  final void Function(String zoneId, String value)? onDropAccept;
  final Map<String, TextEditingController>? boxControllers;
  final void Function(String boxId, String value)? onBoxChanged;

  const ContentRenderer({
    Key? key,
    required this.content,
    this.state,
    this.questionId,
    this.isChecked = false,
    this.getBorderColor,
    this.onDropAccept,
    this.boxControllers,
    this.onBoxChanged,
  }) : super(key: key);

  /// Flatten content list into a list of "tokens" where strings are split
  /// on newlines. A `null` token signals a line break.
  List<dynamic> _tokenize() {
    final tokens = <dynamic>[];
    for (final item in content) {
      if (item is String) {
        // Split on \n — keep surrounding whitespace trimmed per segment
        final lines = item.split('\n');
        for (int i = 0; i < lines.length; i++) {
          final line = lines[i].trim();
          if (line.isNotEmpty) tokens.add(line);
          // Insert a line-break sentinel between lines (not after the last one)
          if (i < lines.length - 1) tokens.add(null);
        }
      } else {
        tokens.add(item);
      }
    }
    return tokens;
  }

  /// Group tokens into rows split by null sentinels, then build a Column of
  /// Wrap widgets — one per row. Empty rows between two consecutive nulls
  /// add vertical spacing instead of an empty Wrap.
  @override
  Widget build(BuildContext context) {
    final tokens = _tokenize();

    // Split into rows on null sentinels
    final rows = <List<dynamic>>[];
    var current = <dynamic>[];
    for (final t in tokens) {
      if (t == null) {
        rows.add(current);
        current = [];
      } else {
        current.add(t);
      }
    }
    rows.add(current);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < rows.length; i++) ...[
          if (rows[i].isEmpty)
            const SizedBox(height: 4) // blank line → small gap
          else
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 4,
              runSpacing: 8,
              children: rows[i].map<Widget>(_buildToken).toList(),
            ),
          if (i < rows.length - 1) const SizedBox(height: 6),
        ],
      ],
    );
  }

  Widget _buildToken(dynamic item) {
    if (item is String) {
      return MathContentParser.buildBody(item);
    }

    if (item is Map) {
      if (item.containsKey('image')) {
        return SelectionContainer.disabled(
          child: _buildImage(item['image'] as String, item['caption'] as String?),
        );
      }

      if (item.containsKey('graph')) {
        return SelectionContainer.disabled(
          child: _buildGraph(item['graph'] as String),
        );
      }

      if (item.containsKey('drop')) {
        final zoneId = item['drop'] as String;
        return SelectionContainer.disabled(
          child: DropZone(
            zoneId: zoneId,
            currentValue: state?[questionId]?[zoneId],
            borderColor: getBorderColor?.call(zoneId),
            onAccept: onDropAccept != null ? (v) => onDropAccept!(zoneId, v) : null,
          ),
        );
      }

      if (item.containsKey('box')) {
        final boxId = item['box'] as String;
        return SelectionContainer.disabled(
          child: FillBox(
            boxId: boxId,
            controller: boxControllers![boxId]!,
            borderColor: getBorderColor?.call(boxId),
            enabled: !isChecked,
            onChanged: onBoxChanged != null ? (v) => onBoxChanged!(boxId, v) : null,
          ),
        );
      }
    }

    return const SizedBox.shrink();
  }

  Widget _buildImage(String path, String? caption) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          path,
          errorBuilder: (_, __, ___) => Container(
            height: 100,
            color: Colors.red[50],
            child: Center(child: Text("Image not found: $path")),
          ),
        ),
        if (caption != null && caption.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: MathContentParser.buildCaption(caption),
          ),
      ],
    );
  }

  Widget _buildGraph(String path) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: GraphRegistry.getGraph(path),
      ),
    );
  }
}