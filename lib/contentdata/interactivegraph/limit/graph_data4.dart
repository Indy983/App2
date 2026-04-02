import 'package:flutter/material.dart';
import 'graph_ui_base.dart';
import 'graph_painter.dart';

/// Graph Data 4: f(x) = x² - 2x + 2
class _GraphData4 {
  static double function(double x) => x * x - 2*x + 2 ;
  
  // Graph bounds
  static const double yMin = -1.0;
  static const double yMax = 10.0;
  static const double xMin = -0.5;
  static const double xMax = 5.0;

  // Function drawing bounds (where to draw the curve)
  static const double functionXMin = -0.25;
  static const double functionXMax = 4.2;
  
  // Initial draggable points
  static const double initialXLeft = 1.0;
  static const double initialXRight = 3.0;
  
  // Drag constraints
  static const double dragMinLeft = 0.0;
  static const double dragMaxLeft = 1.99;
  static const double dragMinRight = 2.01;
  static const double dragMaxRight = 3.75;
  
  // Scale settings
  static const double yScale = 0.5;
  static const double functionStrokeWidth = 6.0;
  static const double pointRadius = 6.5;
  static const double axisStrokeWidth = 3.0;
  static const double padding = 20.0;
  
  // Tick marks
  static const List<int> xTicks = [1, 2, 3, 4];
  static const List<int> yTicks = [2, 4, 6, 8];
  
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

Widget getGraphWidget() {
  return GraphUIBase(
    functionDef: _GraphData4.functionDefinition,
    xMin: _GraphData4.xMin,
    xMax: _GraphData4.xMax,
    yMin: _GraphData4.yMin,
    yMax: _GraphData4.yMax,
    functionXMin: _GraphData4.functionXMin,
    functionXMax: _GraphData4.functionXMax,
    initialXLeft: _GraphData4.initialXLeft,
    initialXRight: _GraphData4.initialXRight,
    dragMinLeft: _GraphData4.dragMinLeft,
    dragMaxLeft: _GraphData4.dragMaxLeft,
    dragMinRight: _GraphData4.dragMinRight,
    dragMaxRight: _GraphData4.dragMaxRight,
    yScale: _GraphData4.yScale,
    functionStrokeWidth: _GraphData4.functionStrokeWidth,
    pointRadius: _GraphData4.pointRadius,
    axisStrokeWidth: _GraphData4.axisStrokeWidth,
    padding: _GraphData4.padding,
    xTicks: _GraphData4.xTicks,
    yTicks: _GraphData4.yTicks,
    functionColor: Color(_GraphData4.functionColor),
    leftPointColor: Color(_GraphData4.leftPointColor),
    rightPointColor: Color(_GraphData4.rightPointColor),
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