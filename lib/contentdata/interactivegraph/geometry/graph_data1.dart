import 'package:flutter/material.dart';
import 'graph_ui_base.dart';

/// ✅ Graph Data for f(x) = x Game - ข้อมูลทั้งหมดอยู่ที่นี่
class GraphDataFEqualX {
  // Function definition: f(x) = x
  static double _function(double x) => x;

  // ✅ Configuration ทั้งหมดรวมอยู่ที่นี่
  static const GraphConfig config = GraphConfig(
    // Graph bounds (coordinate system limits)
    xMin: -0.5,
    xMax: 5.0,
    yMin: -0.5,
    yMax: 5.0,
    functionXMin: 0,
    functionXMax: 4.8,

    // Visual settings
    pointRadius: 4.25,
    axisStrokeWidth: 3.0,
    functionStrokeWidth: 6.0,
    padding: 30.0,
    graphSize: 280.0,

    // Tick marks for axes
    xTicks: [1, 2, 3, 4],
    yTicks: [1, 2, 3, 4],

    // Colors
    backgroundColor: Colors.white,
    axisColor: Colors.black,
    pointColor: Color(0xFFFF3D00),
    selectedPointColor: Color(0xFF5C84FF),
    functionLineColor: Color(0xFFA9BFFD), // Blue
    correctIconColor: Colors.green,
    incorrectIconColor: Colors.grey,

    // Function
    function: _function,
    functionExpression: 'f(x) = x',

    // Game data: All points shown on the graph (mix of correct and distractor points)
    allPoints: [
      // Correct points (on the line f(x) = x)
      GamePoint(x: 1.0, y: 1.0, isCorrect: true),
      GamePoint(x: 2.0, y: 2.0, isCorrect: true),
      GamePoint(x: 3.0, y: 3.0, isCorrect: true),
      GamePoint(x: 4.0, y: 4.0, isCorrect: true),

      // Distractor points (not on the line f(x) = x)
      GamePoint(x: 1.0, y: 3.0, isCorrect: false),
      GamePoint(x: 4.0, y: 2.0, isCorrect: false),
    ],

    // Extract only the correct points for validation
    correctPoints: [
      GamePoint(x: 1.0, y: 1.0, isCorrect: true),
      GamePoint(x: 2.0, y: 2.0, isCorrect: true),
      GamePoint(x: 3.0, y: 3.0, isCorrect: true),
      GamePoint(x: 4.0, y: 4.0, isCorrect: true),
    ],

    // Maximum selectable points
    maxSelectablePoints: 4,

    // Feedback messages
    correctFeedback: r'เยี่ยม! ต้องการพลอต $x = 1, 2, 3, 4$ เมื่อ $y = x$ จะได้พิกัดคือ $(1, 1), (2, 2), (3, 3), (4, 4)'
    , // ข้อความเมื่อถูก
    incorrectFeedback: 'ลองใหม่อีกครั้ง! มีบางจุดที่คุณเลือกไม่ถูกต้อง', // ข้อความเมื่อผิด
  );
}

/// ✅ Export widget - ง่ายมาก แค่ส่ง config
Widget getGraphWidget() {
  return OptimizedInteractiveGraph(
    config: GraphDataFEqualX.config,
  );
}

/// Alternative: Export as a constant variable for reuse
final Widget graphFEqualX = getGraphWidget();