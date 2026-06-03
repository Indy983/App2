import 'package:flutter/material.dart';
import '../limit/graph_painter.dart'; // FunctionDefinition

// ─────────────────────────────────────────────────────────────────────────────
// CompositeLimitConfig
// ─────────────────────────────────────────────────────────────────────────────
//
// Holds every parameter needed to render the composite limit UI:
//
//   LEFT GRAPH  : x-axis = x,    y-axis = g(x)        [interactive]
//   RIGHT GRAPH : x-axis = g(x), y-axis = f(g(x))     [read-only]
//
// Data cards show one step at a time:
//   Step card A : x      → g(x)    with diff from limitGValue
//   Step card B : g(x)   → f(g(x)) with diff from limitFGValue

class CompositeLimitConfig {
  // ── Functions ─────────────────────────────────────────────────────────────

  /// g(x) — drawn on the left graph.
  final FunctionDefinition gDef;

  /// f(u) — drawn on the right graph; its x-axis represents u = g(x).
  final FunctionDefinition fDef;

  // ── Left graph bounds (x-axis = x, y-axis = g(x)) ────────────────────────

  final double gXMin, gXMax;         // axes display range
  final double gYMin, gYMax;
  final double gFuncXMin, gFuncXMax; // curve drawing range
  final double gYScale;              // yScaleActual = xScale * gYScale
  final List<dynamic> gXTicks;
  final List<dynamic> gYTicks;
  final List<String>? gXTickLabels;
  final List<String>? gYTickLabels;
  final String gXLabel;              // x-axis arrow label
  final String gYLabel;              // y-axis arrow label

  // ── Right graph bounds (x-axis = g(x), y-axis = f(g(x))) ─────────────────

  final double fUMin, fUMax;         // u = g(x) display range
  final double fFYMin, fFYMax;       // f(u) display range
  final double fFuncUMin, fFuncUMax; // curve drawing range
  final double fYScale;
  final List<dynamic> fUTicks;
  final List<dynamic> fFYTicks;
  final List<String>? fUTickLabels;
  final List<String>? fFYTickLabels;
  final String fULabel;              // x-axis label on f graph
  final String fFYLabel;             // y-axis label on f graph

  // ── Limit information ─────────────────────────────────────────────────────

  final double limitX;        // x → limitX
  final double limitGValue;   // lim x→limitX g(x)
  final double limitFGValue;  // lim x→limitX f(g(x))
  final String limitXLabel;   // display string, e.g. '2'

  // ── Bar presets ───────────────────────────────────────────────────────────

  final List<double> leftPresets;  // x values approaching limitX from left
  final List<double> rightPresets; // x values approaching limitX from right (ascending)

  // ── Initial positions and drag constraints ────────────────────────────────

  final double initialXLeft, initialXRight;
  final double dragMinLeft,  dragMaxLeft;
  final double dragMinRight, dragMaxRight;

  // ── Step-card diff labels ─────────────────────────────────────────────────

  final String gDiffLabel;   // col3 of card A, e.g. 'ระยะห่างกับ 1'
  final String fgDiffLabel;  // col3 of card B, e.g. 'ระยะห่างกับ 3'

  // ── Colours ───────────────────────────────────────────────────────────────

  final Color functionColor;   // curve colour (same for both graphs)
  final Color leftPointColor;  // left-approach point
  final Color rightPointColor; // right-approach point

  // ── Visual style ─────────────────────────────────────────────────────────
  final double functionStrokeWidth;
  final double pointRadius;
  final double axisStrokeWidth;

  const CompositeLimitConfig({
    required this.gDef,
    required this.fDef,
    required this.gXMin, required this.gXMax,
    required this.gYMin, required this.gYMax,
    required this.gFuncXMin, required this.gFuncXMax,
    required this.gYScale,
    required this.gXTicks,
    required this.gYTicks,
    this.gXTickLabels,
    this.gYTickLabels,
    this.gXLabel = 'x',
    this.gYLabel = 'y',
    required this.fUMin, required this.fUMax,
    required this.fFYMin, required this.fFYMax,
    required this.fFuncUMin, required this.fFuncUMax,
    required this.fYScale,
    required this.fUTicks,
    required this.fFYTicks,
    this.fUTickLabels,
    this.fFYTickLabels,
    this.fULabel = 'g(x)',
    this.fFYLabel = 'y',
    required this.limitX,
    required this.limitGValue,
    required this.limitFGValue,
    this.limitXLabel = '2',
    required this.leftPresets,
    required this.rightPresets,
    required this.initialXLeft,
    required this.initialXRight,
    required this.dragMinLeft,  required this.dragMaxLeft,
    required this.dragMinRight, required this.dragMaxRight,
    required this.gDiffLabel,
    required this.fgDiffLabel,
    required this.functionColor,
    required this.leftPointColor,
    required this.rightPointColor,
    this.functionStrokeWidth = 4.5,
    this.pointRadius         = 6.0,
    this.axisStrokeWidth     = 2.5,
  });
}