import 'package:flutter/material.dart';
import '../limit/graph_painter.dart';
import 'composite_limit_config.dart';
import 'composite_limit_ui.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Composite Graph Data 1
//
//   g(x)    = x − 1
//   f(u)    = 2u + 1
//   f(g(x)) = 2(x−1) + 1 = 2x − 1
//
//   lim x→2 g(x)    = 2 − 1 = 1
//   lim x→2 f(g(x)) = 2(1) + 1 = 3
// ─────────────────────────────────────────────────────────────────────────────

class _Data1 {
  // ── Function definitions ─────────────────────────────────────────────────

  static double g(double x) => x - 1;      // g(x) = x − 1
  static double f(double u) => 2 * u + 1;  // f(u) = 2u + 1

  // ── Config getter ────────────────────────────────────────────────────────

  static CompositeLimitConfig get config => CompositeLimitConfig(
    // Functions
    gDef: FunctionDefinition(
      mainFunction:   g,
      specialPoints:  const [],
      discontinuities: null,
    ),
    fDef: FunctionDefinition(
      mainFunction:   f,
      specialPoints:  const [],
      discontinuities: null,
    ),

    // ── g(x) graph ─────────────────────────────────────────────────────────
    // x-axis = x (range 0 → 4.5), y-axis = g(x) = x-1 (range -1 → 3.5)
    // xRange = 5 units, yRange = 5 units → gYScale = 1.0 gives equal aspect.
    gXMin:      -0.5, gXMax:      4.5,
    gYMin:      -1.5, gYMax:      3.5,
    gFuncXMin:   0.0, gFuncXMax:  4.5,
    gYScale:     1.0,
    gXTicks:    const [1, 2, 3, 4],
    gYTicks:    const [-1, 0, 1, 2, 3],
    gXLabel:    'x',
    gYLabel:    'g(x)',

    // ── f(g(x)) graph ──────────────────────────────────────────────────────
    // x-axis = u = g(x) (range -0.5 → 3.5), y-axis = f(u) = 2u+1 (range 0 → 8)
    // uRange = 4 units, fRange = 9 units → fYScale ≈ 0.48 keeps curve visible.
    fUMin:      -0.5, fUMax:      3.5,
    fFYMin:     -1.0, fFYMax:     9.0,
    fFuncUMin:  -0.5, fFuncUMax:  3.5,
    fYScale:     0.48,
    fUTicks:    const [0, 1, 2, 3],
    fFYTicks:   const [2, 4, 6, 8],
    fULabel:    'g(x)',   // shows students this axis IS g(x)
    fFYLabel:   'y',

    // ── Limit info ──────────────────────────────────────────────────────────
    limitX:       2.0,
    limitXLabel:  '2',
    limitGValue:  1.0,   // g(2) = 2 − 1 = 1
    limitFGValue: 3.0,   // f(g(2)) = 2·1 + 1 = 3

    // ── Bar presets ─────────────────────────────────────────────────────────
    leftPresets:  const [1.5, 1.8, 1.9, 1.99, 1.9999],
    rightPresets: const [2.0001, 2.01, 2.1, 2.2, 2.5],

    // ── Initial positions & drag limits ─────────────────────────────────────
    initialXLeft:  1.5,
    initialXRight: 2.5,
    dragMinLeft:   0.5,    dragMaxLeft:  1.9999,
    dragMinRight:  2.0001, dragMaxRight: 4.0,

    // ── Step-card diff labels ────────────────────────────────────────────────
    gDiffLabel:  'ระยะห่างกับ 1',  // diff of g(x) from lim g = 1
    fgDiffLabel: 'ระยะห่างกับ 3',  // diff of f(g(x)) from lim f(g) = 3

    // ── Colours ─────────────────────────────────────────────────────────────
    functionColor:   const Color(0xFFA9BFFD),
    leftPointColor:  const Color(0xFF4F8DFB),
    rightPointColor: const Color(0xFFF8834F),

    // ── Stroke & point sizes ─────────────────────────────────────────────────
    functionStrokeWidth: 5.0,
    pointRadius:         6.0,
    axisStrokeWidth:     2.5,
  );
}

/// Returns the composite limit exploration widget for
/// g(x) = x−1  and  f(g(x)) = 2x−1.
Widget getGraphWidget() =>
    CompositeLimitUI(config: _Data1.config);

final Widget compositeGraph = getGraphWidget();