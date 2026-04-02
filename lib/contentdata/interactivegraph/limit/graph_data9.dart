import 'package:flutter/material.dart';
import 'graph_ui_base.dart';
import 'graph_painter.dart';

class _GraphData9 {
  static double function(double x) {
    // Function: |x²-x|/(1-x)
    // Discontinuity at x = 1 (division by zero)
    
    if (x == 1.0) {
      return double.nan; // Undefined at x = 1
    }
    
    double numerator = x * x - x; // x²-x = x(x-1)
    double denominator = 1.0 - x;
    
    // Calculate |x²-x|/(1-x)
    double absNumerator = numerator.abs();
    double result = absNumerator / denominator;
    
    return result;
  }
  
  // Alternative simplified calculation based on mathematical analysis:
  static double functionSimplified(double x) {
    if (x == 1.0) {
      return double.nan; // Undefined at x = 1
    }
    
    if (x < 0.0) {
      // For x < 0: |x(x-1)|/(1-x) = x(x-1)/(1-x) = -x
      return -x;
    } else if (x > 0.0 && x < 1.0) {
      // For 0 < x < 1: |x(x-1)|/(1-x) = x(1-x)/(1-x) = x
      return x;
    } else if (x > 1.0) {
      // For x > 1: |x(x-1)|/(1-x) = x(x-1)/(1-x) = -x
      return -x;
    }
    
    return double.nan;
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
  static const double dragMaxLeft = 0.99;  // Changed to avoid x = 1
  static const double dragMinRight = 1.01; // Changed to avoid x = 1
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
  
  // Create FunctionDefinition with discontinuity at x=1
  static FunctionDefinition get functionDefinition => FunctionDefinition(
    mainFunction: functionSimplified, // Using the simplified version
    specialPoints: [
      // The function approaches different limits from left and right at x=1
      // As x→1⁻: f(x) = x → 1
      // As x→1⁺: f(x) = -x → -1
      
      // Left limit: lim(x→1⁻) f(x) = 1
      SpecialPoint(x: 1.0, y: 1.0, isFilled: false),
      
      // Right limit: lim(x→1⁺) f(x) = -1  
      SpecialPoint(x: 1.0, y: -1.0, isFilled: false),
    ],
    discontinuities: [1.0], // Vertical asymptote at x = 1
  );
}

/// Export this widget - Shows function |x²-x|/(1-x)
Widget getGraphWidget() {
  return GraphUIBase(
    functionDef: _GraphData9.functionDefinition,
    xMin: _GraphData9.xMin,
    xMax: _GraphData9.xMax,
    yMin: _GraphData9.yMin,
    yMax: _GraphData9.yMax,
    functionXMin: _GraphData9.functionXMin,
    functionXMax: _GraphData9.functionXMax,
    initialXLeft: _GraphData9.initialXLeft,
    initialXRight: _GraphData9.initialXRight,
    dragMinLeft: _GraphData9.dragMinLeft,
    dragMaxLeft: _GraphData9.dragMaxLeft,
    dragMinRight: _GraphData9.dragMinRight,
    dragMaxRight: _GraphData9.dragMaxRight,
    yScale: _GraphData9.yScale,
    functionStrokeWidth: _GraphData9.functionStrokeWidth,
    pointRadius: _GraphData9.pointRadius,
    axisStrokeWidth: _GraphData9.axisStrokeWidth,
    padding: _GraphData9.padding,
    xTicks: _GraphData9.xTicks,
    yTicks: _GraphData9.yTicks,
    functionColor: Color(_GraphData9.functionColor),
    leftPointColor: Color(_GraphData9.leftPointColor),
    rightPointColor: Color(_GraphData9.rightPointColor),
  );
}

/// Alternative: Export as a constant variable
final Widget graph = getGraphWidget();