import 'package:flutter/material.dart';
import 'graph_ui_base.dart';
import 'graph_painter.dart';

/// Graph Data 15: Piecewise function — ลิมิตไม่มี (ลิมิตซ้าย ≠ ลิมิตขวา)
/// h(x) = { -x + 3   สำหรับ x ≤ 0
///        { x² - 1   สำหรับ x > 0
///
/// lim(x→0⁻) h(x) = 3
/// lim(x→0⁺) h(x) = -1
/// lim(x→0)  h(x) = ไม่มี (3 ≠ -1)
/// h(0) = 3  (นิยามโดยชิ้นซ้าย x ≤ 0)
class _GraphData15 {
  static double function(double x) {
    if (x < 0.0) {
      return -x + 3;
    } else if (x > 0.0) {
      return x * x - 1;
    } else {
      return double.nan; // ฟังก์ชันไม่ต่อเนื่องที่ x=0, ค่าจริงที่ x=0 นิยามโดยชิ้นซ้าย (h(0) = 3)
    }
  }

  // Graph bounds
  static const double yMin = -6.5;
  static const double yMax = 6.5;
  static const double xMin = -3.25;
  static const double xMax = 3.25;

  // Function drawing bounds
  static const double functionXMin = -3.25;
  static const double functionXMax = 2.7;

  // Initial draggable points (ทั้งสองข้างของ x = 0)
  static const double initialXLeft = -2.0;
  static const double initialXRight = 2.0;

  // Drag constraints
  static const double dragMinLeft = -2.9;
  static const double dragMaxLeft = 0;
  static const double dragMinRight = 0.01;
  static const double dragMaxRight = 2.5;

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

  static FunctionDefinition get functionDefinition => FunctionDefinition(
    mainFunction: function,
    specialPoints: [
      // จุดทึบที่ (0, 3) — h(0) = -0+3 = 3 (ชิ้นซ้ายรวม x=0)
      SpecialPoint(x: 0.0, y: 3.0, isFilled: true, color: Color(0xFFA9BFFD)),

      // วงกลมเปิดที่ (0, -1) — ลิมิตขวา: lim(x→0⁺) x²-1 = -1
      SpecialPoint(x: 0.0, y: -1.0, isFilled: false),
    ],
    discontinuities: [0.0],
  );
}

Widget getGraphWidget() {
  return GraphUIBase(
    functionDef: _GraphData15.functionDefinition,
    xMin: _GraphData15.xMin,
    xMax: _GraphData15.xMax,
    yMin: _GraphData15.yMin,
    yMax: _GraphData15.yMax,
    functionXMin: _GraphData15.functionXMin,
    functionXMax: _GraphData15.functionXMax,
    initialXLeft: _GraphData15.initialXLeft,
    initialXRight: _GraphData15.initialXRight,
    dragMinLeft: _GraphData15.dragMinLeft,
    dragMaxLeft: _GraphData15.dragMaxLeft,
    dragMinRight: _GraphData15.dragMinRight,
    dragMaxRight: _GraphData15.dragMaxRight,
    yScale: _GraphData15.yScale,
    functionStrokeWidth: _GraphData15.functionStrokeWidth,
    pointRadius: _GraphData15.pointRadius,
    axisStrokeWidth: _GraphData15.axisStrokeWidth,
    padding: _GraphData15.padding,
    xTicks: _GraphData15.xTicks,
    yTicks: _GraphData15.yTicks,
    functionColor: Color(_GraphData15.functionColor),
    leftPointColor: Color(_GraphData15.leftPointColor),
    rightPointColor: Color(_GraphData15.rightPointColor),
  );
}

final Widget graph = getGraphWidget();

// ── Helper functions ──────────────────────────────────────────────

double getActualFunctionValue(double x) {
  if (x <= 0.0) return -x + 3;
  return x * x - 1;
}

double getLeftLimit()  => -0.0 + 3.0;      // lim(x→0⁻) -x+3 = 3
double getRightLimit() => 0.0 * 0.0 - 1;   // lim(x→0⁺) x²-1 = -1

bool isContinuousAtZero() {
  return (getLeftLimit() == getRightLimit()) &&
         (getActualFunctionValue(0.0) == getLeftLimit());
  // false — ลิมิตซ้าย (3) ≠ ลิมิตขวา (-1)
}

Map<String, double> getDiscontinuityInfo() {
  return {
    'leftLimit':   getLeftLimit(),               // 3
    'rightLimit':  getRightLimit(),              // -1
    'actualValue': getActualFunctionValue(0.0),  // 3
  };
}