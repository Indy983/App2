import 'package:flutter/material.dart';
import 'math_content_parser.dart';
import 'graph_registry.dart';

class DropZone extends StatelessWidget {
  final String zoneId;
  final String? currentValue;
  final Color? borderColor;
  final void Function(String value)? onAccept;

  const DropZone({
    Key? key,
    required this.zoneId,
    this.currentValue,
    this.borderColor,
    this.onAccept,
  }) : super(key: key);

  bool get _isGraph => currentValue?.startsWith('graph:') == true;
  String get _graphPath => currentValue!.substring('graph:'.length);

  @override
  Widget build(BuildContext context) {
    return DragTarget<String>(
      onAccept: onAccept,
      builder: (context, candidateData, _) {
        final isHovering = candidateData.isNotEmpty;
        final effectiveBorder = borderColor ??
            (isHovering ? Colors.blue[700]! : Colors.grey[400]!);

        return AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          height: _isGraph ? 120 : 40,
          constraints: BoxConstraints(
            minWidth: _isGraph ? 100 : 60,
            maxWidth: _isGraph ? 160 : 120,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: isHovering ? Colors.blue[50] : Colors.grey[100],
            border: Border.all(
              color: effectiveBorder,
              width: borderColor != null ? 2 : 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(child: _buildContent()),
        );
      },
    );
  }

  Widget _buildContent() {
    if (currentValue == null || currentValue!.isEmpty) {
      // Empty placeholder
      return MathContentParser.buildSmall('', color: Colors.grey[400]);
    }

    if (_isGraph) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: GraphRegistry.getGraph(_graphPath),
      );
    }

    // Plain text or LaTeX — MathContentParser handles both
    return MathContentParser.buildSmall(
      currentValue!,
      fontWeight: FontWeight.bold,
    );
  }
}