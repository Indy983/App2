import 'package:flutter/material.dart';
import 'graph_ui_base.dart';
import 'graph_painter.dart';

/// Conditional Function: f(x) = 6 when x=1, f(x) = x+3 when x≠1
class _GraphData6 {
  static double function(double x) {
    // For the main function, we draw x+3 everywhere
    // The special point at x=1 will override this visually
    return -x * x + 5;
  }
  

  // Graph bounds - show the interesting area around x=1
  static const double yMin = -6.5;
  static const double yMax = 6.5;
  static const double xMin = -3.25;
  static const double xMax = 3.25;

  // Function drawing bounds (where to draw the curve)
  static const double functionXMin = -3.25;
  static const double functionXMax = 3.25;
  
  // Initial draggable points
  static const double initialXLeft = -2.75;
  static const double initialXRight = 2.75;
  
  // Drag constraints
  static const double dragMinLeft = -2.9;
  static const double dragMaxLeft = -1.01;
  static const double dragMinRight = -0.99;
  static const double dragMaxRight = 2.9;
  
  // Scale settings
  static const double yScale = 0.5;
  static const double functionStrokeWidth = 6.0;
  static const double pointRadius = 6.5;
  static const double axisStrokeWidth = 3.0;
  static const double padding = 20.0;
  
  // Tick marks
  static const List<int> xTicks = [-2, -1, 1, 2];
  static const List<int> yTicks = [-4, -2, 2, 4];
  
  // Colors
  static const int functionColor = 0xFFA9BFFD;
  static const int leftPointColor = 0xFF4F8DFB;
  static const int rightPointColor = 0xFFF8834F;

  // Create FunctionDefinition with special points at x=1
  static FunctionDefinition get functionDefinition => FunctionDefinition(
    mainFunction: function,
    specialPoints: [
      // Hole at (1,4) - where the line y=x+3 would naturally be
      SpecialPoint(x: -1.0, y: 4.0, isFilled: false),
      // Filled point at (1,6) - the actual function value when x=1
      SpecialPoint(x: -1.0, y: 0.0, isFilled: true, color: Color(0xFFA9BFFD)),
    ],
    discontinuities: null, // Function is defined everywhere, just different values
  );
}

/// Export this widget - Shows conditional function with jump discontinuity
Widget getGraphWidget() {
  return GraphUIBase(
    functionDef: _GraphData6.functionDefinition,
    xMin: _GraphData6.xMin,
    xMax: _GraphData6.xMax,
    yMin: _GraphData6.yMin,
    yMax: _GraphData6.yMax,
    functionXMin: _GraphData6.functionXMin,
    functionXMax: _GraphData6.functionXMax,
    initialXLeft: _GraphData6.initialXLeft,
    initialXRight: _GraphData6.initialXRight,
    dragMinLeft: _GraphData6.dragMinLeft,
    dragMaxLeft: _GraphData6.dragMaxLeft,
    dragMinRight: _GraphData6.dragMinRight,
    dragMaxRight: _GraphData6.dragMaxRight,
    yScale: _GraphData6.yScale,
    functionStrokeWidth: _GraphData6.functionStrokeWidth,
    pointRadius: _GraphData6.pointRadius,
    axisStrokeWidth: _GraphData6.axisStrokeWidth,
    padding: _GraphData6.padding,
    xTicks: _GraphData6.xTicks,
    yTicks: _GraphData6.yTicks,
    functionColor: Color(_GraphData6.functionColor),
    leftPointColor: Color(_GraphData6.leftPointColor),
    rightPointColor: Color(_GraphData6.rightPointColor),
  );
}

/// Alternative: Export as a constant variable
final Widget graph = getGraphWidget();

/// Helper function to get the actual function value (including the special case)
double getActualFunctionValue(double x) {
  if ((x + 1.0).abs() < 0.001) {
    return 5.0; // Special value when x = 1
  }
  return  -x * x + 5; // Normal case when x ≠ 1
}

/// Helper function to get the limit as x approaches 1
double getLimitAsXApproaches1() {
  return 1.0 + 3.0; // limit of (x+3) as x→1 = 4
}

/// Function to check if there's a jump discontinuity at x=1
bool hasJumpDiscontinuity() {
  final actualValue = getActualFunctionValue(1.0);    // f(1) = 6
  final limitValue = getLimitAsXApproaches1();         // lim(x→1) f(x) = 4
  return actualValue != limitValue;                    // 6 ≠ 4, so yes!
}

/// Educational explanation of this function
String getFunctionExplanation() {
  return '''
This is a piecewise function with a jump discontinuity at x = 1:

f(x) = { 6     when x = 1
       { x+3   when x ≠ 1

Key properties:
• f(1) = 6 (filled circle at (1,6))
• lim(x→1) f(x) = 4 (empty circle at (1,4))
• Since f(1) ≠ lim(x→1) f(x), the function has a jump discontinuity
• The function is defined everywhere but not continuous at x = 1
''';
}

/// Get coordinates of special points for reference
Map<String, Map<String, double>> getSpecialPoints() {
  return {
    'hole': {'x': -1.0, 'y': 3.0},      // Where the line would be
    'actual': {'x': -1.0, 'y': -4.0},    // Where the function actually is
  };
}