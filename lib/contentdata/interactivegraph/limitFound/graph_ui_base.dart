import 'package:flutter/material.dart';
import '../limit/graph_painter.dart';
import 'limit_config.dart';
import 'limit_approach_bar.dart';
import 'limit_data_card.dart';

class GraphUIBase extends StatefulWidget {
  // ── function & bounds ────────────────────────────────────────────────────
  final FunctionDefinition functionDef;
  final double xMin, xMax, yMin, yMax;
  final double functionXMin, functionXMax;

  // ── interactive points ───────────────────────────────────────────────────
  final double initialXLeft, initialXRight;
  final double dragMinLeft,  dragMaxLeft;
  final double dragMinRight, dragMaxRight;

  // ── visuals ──────────────────────────────────────────────────────────────
  final double yScale, functionStrokeWidth, pointRadius, axisStrokeWidth, padding;

  // ── tick marks ───────────────────────────────────────────────────────────
  final List<dynamic> xTicks, yTicks;
  final List<String>? xTickLabels, yTickLabels;

  // ── colours ──────────────────────────────────────────────────────────────
  final Color functionColor, leftPointColor, rightPointColor;

  // ── optional limit exploration UI ────────────────────────────────────────
  /// When non-null:  graph → left bar → left card → right bar → right card
  /// When null:      original standalone graph only
  final LimitConfig? limitConfig;

  const GraphUIBase({
    Key? key,
    required this.functionDef,
    required this.xMin, required this.xMax,
    required this.yMin, required this.yMax,
    required this.functionXMin, required this.functionXMax,
    required this.initialXLeft, required this.initialXRight,
    required this.dragMinLeft,  required this.dragMaxLeft,
    required this.dragMinRight, required this.dragMaxRight,
    required this.yScale,
    required this.functionStrokeWidth,
    required this.pointRadius,
    required this.axisStrokeWidth,
    required this.padding,
    required this.xTicks, required this.yTicks,
    this.xTickLabels, this.yTickLabels,
    required this.functionColor,
    required this.leftPointColor,
    required this.rightPointColor,
    this.limitConfig,
  }) : super(key: key);

  @override
  State<GraphUIBase> createState() => _GraphUIBaseState();
}

class _GraphUIBaseState extends State<GraphUIBase> {
  late double _xLeft;
  late double _xRight;
  bool? _draggingLeft;
  bool _showLeftCoord  = true;
  bool _showRightCoord = true;
  bool _coordEnabled   = true;
  bool _manualDisabled = false;

  Offset? _dragStart;
  double  _initXLeft  = 0;
  double  _initXRight = 0;

  @override
  void initState() {
    super.initState();
    _xLeft  = widget.initialXLeft;
    _xRight = widget.initialXRight;
  }

  // ── responsive graph size ─────────────────────────────────────────────────

  double _graphSize(BoxConstraints c) {
    final w = c.maxWidth;
    final h = c.maxHeight;
    final lim = h.isInfinite ? w : (w < h ? w : h);
    final s   = lim * 0.9;
    return s > 450.0 ? 450.0 : s;
  }

  // ── y value for interactive point ─────────────────────────────────────────

  double _yAt(double x) {
    for (final sp in widget.functionDef.specialPoints) {
      if ((sp.x - x).abs() < 0.001 && sp.isFilled) return sp.y;
    }
    try {
      final y = widget.functionDef.mainFunction(x);
      if (!y.isNaN && !y.isInfinite) return y;
    } catch (_) {}
    return 0.0;
  }

  // ── build ─────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      final size = _graphSize(constraints);

