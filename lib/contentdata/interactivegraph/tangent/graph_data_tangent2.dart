import 'package:flutter/material.dart';
import 'graph_ui_tangent.dart';
import 'graph_painter_tangent.dart';

/// Graph Data for Tangent Line: Function f(x) = -x³ + 3x² - 2x with a single point showing tangent line
class _GraphDataTangent {
  // Function: f(x) = -x³ + 3x² - 2x
  static double function(double x) => x * x * x - 3 * x * x + 4;
  
  // Derivative: f'(x) = -3x² + 6x - 2 (for tangent line calculation)
  static double derivative(double x) => 3 * x * x - 6 * x;

  // Graph bounds
  static const double yMin = -7;
  static const double yMax = 7;
  static const double xMin = -3;
  static const double xMax = 3;

  // Function drawing bounds (where to draw the curve)
  static const double functionXMin = -1.75;
  static const double functionXMax = 4;
  
  // Initial draggable point - single point (orange) for tangent line
  static const double initialXTangent = 1.0; // Starting at x = 1
  
  // Drag constraints - allow the tangent point to move along the function
  static const double dragMinTangent = -1.5;
  static const double dragMaxTangent = 2.75;
  
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
  static const int functionColor = 0xFFA9BFFD; // Original function curve color
  static const int tangentPointColor = 0xFFF8834F; // Orange point
  static const int tangentLineColor = 0xFFFDCBA9; // Green color for tangent line

  // Tangent line settings
  static const double tangentLineMinLength = 1.2; // Minimum half-length of tangent line
  static const double tangentLineExtensionRatio = 0.4; // Extension ratio (40% on each side)

  // Create TangentFunctionDefinition
  static TangentFunctionDefinition get functionDefinition => TangentFunctionDefinition(
    mainFunction: function,
    derivativeFunction: derivative,
    specialPoints: [], // No special points for this continuous function
    discontinuities: null, // No discontinuities
    tangentLineColor: Color(tangentLineColor),
    tangentLineMinLength: tangentLineMinLength,
    tangentLineExtensionRatio: tangentLineExtensionRatio,
  );
}

/// Main widget function
Widget getGraphWidget() {
  return GraphUITangent(
    functionDef: _GraphDataTangent.functionDefinition,
    xMin: _GraphDataTangent.xMin,
    xMax: _GraphDataTangent.xMax,
    yMin: _GraphDataTangent.yMin,
    yMax: _GraphDataTangent.yMax,
    functionXMin: _GraphDataTangent.functionXMin,
    functionXMax: _GraphDataTangent.functionXMax,
    initialXTangent: _GraphDataTangent.initialXTangent,
    dragMinTangent: _GraphDataTangent.dragMinTangent,
    dragMaxTangent: _GraphDataTangent.dragMaxTangent,
    yScale: _GraphDataTangent.yScale,
    functionStrokeWidth: _GraphDataTangent.functionStrokeWidth,
    pointRadius: _GraphDataTangent.pointRadius,
    axisStrokeWidth: _GraphDataTangent.axisStrokeWidth,
    padding: _GraphDataTangent.padding,
    xTicks: _GraphDataTangent.xTicks,
    yTicks: _GraphDataTangent.yTicks,
    functionColor: Color(_GraphDataTangent.functionColor),
    tangentPointColor: Color(_GraphDataTangent.tangentPointColor),
  );
}

/// Alternative: Export as a constant variable (backward compatibility)
final Widget graph = getGraphWidget();