import 'package:flutter/material.dart';
import 'graph_ui_base.dart';
import 'graph_painter.dart';

/// Graph Data 14: Piecewise function — ลิมิตมีค่า แต่ไม่ต่อเนื่อง (removable discontinuity)
/// g(x) = { x²       สำหรับ x < 1
///        { 3         สำหรับ x = 1
///        { 2x - 1   สำหรับ x > 1
///
/// lim(x→1⁻) g(x) = 1
/// lim(x→1⁺) g(x) = 1
/// lim(x→1)  g(x) = 1   (ลิมิตมีค่า เพราะซ้าย = ขวา)
/// g(1) = 3              (แต่ฟังก์ชันไม่ต่อเนื่อง เพราะ g(1) ≠ ลิมิต)
class _GraphData14 {
  static double function(double x) {
    if (x < 1.0) {
      return x * x;
    } else if (x > 1.0) {
      return 2 * x - 1;
    } else {
      return double.nan;
    }
  }

  // Graph bounds
  static const double yMin = -3.25;
  static const double yMax = 3.25;
  static const double xMin = -3.25;
  static const double xMax = 3.25;

  // Function drawing bounds
  static const double functionXMin = -1.9;
  static const double functionXMax = 1.9;

  // Initial draggable points (ทั้งสองข้างของ x = 1)
  static const double initialXLeft = -1.3;
  static const double initialXRight = 1.5;

  // Drag constraints
  static const double dragMinLeft = -1.7;
  static const double dragMaxLeft = 0.99;
  static const double dragMinRight = 1.01;
  static const double dragMaxRight = 1.8;

  // Scale settings
  static const double yScale = 1.0;
  static const double functionStrokeWidth = 6.0;
  static const double pointRadius = 6.5;
  static const double axisStrokeWidth = 3.0;
  static const double padding = 20.0;

  // Tick marks
  static const List<int> xTicks = [-2, -1, 1, 2];
  static const List<int> yTicks = [-2, -1, 1, 2];

  // Colors
  static const int functionColor = 0xFFA9BFFD;
  static const int leftPointColor = 0xFF4F8DFB;
  static const int rightPointColor = 0xFFF8834F;

  static FunctionDefinition get functionDefinition => FunctionDefinition(
    mainFunction: function,
    specialPoints: [
      // วงกลมเปิดที่ (1, 1) — ลิมิตซ้าย: lim(x→1⁻) x² = 1
      SpecialPoint(x: 1.0, y: 1.0, isFilled: false),

      // จุดทึบที่ (1, 3) — ค่าฟังก์ชัน: g(1) = 3
      SpecialPoint(x: 1.0, y: 3.0, isFilled: true, color: Color(0xFFA9BFFD)),

      // วงกลมเปิดที่ (1, 1) — ลิมิตขวา: lim(x→1⁺) 2x-1 = 1
      // (ซ้อนกับลิมิตซ้าย เพราะค่าเท่ากัน → วงกลมเปิดเดียว)
      SpecialPoint(x: 1.0, y: 1.0, isFilled: false),
    ],
    discontinuities: [1.0],
  );
}

Widget getGraphWidget() {
  return GraphUIBase(
    functionDef: _GraphData14.functionDefinition,
    xMin: _GraphData14.xMin,
    xMax: _GraphData14.xMax,
    yMin: _GraphData14.yMin,
    yMax: _GraphData14.yMax,
    functionXMin: _GraphData14.functionXMin,
    functionXMax: _GraphData14.functionXMax,
    initialXLeft: _GraphData14.initialXLeft,
    initialXRight: _GraphData14.initialXRight,
    dragMinLeft: _GraphData14.dragMinLeft,
    dragMaxLeft: _GraphData14.dragMaxLeft,
    dragMinRight: _GraphData14.dragMinRight,
    dragMaxRight: _GraphData14.dragMaxRight,
    yScale: _GraphData14.yScale,
    functionStrokeWidth: _GraphData14.functionStrokeWidth,
    pointRadius: _GraphData14.pointRadius,
    axisStrokeWidth: _GraphData14.axisStrokeWidth,
    padding: _GraphData14.padding,
    xTicks: _GraphData14.xTicks,
    yTicks: _GraphData14.yTicks,
    functionColor: Color(_GraphData14.functionColor),
    leftPointColor: Color(_GraphData14.leftPointColor),
    rightPointColor: Color(_GraphData14.rightPointColor),
  );
}

final Widget graph = getGraphWidget();

// ── Helper functions ──────────────────────────────────────────────

double getActualFunctionValue(double x) {
  if (x < 1.0) return x * x;
  if (x == 1.0) return 3.0;
  if (x > 1.0) return 2 * x - 1;
  return double.nan;
}

double getLeftLimit()  => 1.0 * 1.0;           // lim(x→1⁻) x² = 1
double getRightLimit() => 2.0 * 1.0 - 1.0;     // lim(x→1⁺) 2x-1 = 1

bool isContinuousAtOne() {
  return (getLeftLimit() == getRightLimit()) &&
         (getActualFunctionValue(1.0) == getLeftLimit());
  // false — ลิมิต = 1 แต่ g(1) = 3
}

Map<String, double> getDiscontinuityInfo() {
  return {
    'leftLimit':   getLeftLimit(),               // 1
    'rightLimit':  getRightLimit(),              // 1
    'actualValue': getActualFunctionValue(1.0),  // 3
  };
}