      // The graph widget — structure is unchanged from original so that pan
      // handler coordinate maths still works correctly.
      final Widget graph = Center(
        child: Container(
          width: size, height: size,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              GestureDetector(
                onPanStart:  _panStart,
                onPanUpdate: _panUpdate,
                onPanEnd:    _panEnd,
                child: SizedBox(
                  width: size, height: size,
                  child: CustomPaint(
                    painter: GraphPainter(
                      functionDef:         widget.functionDef,
                      xMin:                widget.xMin,
                      xMax:                widget.xMax,
                      yMin:                widget.yMin,
                      yMax:                widget.yMax,
                      functionXMin:        widget.functionXMin,
                      functionXMax:        widget.functionXMax,
                      xLeft:               _xLeft,
                      xRight:              _xRight,
                      yScale:              widget.yScale,
                      functionStrokeWidth: widget.functionStrokeWidth,
                      pointRadius:         widget.pointRadius,
                      axisStrokeWidth:     widget.axisStrokeWidth,
                      padding:             widget.padding,
                      xTicks:              widget.xTicks,
                      yTicks:              widget.yTicks,
                      xTickLabels:         widget.xTickLabels,
                      yTickLabels:         widget.yTickLabels,
                      functionColor:       widget.functionColor,
                      leftPointColor:      widget.leftPointColor,
                      rightPointColor:     widget.rightPointColor,
                      showLeftCoordinate:  _showLeftCoord  && _coordEnabled,
                      showRightCoordinate: _showRightCoord && _coordEnabled,
                    ),
                    size: Size(size, size),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

      // Standalone mode – no limit UI.
      if (widget.limitConfig == null) return graph;

      // ── Limit exploration mode ─────────────────────────────────────────
      final cfg         = widget.limitConfig!;
      final leftSorted  = ([...cfg.leftPresets]..sort());
      final rightSorted = ([...cfg.rightPresets]..sort());

      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            // 1. Graph
            graph,

            const SizedBox(height: 8),

            // 2. Left approach bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: LimitApproachBar(
                currentX:    _xLeft,
                xMin:        leftSorted.first,
                xMax:        leftSorted.last,
                presets:     cfg.leftPresets,
                isLeft:      true,
                limitXLabel: cfg.limitXLabel,
                color:       widget.leftPointColor,
                onChanged:   (x) => setState(
                  () => _xLeft = x.clamp(widget.dragMinLeft, widget.dragMaxLeft),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // 3. Left data card  (x, f(x), diff for current left point)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: LimitDataCard(
                x:        _xLeft,
                config:   cfg,
                function: widget.functionDef.mainFunction,
                isLeft:   true,
                color:    widget.leftPointColor,
              ),
            ),

            const SizedBox(height: 20),

            // 4. Right approach bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: LimitApproachBar(
                currentX:    _xRight,
                xMin:        rightSorted.first,
                xMax:        rightSorted.last,
                presets:     cfg.rightPresets,
                isLeft:      false,
                limitXLabel: cfg.limitXLabel,
                color:       widget.rightPointColor,
                onChanged:   (x) => setState(
                  () => _xRight = x.clamp(widget.dragMinRight, widget.dragMaxRight),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // 5. Right data card  (x, f(x), diff for current right point)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: LimitDataCard(
                x:        _xRight,
                config:   cfg,
                function: widget.functionDef.mainFunction,
                isLeft:   false,
                color:    widget.rightPointColor,
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      );
    });
  }

  // ── pan handlers (unchanged coordinate logic) ─────────────────────────────

  void _panStart(DragStartDetails d) {
    final box   = context.findRenderObject() as RenderBox;
    final local = box.globalToLocal(d.globalPosition);
    final area  = box.size;

    _dragStart  = local;
    _initXLeft  = _xLeft;
    _initXRight = _xRight;

    const padL  = 20.0;
    const padB  = 20.0;
    final gW    = area.width - 40.0;
    final xSc   = gW / (widget.xMax - widget.xMin);
    final ySc   = xSc * widget.yScale;
    final cx    = local.dx - padL;
    final cy    = area.height - local.dy - padB;

    if (_showLeftCoord || _showRightCoord) {
      final lyL = _yAt(_xLeft);  final lyR = _yAt(_xRight);
      final lcx = (_xLeft  - widget.xMin) * xSc;
      final lcy = (lyL     - widget.yMin) * ySc;
      final rcx = (_xRight - widget.xMin) * xSc;
      final rcy = (lyR     - widget.yMin) * ySc;
      if (_showLeftCoord  && _hitBox(cx, cy, lcx, lcy, true))  { _draggingLeft = true;  return; }
      if (_showRightCoord && _hitBox(cx, cy, rcx, rcy, false)) { _draggingLeft = false; return; }
    }

    final gx = widget.xMin + (cx / xSc);
    // Coord labels are always visible; just decide which point to drag.
    _draggingLeft = (gx - _xLeft).abs() < (gx - _xRight).abs();
  }

  void _panUpdate(DragUpdateDetails d) {
    final box  = context.findRenderObject() as RenderBox;
    final loc  = box.globalToLocal(d.globalPosition);
    final gW   = box.size.width - 40.0;
    final xSc  = gW / (widget.xMax - widget.xMin);
    final newX = widget.xMin + ((loc.dx - 20.0) / xSc);

    setState(() {
      if (_draggingLeft == true)  _xLeft  = newX.clamp(widget.dragMinLeft,  widget.dragMaxLeft);
      if (_draggingLeft == false) _xRight = newX.clamp(widget.dragMinRight, widget.dragMaxRight);
    });
  }

  void _panEnd(DragEndDetails d) {
    // Coordinate labels are always visible — no tap-to-hide behaviour.
    _draggingLeft = null;
    _dragStart    = null;
  }

  bool _hitBox(double cx, double cy, double px, double py, bool isL) {
    const w = 80.0; const h = 24.0; const off = 15.0;
    final l = isL ? px + off      : px - off - w;
    final r = isL ? px + off + w  : px - off;
    final b = isL ? py - off      : py + off;
    final t = isL ? py - off - h  : py + off + h;
    return cx >= l && cx <= r && cy >= b && cy <= t;
  }
}