import 'package:flutter/material.dart';
import 'graph_ui_base.dart';
import 'graph_painter.dart';

class _GraphData10 {
  static double function(double x) {
    // Function: 2/x
    // Discontinuity at x = 0 (division by zero)
    
    if (x == 0.0) {
      return double.nan; // Undefined at x = 0
    }
    
    return 2.0 / x;
  }
  
  // Graph bounds
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
  static const double dragMaxLeft = -0.01;  // Changed to avoid x = 0
  static const double dragMinRight = 0.01; // Changed to avoid x = 0
  static const double dragMaxRight = 3.0;
  
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
  
  // Create FunctionDefinition with discontinuity at x=0
  static FunctionDefinition get functionDefinition => FunctionDefinition(
    mainFunction: function,
    specialPoints: [
      // The function has a vertical asymptote at x=0
      // As x→0⁻: f(x) = 2/x → -∞
      // As x→0⁺: f(x) = 2/x → +∞
      
      // No special points needed for vertical asymptote
      // The function approaches infinity on both sides
    ],
    discontinuities: [0.0], // Vertical asymptote at x = 0
  );
}

/// Export this widget - Shows function 2/x
Widget getGraphWidget() {
  return GraphUIBase(
    functionDef: _GraphData10.functionDefinition,
    xMin: _GraphData10.xMin,
    xMax: _GraphData10.xMax,
    yMin: _GraphData10.yMin,
    yMax: _GraphData10.yMax,
    functionXMin: _GraphData10.functionXMin,
    functionXMax: _GraphData10.functionXMax,
    initialXLeft: _GraphData10.initialXLeft,
    initialXRight: _GraphData10.initialXRight,
    dragMinLeft: _GraphData10.dragMinLeft,
    dragMaxLeft: _GraphData10.dragMaxLeft,
    dragMinRight: _GraphData10.dragMinRight,
    dragMaxRight: _GraphData10.dragMaxRight,
    yScale: _GraphData10.yScale,
    functionStrokeWidth: _GraphData10.functionStrokeWidth,
    pointRadius: _GraphData10.pointRadius,
    axisStrokeWidth: _GraphData10.axisStrokeWidth,
    padding: _GraphData10.padding,
    xTicks: _GraphData10.xTicks,
    yTicks: _GraphData10.yTicks,
    functionColor: Color(_GraphData10.functionColor),
    leftPointColor: Color(_GraphData10.leftPointColor),
    rightPointColor: Color(_GraphData10.rightPointColor),
  );
}

/// Alternative: Export as a constant variable
final Widget graph = getGraphWidget();