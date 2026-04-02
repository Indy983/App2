import 'package:flutter/material.dart';
import 'graph_ui_base.dart';
import 'graph_painter.dart';

/// Graph Data 1: f(x) = x + 3
class _GraphData11 {
  static double function(double x) => -x * x * x + 6 * x * x - 8 * x + 4;
  
  
  // Graph bounds
  static const double yMin = -1;
  static const double yMax = 10.0;
  static const double xMin = -0.5;
  static const double xMax = 5.0;

  // Function drawing bounds (where to draw the curve)
  static const double functionXMin = -0.5;
  static const double functionXMax = 4.5;
  
  // Initial draggable points
  static const double initialXLeft = -10.0;
  static const double initialXRight = 2.0;
  
  // Drag constraints
  static const double dragMinLeft = -10.0;
  static const double dragMaxLeft = -10;
  static const double dragMinRight = 0.25;
  static const double dragMaxRight = 4.0;
  
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

/// ✅ Export this widget - Ready to use from path
Widget getGraphWidget() {
  return GraphUIBase(
    functionDef: _GraphData11.functionDefinition,
    xMin: _GraphData11.xMin,
    xMax: _GraphData11.xMax,
    yMin: _GraphData11.yMin,
    yMax: _GraphData11.yMax,
    functionXMin: _GraphData11.functionXMin,
    functionXMax: _GraphData11.functionXMax,
    initialXLeft: _GraphData11.initialXLeft,
    initialXRight: _GraphData11.initialXRight,
    dragMinLeft: _GraphData11.dragMinLeft,
    dragMaxLeft: _GraphData11.dragMaxLeft,
    dragMinRight: _GraphData11.dragMinRight,
    dragMaxRight: _GraphData11.dragMaxRight,
    yScale: _GraphData11.yScale,
    functionStrokeWidth: _GraphData11.functionStrokeWidth,
    pointRadius: _GraphData11.pointRadius,
    axisStrokeWidth: _GraphData11.axisStrokeWidth,
    padding: _GraphData11.padding,
    xTicks: _GraphData11.xTicks,
    yTicks: _GraphData11.yTicks,
    functionColor: Color(_GraphData11.functionColor),
    leftPointColor: Color(_GraphData11.leftPointColor),
    rightPointColor: Color(_GraphData11.rightPointColor),
  );
}

/// Alternative: Export as a constant variable
final Widget graph = getGraphWidget();