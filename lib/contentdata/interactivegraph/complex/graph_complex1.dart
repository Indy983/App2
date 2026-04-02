import 'package:flutter/material.dart';
import 'graph_ui_complex.dart';

/// ✅ Complex Graph Data - ข้อมูลทั้งหมดสำหรับ Complex Number Graph
class ComplexGraphData1 {
  // ✅ Configuration สำหรับกราฟจำนวนเชิงซ้อน
  static const ComplexGraphConfig config = ComplexGraphConfig(
    // Graph bounds (coordinate system limits) - แกน r และ i
    rMin: -3.0,
    rMax: 4.0,
    iMin: -3.0,
    iMax: 4.0,

    // Visual settings
    pointRadius: 4.25,
    axisStrokeWidth: 3.0,
    padding: 30.0,
    graphSize: 280.0,

    // Tick marks for axes
    rTicks: [-2, -1, 0, 1, 2, 3],  // r-axis ticks
    iTicks: [-2, -1, 0, 1, 2, 3],  // i-axis ticks

    // Colors
    backgroundColor: Colors.white,
    axisColor: Colors.black,
    pointColor: Color(0xFFFF3D00),
    selectedPointColor: Color(0xFF5C84FF),
    correctIconColor: Colors.green,
    incorrectIconColor: Colors.grey,

    // Game data: จุดทั้งหมดที่แสดงบนกราฟ (จุดที่ถูกและจุดล่อ)
    allPoints: [
      // Correct points (จุดที่ถูกต้อง)
      ComplexPoint(real: 1.0, imaginary: 1.0, isCorrect: true, label: '1+i'),
      ComplexPoint(real: 2.0, imaginary: 1.0, isCorrect: true, label: '2+i'),
      ComplexPoint(real: -1.0, imaginary: -1.0, isCorrect: true, label: '-1-i'),

      // Distractor points (จุดล่อ - ไม่ถูกต้อง)
      ComplexPoint(real: 1.0, imaginary: -1.0, isCorrect: false),
      ComplexPoint(real: -1.0, imaginary: 1.0, isCorrect: false),
      ComplexPoint(real: 2.0, imaginary: -1.0, isCorrect: false),
      ComplexPoint(real: 0.0, imaginary: 2.0, isCorrect: false),
      ComplexPoint(real: 3.0, imaginary: 0.0, isCorrect: false),
    ],

    // Extract only the correct points for validation (จุดที่ถูกต้องเท่านั้น)
    correctPoints: [
      ComplexPoint(real: 1.0, imaginary: 1.0, isCorrect: true, label: '1+i'),
      ComplexPoint(real: 2.0, imaginary: 1.0, isCorrect: true, label: '2+i'),
      ComplexPoint(real: -1.0, imaginary: -1.0, isCorrect: true, label: '-1-i'),
    ],

    // Maximum selectable points (จำนวนจุดที่ต้องเลือก)
    maxSelectablePoints: 3,

    // Feedback messages (ข้อความแสดงผล)
    correctFeedback: 'ยอดเยี่ยม! คุณเลือกจุดที่ถูกต้องทั้งหมด!',
    incorrectFeedback: 'ลองใหม่อีกครั้ง! บางจุดที่คุณเลือกไม่ถูกต้อง',
  );
}

/// ✅ Export widget - สำหรับเรียกใช้งาน
Widget getComplexWidget() {
  return OptimizedComplexGraph(
    config: ComplexGraphData1.config,
  );
}

/// Alternative: Export as a constant variable for reuse
final Widget graphComplex1 = getComplexWidget();