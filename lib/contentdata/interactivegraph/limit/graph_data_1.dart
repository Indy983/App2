import 'package:flutter/material.dart';
import 'graph_ui_base.dart';
import 'graph_painter.dart';

/// Graph Data 1: f(x) = x + 3
class _GraphData1 {
  static double function(double x) => x + 3;
  
  static const String expression = 'f(x) = x + 3';
  
  // Graph bounds (axes display bounds)
  static const double xMin = -0.5;
  static const double xMax = 5.0;
  static const double yMin = -1.0;
  static const double yMax = 10.0;
  
  // Function drawing bounds (where to draw the curve)
  static const double functionXMin = 0;
  static const double functionXMax = 5;
  
  // Initial draggable points
  static const double initialXLeft = 1.0;
  static const double initialXRight = 3.0;
  
  // Drag constraints
  static const double dragMinLeft = 0.0;
  static const double dragMaxLeft = 1.99;
  static const double dragMinRight = 2.01;
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
    functionDef: _GraphData1.functionDefinition,
    xMin: _GraphData1.xMin,
    xMax: _GraphData1.xMax,
    yMin: _GraphData1.yMin,
    yMax: _GraphData1.yMax,
    functionXMin: _GraphData1.functionXMin,
    functionXMax: _GraphData1.functionXMax,
    initialXLeft: _GraphData1.initialXLeft,
    initialXRight: _GraphData1.initialXRight,
    dragMinLeft: _GraphData1.dragMinLeft,
    dragMaxLeft: _GraphData1.dragMaxLeft,
    dragMinRight: _GraphData1.dragMinRight,
    dragMaxRight: _GraphData1.dragMaxRight,
    yScale: _GraphData1.yScale,
    functionStrokeWidth: _GraphData1.functionStrokeWidth,
    pointRadius: _GraphData1.pointRadius,
    axisStrokeWidth: _GraphData1.axisStrokeWidth,
    padding: _GraphData1.padding,
    xTicks: _GraphData1.xTicks,
    yTicks: _GraphData1.yTicks,
    functionColor: Color(_GraphData1.functionColor),
    leftPointColor: Color(_GraphData1.leftPointColor),
    rightPointColor: Color(_GraphData1.rightPointColor),
  );
}

/// Alternative: Export as a constant variable
final Widget graph = getGraphWidget();