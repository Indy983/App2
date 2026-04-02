import 'package:flutter/material.dart';
import 'graph_ui_base.dart';
import 'graph_painter.dart';

/// Graph Data 13: Piecewise function — ลิมิตไม่มี (ลิมิตซ้าย ≠ ลิมิตขวา)
/// f(x) = { x + 1     สำหรับ x < 2
///        { 4          สำหรับ x = 2
///        { -x + 6    สำหรับ x > 2
///
/// lim(x→2⁻) f(x) = 3
/// lim(x→2⁺) f(x) = 4
/// lim(x→2)  f(x) = ไม่มี (3 ≠ 4)
/// f(2) = 4
class _GraphData13 {
  static double function(double x) {
    if (x < 2.0) {
      return x + 1;
    } else {
      return -x + 6;
    }
  }

  // Graph bounds
  static const double yMin = -0.5;
  static const double yMax = 4.5;
  static const double xMin = -0.5;
  static const double xMax = 4.5;

  // Function drawing bounds
  static const double functionXMin = -0.5;
  static const double functionXMax = 4.5;

  // Initial draggable points (ทั้งสองข้างของ x = 2)
  static const double initialXLeft = 0.5;
  static const double initialXRight = 3.5;

  // Drag constraints
  static const double dragMinLeft = 0.0;
  static const double dragMaxLeft = 1.99;
  static const double dragMinRight = 2.0;
  static const double dragMaxRight = 4.0;

  // Scale settings
  static const double yScale = 1.0;
  static const double functionStrokeWidth = 6.0;
  static const double pointRadius = 6.5;
  static const double axisStrokeWidth = 3.0;
  static const double padding = 20.0;

  // Tick marks
  static const List<int> xTicks = [1, 2, 3, 4];
  static const List<int> yTicks = [1, 2, 3, 4];

  // Colors
  static const int functionColor = 0xFFA9BFFD;
  static const int leftPointColor = 0xFF4F8DFB;
  static const int rightPointColor = 0xFFF8834F;

  static FunctionDefinition get functionDefinition => FunctionDefinition(
    mainFunction: function,
    specialPoints: [
      // วงกลมเปิดที่ (2, 3) — ลิมิตซ้าย: lim(x→2⁻) x+1 = 3
      SpecialPoint(x: 2.0, y: 3.0, isFilled: false),

      // วงกลมเปิดที่ (2, 4) — ลิมิตขวา: lim(x→2⁺) -x+6 = 4
      SpecialPoint(x: 2.0, y: 4.0, isFilled: false),

      // จุดทึบที่ (2, 4) — ค่าฟังก์ชัน: f(2) = 4
      SpecialPoint(x: 2.0, y: 4.0, isFilled: true, color: Color(0xFFA9BFFD)),
    ],
    discontinuities: [2.0],
  );
}

Widget getGraphWidget() {
  return GraphUIBase(
    functionDef: _GraphData13.functionDefinition,
    xMin: _GraphData13.xMin,
    xMax: _GraphData13.xMax,
    yMin: _GraphData13.yMin,
    yMax: _GraphData13.yMax,
    functionXMin: _GraphData13.functionXMin,
    functionXMax: _GraphData13.functionXMax,
    initialXLeft: _GraphData13.initialXLeft,
    initialXRight: _GraphData13.initialXRight,
    dragMinLeft: _GraphData13.dragMinLeft,
    dragMaxLeft: _GraphData13.dragMaxLeft,
    dragMinRight: _GraphData13.dragMinRight,
    dragMaxRight: _GraphData13.dragMaxRight,
    yScale: _GraphData13.yScale,
    functionStrokeWidth: _GraphData13.functionStrokeWidth,
    pointRadius: _GraphData13.pointRadius,
    axisStrokeWidth: _GraphData13.axisStrokeWidth,
    padding: _GraphData13.padding,
    xTicks: _GraphData13.xTicks,
    yTicks: _GraphData13.yTicks,
    functionColor: Color(_GraphData13.functionColor),
    leftPointColor: Color(_GraphData13.leftPointColor),
    rightPointColor: Color(_GraphData13.rightPointColor),
  );
}

final Widget graph = getGraphWidget();

// ── Helper functions ──────────────────────────────────────────────

double getActualFunctionValue(double x) {
  if (x < 2.0) return x + 1;
  if (x == 2.0) return 4.0;
  if (x > 2.0) return -x + 6;
  return double.nan;
}

double getLeftLimit()  => 2.0 + 1.0;       // lim(x→2⁻) x+1 = 3
double getRightLimit() => -2.0 + 6.0;      // lim(x→2⁺) -x+6 = 4

bool isContinuousAtTwo() {
  return (getLeftLimit() == getRightLimit()) &&
         (getActualFunctionValue(2.0) == getLeftLimit());
  // false — ลิมิตซ้าย (3) ≠ ลิมิตขวา (4)
}

Map<String, double> getDiscontinuityInfo() {
  return {
    'leftLimit':   getLeftLimit(),               // 3
    'rightLimit':  getRightLimit(),              // 4
    'actualValue': getActualFunctionValue(2.0),  // 4
  };
}