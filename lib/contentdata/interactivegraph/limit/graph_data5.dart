import 'package:flutter/material.dart';
import 'graph_ui_base.dart';
import 'graph_painter.dart';

/// Graph Data 2: f(x) = (x²-4)/(x-2) with hole at x=2
class _GraphData5 {
  static double function(double x) {
    // Check if x is very close to 2 (within tolerance)
    if ((x - 2.0).abs() < 0.001) {
      // Return NaN to create discontinuity at x = 2
      return double.nan;
    }
    // For all other x values, calculate (x²-4)/(x-2)
    // This algebraically simplifies to x + 2 for x ≠ 2
    return (x * x + x - 6) / (x - 2);
  }

  // Graph bounds - centered around the interesting area
  static const double yMin = -1.0;
  static const double yMax = 10;
  static const double xMin = -0.5;
  static const double xMax = 5.0;

  // Function drawing bounds (where to draw the curve)
  static const double functionXMin = 0;
  static const double functionXMax = 5;
  
  // Initial draggable points - positioned to avoid the discontinuity
  static const double initialXLeft = 0.5;
  static const double initialXRight = 3.5;
  
  // Drag constraints - prevent dragging too close to x = 2
  static const double dragMinLeft = 0.0;
  static const double dragMaxLeft = 1.99;  // Stop before x = 2
  static const double dragMinRight = 2.01; // Start after x = 2
  static const double dragMaxRight = 4.5;
  
  // Scale settings
  static const double yScale = 0.5;
  static const double functionStrokeWidth = 6.0;
  static const double pointRadius = 6.5;
  static const double axisStrokeWidth = 3.0;
  static const double padding = 20.0;
  
  // Tick marks - show important values
  static const List<int> xTicks = [1, 2, 3, 4];
  static const List<int> yTicks = [2, 4, 6, 8];
  
  // Colors
  static const int functionColor = 0xFFA9BFFD;
  static const int leftPointColor = 0xFF4F8DFB;
  static const int rightPointColor = 0xFFF8834F;

  // Create FunctionDefinition with hole at (2, 4)
  static FunctionDefinition get functionDefinition => FunctionDefinition(
    mainFunction: function,
    specialPoints: [
      // Hole at x=2, y=4 (where the function would be if continuous)
      // Since (x²-4)/(x-2) = (x+2)(x-2)/(x-2) = x+2 for x≠2
      // At x=2: y would be 2+2 = 4
      SpecialPoint(x: 2.0, y: 5.0, isFilled: false),
    ],
    discontinuities: [2.0], // Function is discontinuous at x = 2
  );
}

/// Export this widget - Shows (x²-4)/(x-2) with hole at (2,4)
Widget getGraphWidget() {
  return GraphUIBase(
    functionDef: _GraphData5.functionDefinition,
    xMin: _GraphData5.xMin,
    xMax: _GraphData5.xMax,
    yMin: _GraphData5.yMin,
    yMax: _GraphData5.yMax,
    functionXMin: _GraphData5.functionXMin,
    functionXMax: _GraphData5.functionXMax,
    initialXLeft: _GraphData5.initialXLeft,
    initialXRight: _GraphData5.initialXRight,
    dragMinLeft: _GraphData5.dragMinLeft,
    dragMaxLeft: _GraphData5.dragMaxLeft,
    dragMinRight: _GraphData5.dragMinRight,
    dragMaxRight: _GraphData5.dragMaxRight,
    yScale: _GraphData5.yScale,
    functionStrokeWidth: _GraphData5.functionStrokeWidth,
    pointRadius: _GraphData5.pointRadius,
    axisStrokeWidth: _GraphData5.axisStrokeWidth,
    padding: _GraphData5.padding,
    xTicks: _GraphData5.xTicks,
    yTicks: _GraphData5.yTicks,
    functionColor: Color(_GraphData5.functionColor),
    leftPointColor: Color(_GraphData5.leftPointColor),
    rightPointColor: Color(_GraphData5.rightPointColor),
  );
}

/// Alternative: Export as a constant variable
final Widget graph = getGraphWidget();

/// Helper function to get the simplified form value at any x
/// This is useful for understanding what the function "should" be at x=2
double getSimplifiedValue(double x) {
  return x + 2; // The simplified form of (x²-4)/(x-2) for x ≠ 2
}

/// Utility function to check if a point is near the discontinuity
bool isNearDiscontinuity(double x, {double tolerance = 0.1}) {
  return (x - 2.0).abs() < tolerance;
}

/// Educational function to show the algebraic simplification
String getAlgebraicExplanation() {
  return '''
f(x) = (x²-4)/(x-2)
     = (x+2)(x-2)/(x-2)    [Factor numerator]
     = x+2                  [Cancel (x-2) terms for x≠2]
     
The function is undefined at x=2, creating a "hole" at the point (2,4).
''';
}