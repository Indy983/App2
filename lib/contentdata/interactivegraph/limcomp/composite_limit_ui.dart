import 'package:flutter/material.dart';
import 'composite_limit_config.dart';
import 'simple_graph_painter.dart';
import '../limitFound/limit_approach_bar.dart';
import 'step_data_card.dart';

// ─────────────────────────────────────────────────────────────────────────────
// CompositeLimitUI
// ─────────────────────────────────────────────────────────────────────────────
//
// Layout (top → bottom):
//   1. Side-by-side graphs
//        Left  : g(x) vs x         [interactive — user drags here]
//        Right : f(g(x)) vs g(x)   [read-only   — follows left graph]
//   2. Left approach bar   (x → limitX⁻)
//   3. Left card A         x  | g(x)    | diff from limitGValue
//   4. Left card B         g(x) | f(g(x)) | diff from limitFGValue
//   5. Right approach bar  (x → limitX⁺)
//   6. Right card A        x  | g(x)    | diff from limitGValue
//   7. Right card B        g(x) | f(g(x)) | diff from limitFGValue
//
// Only _xLeft and _xRight are tracked; a single state variable drives both
// graphs and all four data cards simultaneously.

class CompositeLimitUI extends StatefulWidget {
  final CompositeLimitConfig config;

  const CompositeLimitUI({Key? key, required this.config}) : super(key: key);

  @override
  State<CompositeLimitUI> createState() => _CompositeLimitUIState();
}

class _CompositeLimitUIState extends State<CompositeLimitUI> {
  late double _xLeft;
  late double _xRight;

  // Gesture state for the interactive g(x) graph only.
  bool? _draggingLeft; // true = moving left point, false = moving right point

  // Padding constants that must match SimpleGraphPainter's internal padding.
  static const double _kPadL = 26.0;
  static const double _kPadR = 14.0;

  @override
  void initState() {
    super.initState();
    _xLeft  = widget.config.initialXLeft;
    _xRight = widget.config.initialXRight;
  }

  CompositeLimitConfig get cfg => widget.config;

  // ── safe function evaluation ──────────────────────────────────────────────

  double _eval(double Function(double) fn, double x) {
    if (x.isNaN || x.isInfinite) return double.nan;
    try {
      final y = fn(x);
      return (y.isNaN || y.isInfinite) ? double.nan : y;
    } catch (_) {
      return double.nan;
    }
  }

  // ── graph sizing ──────────────────────────────────────────────────────────

  /// Each graph gets roughly half the available width with spacing.
  /// Clamped so tiny phones and wide tablets both look sensible.
  double _graphSize(double availableW) {
    // 16 left + 12 between + 16 right = 44 total horizontal padding.
    final each = (availableW - 44.0) / 2;
    return each.clamp(120.0, 220.0);
  }

  // ── pan handlers for the g(x) graph ──────────────────────────────────────
  //
  // The GestureDetector wraps only the g(x) SizedBox.
  // localPosition is in the SizedBox's coordinate space:
  //   widget left = canvas x 0  (offset by _kPadL inside the painter)
  //   widget top  = canvas y size.height (painter is flipped)

  void _onGGraphPanStart(DragStartDetails d, double graphSz) {
    final gW   = graphSz - _kPadL - _kPadR;
    final xSc  = gW / (cfg.gXMax - cfg.gXMin);
    final cx   = d.localPosition.dx - _kPadL;
    final tapX = cfg.gXMin + (cx / xSc);

    final dL = (tapX - _xLeft).abs();
    final dR = (tapX - _xRight).abs();
    setState(() => _draggingLeft = dL <= dR);
  }

  void _onGGraphPanUpdate(DragUpdateDetails d, double graphSz) {
    if (_draggingLeft == null) return;

    final gW   = graphSz - _kPadL - _kPadR;
    final xSc  = gW / (cfg.gXMax - cfg.gXMin);
    final cx   = d.localPosition.dx - _kPadL;
    final newX = cfg.gXMin + (cx / xSc);

    setState(() {
      if (_draggingLeft!) {
        _xLeft  = newX.clamp(cfg.dragMinLeft,  cfg.dragMaxLeft);
      } else {
        _xRight = newX.clamp(cfg.dragMinRight, cfg.dragMaxRight);
      }
    });
  }

  void _onGGraphPanEnd(DragEndDetails _) =>
      setState(() => _draggingLeft = null);

  // ── build ─────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      final totalW   = constraints.maxWidth;
      final graphSz  = _graphSize(totalW);

      // Pre-compute all derived values so card builds stay pure.
      final g   = cfg.gDef.mainFunction;
      final f   = cfg.fDef.mainFunction;

      final gL  = _eval(g, _xLeft);
      final gR  = _eval(g, _xRight);
      final fgL = _eval(f, gL);
      final fgR = _eval(f, gR);

