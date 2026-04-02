import 'package:flutter/material.dart';
import 'graph_ui_base.dart';
import 'graph_painter.dart';

/// Graph Data 6: Piecewise function with three parts
/// f(x) = { x+1        for x ∈ [-3,1)
///        { 5          for x = 1
///        { x²-2x+3    for x ∈ (1,3]
class _GraphData8 {
  static double function(double x) {
    if (x < 1.0) {
      // For x ∈ [-3,1): f(x) = x + 1
      return -x + 3;
    } else if (x > 1.0) {
      // For x ∈ (1,3]: f(x) = x² - 2x + 3
      return x * x - 2 * x + 3;
    } else {
      // This shouldn't be called since we handle x=1 with special points
      // But if it is, return NaN to indicate discontinuity handling
      return double.nan;
    }
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
  static const double dragMaxLeft = -1.01;
  static const double dragMinRight = -0.99;
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

  // Create FunctionDefinition with special points at x=1
  static FunctionDefinition get functionDefinition => FunctionDefinition(
    mainFunction: function,
    specialPoints: [
      // Filled point at (1,2) - endpoint of left piece: f(1) = 1+1 = 2 (but this is excluded)
      SpecialPoint(x: 1.0, y: 2.0, isFilled: false),
      
      // Filled point at (1,5) - actual function value: f(1) = 5
      SpecialPoint(x: 1.0, y: 5.0, isFilled: true, color: Color(0xFFA9BFFD)),
      
      // Hole at (1,2) - where right piece would start: when x→1⁺, f(x) = 1²-2(1)+3 = 2
      SpecialPoint(x: 1.0, y: 2.0, isFilled: false),
    ],
    discontinuities: [1.0], // Function changes definition at x = 1
  );
}

/// Export this widget - Shows complex piecewise function
Widget getGraphWidget() {
  return GraphUIBase(
    functionDef: _GraphData8.functionDefinition,
    xMin: _GraphData8.xMin,
    xMax: _GraphData8.xMax,
    yMin: _GraphData8.yMin,
    yMax: _GraphData8.yMax,
    functionXMin: _GraphData8.functionXMin,
    functionXMax: _GraphData8.functionXMax,
    initialXLeft: _GraphData8.initialXLeft,
    initialXRight: _GraphData8.initialXRight,
    dragMinLeft: _GraphData8.dragMinLeft,
    dragMaxLeft: _GraphData8.dragMaxLeft,
    dragMinRight: _GraphData8.dragMinRight,
    dragMaxRight: _GraphData8.dragMaxRight,
    yScale: _GraphData8.yScale,
    functionStrokeWidth: _GraphData8.functionStrokeWidth,
    pointRadius: _GraphData8.pointRadius,
    axisStrokeWidth: _GraphData8.axisStrokeWidth,
    padding: _GraphData8.padding,
    xTicks: _GraphData8.xTicks,
    yTicks: _GraphData8.yTicks,
    functionColor: Color(_GraphData8.functionColor),
    leftPointColor: Color(_GraphData8.leftPointColor),
    rightPointColor: Color(_GraphData8.rightPointColor),
  );
}

/// Alternative: Export as a constant variable
final Widget graph = getGraphWidget();

/// Helper function to get the actual function value at any x
double getActualFunctionValue(double x) {
  if (x >= -3.0 && x < 1.0) {
    return x + 1;           // Left piece: x + 1
  } else if (x == 1.0) {
    return 5.0;             // Special value at x = 1
  } else if (x > 1.0 && x <= 3.0) {
    return x * x - 2 * x + 3;  // Right piece: x² - 2x + 3
  } else {
    return double.nan;      // Outside domain
  }
}

/// Get the left-hand limit at x = 1
double getLeftLimit() {
  return 1.0 + 1.0;  // lim(x→1⁻) (x+1) = 2
}

/// Get the right-hand limit at x = 1
double getRightLimit() {
  return 1.0 * 1.0 - 2 * 1.0 + 3.0;  // lim(x→1⁺) (x²-2x+3) = 2
}

/// Check if the function is continuous at x = 1
bool isContinuousAtOne() {
  final leftLim = getLeftLimit();      // 2
  final rightLim = getRightLimit();    // 2
  final actualValue = getActualFunctionValue(1.0);  // 5
  
  // For continuity: f(1) = lim(x→1⁻) f(x) = lim(x→1⁺) f(x)
  return (leftLim == rightLim) && (actualValue == leftLim);
}

/// Get information about the function's behavior at x = 1
Map<String, double> getDiscontinuityInfo() {
  return {
    'leftLimit': getLeftLimit(),        // 2
    'rightLimit': getRightLimit(),      // 2  
    'actualValue': getActualFunctionValue(1.0),  // 5
    'jumpSize': getActualFunctionValue(1.0) - getLeftLimit(),  // 3
  };
}

/// Educational explanation of this piecewise function
String getFunctionExplanation() {
  final info = getDiscontinuityInfo();
  return '''
This is a three-piece piecewise function:

f(x) = { x+1        for x ∈ [-3,1)    (linear piece)
       { 5          for x = 1         (single point)
       { x²-2x+3    for x ∈ (1,3]     (parabolic piece)

At x = 1:
• Left limit: lim(x→1⁻) f(x) = ${info['leftLimit']}
• Right limit: lim(x→1⁺) f(x) = ${info['rightLimit']} 
• Actual value: f(1) = ${info['actualValue']}
• Jump discontinuity with jump size = ${info['jumpSize']}

Visual representation:
• Hole at (1,2) - where both pieces would meet
• Filled circle at (1,5) - actual function value
• Function is NOT continuous at x = 1
''';
}

/// Get domain information for each piece
Map<String, String> getDomainInfo() {
  return {
    'leftPiece': '[-3, 1)  →  f(x) = x + 1',
    'pointValue': '{1}     →  f(x) = 5', 
    'rightPiece': '(1, 3]  →  f(x) = x² - 2x + 3',
  };
}