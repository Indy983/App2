import 'package:flutter/material.dart';
import 'graph_ui_slope.dart';
import 'graph_painter_slope.dart';

/// Graph Data for Slope: Function f(x) = x² with two points connected by a secant line
class _GraphDataSlope {
  static double function(double x) => x * x; // f(x) = x²

  // Graph bounds - same as original graphs
  static const double yMin = -6.0;
  static const double yMax = 6.0;
  static const double xMin = -3.0;
  static const double xMax = 3.0;

  // Function drawing bounds (where to draw the curve)
  static const double functionXMin = -2.7;
  static const double functionXMax = 2.7;
  
  // Initial draggable points - positioned on the function curve
  static const double initialXLeft = -1;
  static const double initialXRight = 2.0;
  
  // Drag constraints - same as original graphs
  static const double dragMinLeft = -1;
  static const double dragMaxLeft = -1; // Fixed position
  static const double dragMinRight = -2.5;
  static const double dragMaxRight = 2.5;
  
  // Scale settings - exact same as original graphs
  static const double yScale = 0.5;
  static const double functionStrokeWidth = 6.0;
  static const double pointRadius = 6.5;
  static const double axisStrokeWidth = 3.0;
  static const double padding = 20.0;
  
  // Tick marks - same as original graphs
  static const List<int> xTicks = [-2, -1, 1, 2];
  static const List<int> yTicks = [-4, -2, 2, 4];
  
  // Colors - same as original graphs
  static const int functionColor = 0xFFA9BFFD; // Original function curve color
  static const int leftPointColor = 0xFF4F8DFB; // Blue point
  static const int rightPointColor = 0xFFF8834F; // Orange point
  static const int secantLineColor = 0xFFFDCBA9; // Green color with fade effect (similar to function color style)

  // Secant line settings
  static const double secantLineMinLength = 1.5; // Minimum half-length of secant line
  static const double secantLineExtensionRatio = 0.3; // Extension ratio (30% on each side)

  // Create FunctionDefinition for enhanced system (with secant line capability)
  static FunctionDefinition get functionDefinition => FunctionDefinition(
    mainFunction: function,
    specialPoints: [], // No special points for regular continuous function
    discontinuities: null, // No discontinuities
    hasSecantLine: true, // Enable secant line drawing
    secantLineColor: Color(secantLineColor),
    secantLineMinLength: secantLineMinLength, // NEW: Min length setting
    secantLineExtensionRatio: secantLineExtensionRatio, // NEW: Extension ratio setting
  );
}

/// Main widget function - uses enhanced system with secant line
Widget getGraphWidget() {
  return GraphUISlopeBase(
    functionDef: _GraphDataSlope.functionDefinition,
    xMin: _GraphDataSlope.xMin,
    xMax: _GraphDataSlope.xMax,
    yMin: _GraphDataSlope.yMin,
    yMax: _GraphDataSlope.yMax,
    functionXMin: _GraphDataSlope.functionXMin,
    functionXMax: _GraphDataSlope.functionXMax,
    initialXLeft: _GraphDataSlope.initialXLeft,
    initialXRight: _GraphDataSlope.initialXRight,
    dragMinLeft: _GraphDataSlope.dragMinLeft,
    dragMaxLeft: _GraphDataSlope.dragMaxLeft,
    dragMinRight: _GraphDataSlope.dragMinRight,
    dragMaxRight: _GraphDataSlope.dragMaxRight,
    yScale: _GraphDataSlope.yScale,
    functionStrokeWidth: _GraphDataSlope.functionStrokeWidth,
    pointRadius: _GraphDataSlope.pointRadius,
    axisStrokeWidth: _GraphDataSlope.axisStrokeWidth,
    padding: _GraphDataSlope.padding,
    xTicks: _GraphDataSlope.xTicks,
    yTicks: _GraphDataSlope.yTicks,
    functionColor: Color(_GraphDataSlope.functionColor),
    leftPointColor: Color(_GraphDataSlope.leftPointColor),
    rightPointColor: Color(_GraphDataSlope.rightPointColor),
    // Enable slope calculation and display
    showSlope: true,
    slopeFunction: _GraphDataSlope.function,
  );
}

/// Alternative: Export as a constant variable (backward compatibility)
final Widget graph = getGraphWidget();

