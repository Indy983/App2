import 'package:flutter/material.dart';

// ─────────────────────────────────────────────────────────────────────────────
// LimitApproachBar
// ─────────────────────────────────────────────────────────────────────────────
//
// Visual reference: thick colored fill → large circle thumb → dark tooltip
// with caret.
//
// Interactions:
//   Drag  → continuous x update once displacement > _kDeadZone
//   Tap   → snap to nearest preset within _kSnapPx; else jump to tapped x

class LimitApproachBar extends StatefulWidget {
  final double currentX;
  final double xMin;         // maps to left edge of bar
  final double xMax;         // maps to right edge of bar
  final List<double> presets;
  final bool isLeft;         // true = x → limit⁻, false = x → limit⁺
  final String limitXLabel;
  final Color color;
  final ValueChanged<double> onChanged;

  const LimitApproachBar({
    Key? key,
    required this.currentX,
    required this.xMin,
    required this.xMax,
    required this.presets,
    required this.isLeft,
    required this.limitXLabel,
    required this.color,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<LimitApproachBar> createState() => _LimitApproachBarState();
}

class _LimitApproachBarState extends State<LimitApproachBar> {
  // ── layout constants ──────────────────────────────────────────────────────
  static const double _kHPad      = 28.0;  // track horizontal inset
  static const double _kTrackH    = 10.0;  // track height
  static const double _kTrackY    = 70.0;  // track center-y from container top
  static const double _kThumbR    = 16.0;  // thumb radius
  static const double _kTipH      = 30.0;  // tooltip height
  static const double _kTipW      = 74.0;  // tooltip width
  static const double _kContH     = 118.0; // container height
  static const double _kSnapPx    = 32.0;  // tap-snap tolerance in pixels
  static const double _kDeadZone  = 6.0;   // px movement before drag starts
  static const double _kLblGap    = 40.0;  // min px between visible labels

  // ── gesture state ─────────────────────────────────────────────────────────
  double? _startDx;
  bool    _isDragging = false;

  // cached inside LayoutBuilder each frame
  double _trackW = 0;

  // ── x ↔ pixel ─────────────────────────────────────────────────────────────

  double _xToPx(double x) {
    final range = widget.xMax - widget.xMin;
    if (range == 0) return _kHPad;
    return _kHPad + ((x - widget.xMin) / range).clamp(0.0, 1.0) * _trackW;
  }

  double _pxToX(double px) {
    if (_trackW == 0) return widget.xMin;
    return widget.xMin +
        ((px - _kHPad) / _trackW).clamp(0.0, 1.0) *
            (widget.xMax - widget.xMin);
  }

  // ── tap → preset snap ─────────────────────────────────────────────────────

  void _onTap(double tapDx) {
    final sorted = ([...widget.presets]..sort());
    double? snap;
    double  best = _kSnapPx;
    for (final p in sorted) {
      final d = (tapDx - _xToPx(p)).abs();
      if (d < best) { best = d; snap = p; }
    }
    widget.onChanged(snap ?? _pxToX(tapDx).clamp(widget.xMin, widget.xMax));
  }

  // ── label collision avoidance (greedy left→right pass) ────────────────────

  Set<double> _showLabels(List<double> sorted) {
    final out  = <double>{};
    double last = double.negativeInfinity;
    for (final p in sorted) {
      final px = _xToPx(p);
      if (px - last >= _kLblGap) { out.add(p); last = px; }
    }
    return out;
  }

  static String _fmt(double v) {
    if (v == v.truncateToDouble()) return v.toInt().toString();
    final s = v.toStringAsFixed(6).replaceAll(RegExp(r'0+$'), '');
    return s.endsWith('.') ? s.substring(0, s.length - 1) : s;
  }

  bool _inFill(double px, double thumbPx) =>
      widget.isLeft ? px <= thumbPx : px >= thumbPx;

  // ── build ─────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      _trackW = constraints.maxWidth - _kHPad * 2;

      final sorted  = ([...widget.presets]..sort());
      final visible = _showLabels(sorted);
      final cx      = widget.currentX.clamp(widget.xMin, widget.xMax);
      final thumbPx = _xToPx(cx);

      // Active-fill direction: left-bar fills left→thumb; right-bar fills thumb→right.
      final double fillL, fillW;
      if (widget.isLeft) {
        fillL = _kHPad;
        fillW = (thumbPx - _kHPad).clamp(0.0, _trackW);
      } else {
        fillL = thumbPx;
        fillW = (_kHPad + _trackW - thumbPx).clamp(0.0, _trackW);
      }
      final bool roundL = (fillL - _kHPad).abs() < 0.5;
      final bool roundR = (fillL + fillW - (_kHPad + _trackW)).abs() < 0.5;

      // Tooltip: clamp so it stays inside container.
      const double tipTop = 8.0;
      final double tipL   = (thumbPx - _kTipW / 2)
          .clamp(6.0, constraints.maxWidth - _kTipW - 6);

      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onPanStart: (d) {
          _startDx    = d.localPosition.dx;
          _isDragging = false;
        },
        onPanUpdate: (d) {
          if (_startDx != null && !_isDragging &&
              (d.localPosition.dx - _startDx!).abs() >= _kDeadZone) {
            _isDragging = true;
          }
          if (_isDragging) {
            widget.onChanged(
              _pxToX(d.localPosition.dx).clamp(widget.xMin, widget.xMax),
            );
          }
        },
        onPanEnd: (_) {
          if (!_isDragging && _startDx != null) _onTap(_startDx!);
          _startDx    = null;
          _isDragging = false;
        },
        child: Container(
          height: _kContH,
          decoration: BoxDecoration(
            color:        Colors.white,
            borderRadius: BorderRadius.circular(16),
            border:       Border.all(color: const Color(0xFFE5E7EB)),
            boxShadow: [
              BoxShadow(
                color:      Colors.black.withOpacity(0.06),
                blurRadius: 14,
                offset:     const Offset(0, 3),
              ),
            ],
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [

              // ── direction label ────────────────────────────────────────
              Positioned(
                left: 14, top: 8,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 10, height: 10,
                      decoration: BoxDecoration(
                        color: widget.color, shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      widget.isLeft
                          ? 'x → ${widget.limitXLabel}⁻'
                          : 'x → ${widget.limitXLabel}⁺',
                      style: TextStyle(
                        fontSize:   15,
                        fontWeight: FontWeight.w800,
                        color:      widget.color,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
              ),

              // ── track background ───────────────────────────────────────
              Positioned(
                left:   _kHPad,
                width:  _trackW,
                top:    _kTrackY - _kTrackH / 2,
                height: _kTrackH,
                child: Container(
                  decoration: BoxDecoration(
                    color:        widget.color.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(_kTrackH / 2),
                  ),
                ),
              ),

              // ── active fill ────────────────────────────────────────────
              if (fillW > 0)
                Positioned(
                  left:   fillL,
                  width:  fillW,
                  top:    _kTrackY - _kTrackH / 2,
                  height: _kTrackH,
                  child: Container(
                    decoration: BoxDecoration(
                      color:        widget.color,
                      borderRadius: BorderRadius.only(
                        topLeft:     roundL ? Radius.circular(_kTrackH / 2) : Radius.zero,
                        bottomLeft:  roundL ? Radius.circular(_kTrackH / 2) : Radius.zero,
                        topRight:    roundR ? Radius.circular(_kTrackH / 2) : Radius.zero,
                        bottomRight: roundR ? Radius.circular(_kTrackH / 2) : Radius.zero,
                      ),
                    ),
                  ),
                ),

              // ── preset dots + labels ───────────────────────────────────
              for (final p in sorted) ...[
                // dot on track
                Positioned(
                  left:   _xToPx(p) - 4,
                  top:    _kTrackY - 4,
                  width:  8,
                  height: 8,
                  child: Container(
                    decoration: BoxDecoration(
                      color: _inFill(_xToPx(p), thumbPx)
                          ? Colors.white.withOpacity(0.85)
                          : widget.color.withOpacity(0.45),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                // label below track (if not occluded)
                if (visible.contains(p))
                  Positioned(
                    left:  (_xToPx(p) - 24).clamp(4.0, constraints.maxWidth - 52),
                    top:   _kTrackY + _kTrackH / 2 + 10,
                    width: 48,
                    child: Text(
                      _fmt(p),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize:   12,
                        fontFamily: 'RobotoMono',
                        fontWeight: FontWeight.w700,
                        color:      _inFill(_xToPx(p), thumbPx)
                            ? widget.color
                            : const Color(0xFFB0B8C8),
                      ),
                    ),
                  ),
              ],

              // ── thumb circle ───────────────────────────────────────────
              Positioned(
                left:   thumbPx - _kThumbR,
                top:    _kTrackY - _kThumbR,
                width:  _kThumbR * 2,
                height: _kThumbR * 2,
                child: Container(
                  decoration: BoxDecoration(
                    color:  widget.color,
                    shape:  BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 3.5),
                    boxShadow: [
                      BoxShadow(
                        color:      widget.color.withOpacity(0.44),
                        blurRadius: 16,
                        offset:     const Offset(0, 4),
                      ),
                    ],
                  ),
                ),
              ),

              // ── tooltip box ────────────────────────────────────────────
              Positioned(
                left:   tipL,
                top:    tipTop,
                width:  _kTipW,
                height: _kTipH,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color:        const Color(0xFF1E2235),
                    borderRadius: BorderRadius.circular(9),
                    boxShadow: [
                      BoxShadow(
                        color:      Colors.black.withOpacity(0.22),
                        blurRadius: 10,
                        offset:     const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    cx.toStringAsFixed(4),
                    style: const TextStyle(
                      fontSize:   13,
                      fontFamily: 'RobotoMono',
                      fontWeight: FontWeight.w700,
                      color:      Colors.white,
                    ),
                  ),
                ),
              ),

              // ── tooltip caret (downward triangle) ─────────────────────
              Positioned(
                left: (thumbPx - 5).clamp(6.0, constraints.maxWidth - 16.0),
                top:  tipTop + _kTipH - 0.5,
                child: CustomPaint(
                  painter: _Caret(const Color(0xFF1E2235)),
                  size:    const Size(10, 6),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

// ── downward-pointing triangle ────────────────────────────────────────────────

class _Caret extends CustomPainter {
  final Color color;
  const _Caret(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(
      Path()
        ..moveTo(0, 0)
        ..lineTo(size.width / 2, size.height)
        ..lineTo(size.width, 0)
        ..close(),
      Paint()..color = color..style = PaintingStyle.fill,
    );
  }

  @override
  bool shouldRepaint(_Caret old) => old.color != color;
}