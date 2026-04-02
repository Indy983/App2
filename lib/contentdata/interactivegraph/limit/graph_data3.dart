import 'package:flutter/material.dart';
import 'graph_ui_base.dart';
import 'graph_painter.dart';

/// Graph Data 3: f(x) = x² + 2x - 3 (Enhanced version with backward compatibility)
class _GraphData3 {
  static double function(double x) => x * x + 2*x - 3;

  // Graph bounds
  static const double yMin = -6.0;
  static const double yMax = 6.0;
  static const double xMin = -3.0;
  static const double xMax = 3.0;

  // Function drawing bounds (where to draw the curve)
  static const double functionXMin = -2.7;
  static const double functionXMax = 2.2;
  
  // Initial draggable points
  static const double initialXLeft = -1.5;
  static const double initialXRight = 2.0;
  
  // Drag constraints
  static const double dragMinLeft = -2.5;
  static const double dragMaxLeft = 0.99;
  static const double dragMinRight = 1.01;
  static const double dragMaxRight = 2.1;
  
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

  // Create FunctionDefinition for enhanced system (regular continuous function)
  static FunctionDefinition get functionDefinition => FunctionDefinition(
    mainFunction: function,
    specialPoints: [], // No special points for regular continuous function
    discontinuities: null, // No discontinuities
  );
}

/// Main widget function - uses enhanced system but maintains same interface
Widget getGraphWidget() {
  return GraphUIBase(
    functionDef: _GraphData3.functionDefinition,
    xMin: _GraphData3.xMin,
    xMax: _GraphData3.xMax,
    yMin: _GraphData3.yMin,
    yMax: _GraphData3.yMax,
    functionXMin: _GraphData3.functionXMin,
    functionXMax: _GraphData3.functionXMax,
    initialXLeft: _GraphData3.initialXLeft,
    initialXRight: _GraphData3.initialXRight,
    dragMinLeft: _GraphData3.dragMinLeft,
    dragMaxLeft: _GraphData3.dragMaxLeft,
    dragMinRight: _GraphData3.dragMinRight,
    dragMaxRight: _GraphData3.dragMaxRight,
    yScale: _GraphData3.yScale,
    functionStrokeWidth: _GraphData3.functionStrokeWidth,
    pointRadius: _GraphData3.pointRadius,
    axisStrokeWidth: _GraphData3.axisStrokeWidth,
    padding: _GraphData3.padding,
    xTicks: _GraphData3.xTicks,
    yTicks: _GraphData3.yTicks,
    functionColor: Color(_GraphData3.functionColor),
    leftPointColor: Color(_GraphData3.leftPointColor),
    rightPointColor: Color(_GraphData3.rightPointColor),
  );
}

/// Alternative: Export as a constant variable (backward compatibility)
final Widget graph = getGraphWidget();

/// Backward compatibility function for old-style function calls
Widget getGraphWidgetFromFunction({
  required double Function(double) function,
  double yMin = -6.0,
  double yMax = 6.0,
  double xMin = -3.0,
  double xMax = 3.0,
  double functionXMin = -2.7,
  double functionXMax = 2.2,
  double initialXLeft = -1.5,
  double initialXRight = 2.0,
  double dragMinLeft = -2.5,
  double dragMaxLeft = 0.99,
  double dragMinRight = 1.01,
  double dragMaxRight = 2.1,
  double yScale = 0.5,
  double functionStrokeWidth = 6.0,
  double pointRadius = 6.5,
  double axisStrokeWidth = 3.0,
  double padding = 20.0,
  List<int> xTicks = const [-2, -1, 1, 2],
  List<int> yTicks = const [-4, -2, 2, 4],
  int functionColor = 0xFFA9BFFD,
  int leftPointColor = 0xFF4F8DFB,
  int rightPointColor = 0xFFF8834F,
  List<SpecialPoint>? specialPoints,
  List<double>? discontinuities,
}) {
  final functionDef = FunctionDefinition(
    mainFunction: function,
    specialPoints: specialPoints ?? [],
    discontinuities: discontinuities,
  );

  return GraphUIBase(
    functionDef: functionDef,
    xMin: xMin,
    xMax: xMax,
    yMin: yMin,
    yMax: yMax,
    functionXMin: functionXMin,
    functionXMax: functionXMax,
    initialXLeft: initialXLeft,
    initialXRight: initialXRight,
    dragMinLeft: dragMinLeft,
    dragMaxLeft: dragMaxLeft,
    dragMinRight: dragMinRight,
    dragMaxRight: dragMaxRight,
    yScale: yScale,
    functionStrokeWidth: functionStrokeWidth,
    pointRadius: pointRadius,
    axisStrokeWidth: axisStrokeWidth,
    padding: padding,
    xTicks: xTicks,
    yTicks: yTicks,
    functionColor: Color(functionColor),
    leftPointColor: Color(leftPointColor),
    rightPointColor: Color(rightPointColor),
  );
}