import 'package:flutter/material.dart';
import 'graph_ui_base.dart';
import 'dart:math';

/// ✅ Graph Data for Ellipse - วงรีศูนย์กลาง (0,0)
class GraphDataEllipse {
  // Function definition: Ellipse x²/4 + y² = 1 (หรือ x² + 4y² = 4)
  // เราจะวาดวงรีด้วยการคำนวณ y จาก x
  static double _functionTop(double x) {
    // y = √(1 - x²/4) สำหรับครึ่งบน
    final value = 1 - (x * x) / 4;
    return value >= 0 ? sqrt(value) : double.nan;
  }

  // Function แบบรวม (เราจะวาดทั้ง 2 ส่วน)
  static double _function(double x) => _functionTop(x);

  // ✅ Configuration ทั้งหมดรวมอยู่ที่นี่
  static const GraphConfig config = GraphConfig(
    // Graph bounds (coordinate system limits)
    xMin: -3,
    xMax: 3,
    yMin: -3,
    yMax: 3,
    functionXMin: -2,
    functionXMax: 2,

    // Visual settings
    pointRadius: 4.25,
    axisStrokeWidth: 3.0,
    functionStrokeWidth: 6.0,
    padding: 30.0,
    graphSize: 270.0,

    // Tick marks for axes
    xTicks: [-2, -1, 1, 2],
    yTicks: [-2, -1, 1, 2],

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
    functionExpression: 'x²/4 + y² = 1',

    // Game data: All points shown on the graph (mix of correct and distractor points)
    allPoints: [
      // Correct points (on the ellipse x²/4 + y² = 1)
      GamePoint(x: 2, y: 0, isCorrect: true),   // จุดขวาสุด
      GamePoint(x: -2, y: 0, isCorrect: true),  // จุดซ้ายสุด
      GamePoint(x: 0, y: 1, isCorrect: true),   // จุดบนสุด
      GamePoint(x: 0, y: -1, isCorrect: true),  // จุดล่างสุด

      // Distractor points (not on the ellipse)
      GamePoint(x: 1, y: 1, isCorrect: false),  // อยู่นอกวงรี
      GamePoint(x: 2, y: 1, isCorrect: false),  // อยู่นอกวงรี
    ],

    // Extract only the correct points for validation
    correctPoints: [
      GamePoint(x: 2, y: 0, isCorrect: true),
      GamePoint(x: -2, y: 0, isCorrect: true),
      GamePoint(x: 0, y: 1, isCorrect: true),
      GamePoint(x: 0, y: -1, isCorrect: true),
    ],

    // Maximum selectable points
    maxSelectablePoints: 4,

    // Feedback messages
    correctFeedback: 'เยี่ยมมาก! คุณเลือกจุดบนวงรีได้ถูกต้องทั้ง 4 จุด!',
    incorrectFeedback: 'ลองใหม่อีกครั้ง! บางจุดไม่ได้อยู่บนวงรี',

    // วาดทั้งครึ่งบนและครึ่งล่างเพื่อให้ได้วงรีเต็มวง
    drawBothHalves: true,
  );
}

/// ✅ Export widget - ง่ายมาก แค่ส่ง config
Widget getGraphWidget() {
  return OptimizedInteractiveGraph(
    config: GraphDataEllipse.config,
  );
}

/// Alternative: Export as a constant variable for reuse
final Widget graphEllipse = getGraphWidget();