      // For the f graph the point x-coordinate is g(x).
      // SimpleGraphPainter handles NaN gracefully (skips drawing that point).
      final fPoint1X = gL;
      final fPoint2X = gR;

      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            // ── 1. Side-by-side graphs ───────────────────────────────────
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // ── g(x) graph — interactive ──────────────────────────
                  GestureDetector(
                    behavior:      HitTestBehavior.opaque,
                    onPanStart:    (d) => _onGGraphPanStart(d, graphSz),
                    onPanUpdate:   (d) => _onGGraphPanUpdate(d, graphSz),
                    onPanEnd:      _onGGraphPanEnd,
                    child: SizedBox(
                      width: graphSz, height: graphSz,
                      child: CustomPaint(
                        painter: SimpleGraphPainter(
                          functionDef:         cfg.gDef,
                          xMin:                cfg.gXMin,
                          xMax:                cfg.gXMax,
                          yMin:                cfg.gYMin,
                          yMax:                cfg.gYMax,
                          functionXMin:        cfg.gFuncXMin,
                          functionXMax:        cfg.gFuncXMax,
                          point1X:             _xLeft,
                          point2X:             _xRight,
                          point1Color:         cfg.leftPointColor,
                          point2Color:         cfg.rightPointColor,
                          yScale:              cfg.gYScale,
                          functionStrokeWidth: cfg.functionStrokeWidth,
                          pointRadius:         cfg.pointRadius,
                          axisStrokeWidth:     cfg.axisStrokeWidth,
                          xTicks:              cfg.gXTicks,
                          yTicks:              cfg.gYTicks,
                          xTickLabels:         cfg.gXTickLabels,
                          yTickLabels:         cfg.gYTickLabels,
                          functionColor:       cfg.functionColor,
                          xAxisLabel:          cfg.gXLabel,
                          yAxisLabel:          cfg.gYLabel,
                        ),
                        size: Size(graphSz, graphSz),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  // ── f(g(x)) graph — read-only ─────────────────────────
                  // X-axis represents u = g(x); y-axis = f(u).
                  // Points: (g(_xLeft), f(g(_xLeft))) and (g(_xRight), f(g(_xRight))).
                  SizedBox(
                    width: graphSz, height: graphSz,
                    child: CustomPaint(
                      painter: SimpleGraphPainter(
                        functionDef:         cfg.fDef,
                        xMin:                cfg.fUMin,
                        xMax:                cfg.fUMax,
                        yMin:                cfg.fFYMin,
                        yMax:                cfg.fFYMax,
                        functionXMin:        cfg.fFuncUMin,
                        functionXMax:        cfg.fFuncUMax,
                        point1X:             fPoint1X,
                        point2X:             fPoint2X,
                        point1Color:         cfg.leftPointColor,
                        point2Color:         cfg.rightPointColor,
                        yScale:              cfg.fYScale,
                        functionStrokeWidth: cfg.functionStrokeWidth,
                        pointRadius:         cfg.pointRadius,
                        axisStrokeWidth:     cfg.axisStrokeWidth,
                        xTicks:              cfg.fUTicks,
                        yTicks:              cfg.fFYTicks,
                        xTickLabels:         cfg.fUTickLabels,
                        yTickLabels:         cfg.fFYTickLabels,
                        functionColor:       cfg.functionColor,
                        xAxisLabel:          cfg.fULabel,
                        yAxisLabel:          cfg.fFYLabel,
                      ),
                      size: Size(graphSz, graphSz),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 14),

            // ── 2. Left approach bar ─────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: LimitApproachBar(
                currentX:    _xLeft,
                xMin:        cfg.leftPresets.first,
                xMax:        cfg.leftPresets.last,
                presets:     cfg.leftPresets,
                isLeft:      true,
                limitXLabel: cfg.limitXLabel,
                color:       cfg.leftPointColor,
                onChanged:   (x) => setState(
                  () => _xLeft = x.clamp(cfg.dragMinLeft, cfg.dragMaxLeft),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // ── 3. Left card A: x → g(x) ────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: StepDataCard(
                col1Label:  'x',
                col1Value:  _xLeft,
                col1Color:  cfg.leftPointColor,
                col2Label:  'g(x)',
                col2Value:  gL,
                col3Label:  cfg.gDiffLabel,
                limitValue: cfg.limitGValue,
              ),
            ),

            const SizedBox(height: 8),

            // ── 4. Left card B: g(x) → f(g(x)) ─────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: StepDataCard(
                col1Label:  'g(x)',
                col1Value:  gL,
                col1Color:  cfg.leftPointColor,
                col2Label:  'f(g(x))',
                col2Value:  fgL,
                col3Label:  cfg.fgDiffLabel,
                limitValue: cfg.limitFGValue,
              ),
            ),

            const SizedBox(height: 22),

            // ── 5. Right approach bar ────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: LimitApproachBar(
                currentX:    _xRight,
                xMin:        cfg.rightPresets.first,
                xMax:        cfg.rightPresets.last,
                presets:     cfg.rightPresets,
                isLeft:      false,
                limitXLabel: cfg.limitXLabel,
                color:       cfg.rightPointColor,
                onChanged:   (x) => setState(
                  () => _xRight = x.clamp(cfg.dragMinRight, cfg.dragMaxRight),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // ── 6. Right card A: x → g(x) ───────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: StepDataCard(
                col1Label:  'x',
                col1Value:  _xRight,
                col1Color:  cfg.rightPointColor,
                col2Label:  'g(x)',
                col2Value:  gR,
                col3Label:  cfg.gDiffLabel,
                limitValue: cfg.limitGValue,
              ),
            ),

            const SizedBox(height: 8),

            // ── 7. Right card B: g(x) → f(g(x)) ────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: StepDataCard(
                col1Label:  'g(x)',
                col1Value:  gR,
                col1Color:  cfg.rightPointColor,
                col2Label:  'f(g(x))',
                col2Value:  fgR,
                col3Label:  cfg.fgDiffLabel,
                limitValue: cfg.limitFGValue,
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      );
    });
  }
}