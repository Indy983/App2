import 'package:flutter/material.dart';
import 'venn_diagram_ui_base.dart';

/// Enum to define the possible Venn diagram operations the user can select.
enum VennOperation {
  A,
  B,
  A_INTERSECT_B,
  A_UNION_B,
  A_COMPLEMENT,
  B_COMPLEMENT,
  A_MINUS_B,
  B_MINUS_A
}

/// Data class to hold all configuration for the Venn Diagram.
class _VennDiagramData {
  // --- Data Configuration ---
  // You can change these values to alter the diagram's data.

  // Number of elements in the intersection of A and B.
  // If set to 0, the circles will not overlap.
  static const int intersectionCount = 10;

  // --- Visual Configuration ---

  // Colors for each part of the diagram.
  static const Color colorA = Color(0xFF4F8DFB); // Blue
  static const Color colorB = Color(0xFFF8834F); // Orange
  static const Color colorIntersection = Color(0xFF6A5ACD); // Slate Blue
  static const Color colorUniverse = Color.fromARGB(255, 236, 236, 236);

  // A light gray color for sections that are not selected.
  static const Color unselectedColor = Color(0xFFE0E0E0);

  // Labels for the operation cards.
  static const Map<VennOperation, String> operationLabels = {
    VennOperation.A: 'A',
    VennOperation.B: 'B',
    VennOperation.A_UNION_B: 'A ∪ B',
    VennOperation.A_INTERSECT_B: 'A ∩ B',
    VennOperation.A_COMPLEMENT: "A'",
    VennOperation.B_COMPLEMENT: "B'",
    VennOperation.A_MINUS_B: 'A - B',
    VennOperation.B_MINUS_A: 'B - A',
  };
}

/// ✅ Export this widget - Ready to use from anywhere in the app.
///
/// This function constructs the Venn Diagram UI with the data defined above.
Widget getVennDiagramWidget() {
  return VennDiagramUIBase(
    intersectionCount: _VennDiagramData.intersectionCount,
    colorA: _VennDiagramData.colorA,
    colorB: _VennDiagramData.colorB,
    colorIntersection: _VennDiagramData.colorIntersection,
    colorUniverse: _VennDiagramData.colorUniverse,
    unselectedColor: _VennDiagramData.unselectedColor,
    operationLabels: _VennDiagramData.operationLabels,
  );
}