import 'package:flutter/material.dart';
import 'venn_diagram_painter.dart';
import 'venn_diagram_data.dart';

class VennDiagramUIBase extends StatefulWidget {
  final int intersectionCount;
  final Color colorA;
  final Color colorB;
  final Color colorIntersection;
  final Color colorUniverse;
  final Color unselectedColor;
  final Map<VennOperation, String> operationLabels;

  const VennDiagramUIBase({
    Key? key,
    required this.intersectionCount,
    required this.colorA,
    required this.colorB,
    required this.colorIntersection,
    required this.colorUniverse,
    required this.unselectedColor,
    required this.operationLabels,
  }) : super(key: key);

  @override
  State<VennDiagramUIBase> createState() => _VennDiagramUIBaseState();
}

class _VennDiagramUIBaseState extends State<VennDiagramUIBase> {
  VennOperation? _selectedOperation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // --- Operation Cards ---
          _buildOperationCards(),

          const SizedBox(height: 24),

          // --- Venn Diagram Canvas ---
          Container(
            width: 250, // Fixed width for the diagram
            height: 210, // Fixed height for the diagram
            child: CustomPaint(
              painter: VennDiagramPainter(
                selectedOperation: _selectedOperation,
                intersectionCount: widget.intersectionCount,
                colorA: widget.colorA,
                colorB: widget.colorB,
                colorIntersection: widget.colorIntersection,
                colorUniverse: widget.colorUniverse,
                unselectedColor: widget.unselectedColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Helper widget to build the row of tappable cards.
  Widget _buildOperationCards() {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      alignment: WrapAlignment.center,
      children: VennOperation.values.map((operation) {
        final isSelected = _selectedOperation == operation;
        return GestureDetector(
          onTap: () {
            setState(() {
              // Toggle selection: if tapping the same card, deselect it.
              if (isSelected) {
                _selectedOperation = null;
              } else {
                _selectedOperation = operation;
              }
            });
          },
          child: Chip(
            label: Text(
              widget.operationLabels[operation]!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.black87,
              ),
            ),
            backgroundColor: isSelected ? Theme.of(context).primaryColor : const Color(0xFFF0F0F0),
            elevation: isSelected ? 4 : 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                color: isSelected ? Colors.transparent : Colors.grey.shade300,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          ),
        );
      }).toList(),
    );
  }
}