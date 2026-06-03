import 'package:flutter/material.dart';
import 'dart:math';
import '../limit/graph_painter.dart'; // FunctionDefinition, SpecialPoint

// ─────────────────────────────────────────────────────────────────────────────
// SimpleGraphPainter
// ─────────────────────────────────────────────────────────────────────────────
//
// Like GraphPainter but:
//   • Two points only (no left/right concept — just point1 and point2)
//   • No coordinate pop-up boxes — data is shown in cards below
//   • Both a vertical AND horizontal dashed guide per point
//   • Custom x-axis / y-axis labels (important for the composite f graph)

class SimpleGraphPainter extends CustomPainter {
  final FunctionDefinition functionDef;
  final double xMin, xMax, yMin, yMax;
  final double functionXMin, functionXMax;

  // Two approach points in graph coordinates.
  // For the g(x) graph these are _xLeft and _xRight.
  // For the f(u) graph these are g(_xLeft) and g(_xRight).
  final double point1X;
  final double point2X;
  final Color point1Color;
  final Color point2Color;

  final double yScale;
  final double functionStrokeWidth;
  final double pointRadius;
  final double axisStrokeWidth;

  final List<dynamic> xTicks;
  final List<dynamic> yTicks;
  final List<String>? xTickLabels;
  final List<String>? yTickLabels;

  final Color functionColor;

  // Labels drawn at the arrow tips.
  final String xAxisLabel; // e.g. 'x' or 'g(x)'
  final String yAxisLabel; // e.g. 'y' or 'f(g(x))'

  const SimpleGraphPainter({
    required this.functionDef,
    required this.xMin,
    required this.xMax,
    required this.yMin,
    required this.yMax,
    required this.functionXMin,
    required this.functionXMax,
    required this.point1X,
    required this.point2X,
    required this.point1Color,
    required this.point2Color,
    required this.yScale,
    this.functionStrokeWidth = 4.5,
    this.pointRadius = 6.0,
    this.axisStrokeWidth = 2.5,
    required this.xTicks,
    required this.yTicks,
    this.xTickLabels,
    this.yTickLabels,
    required this.functionColor,
    this.xAxisLabel = 'x',
    this.yAxisLabel = 'y',
  });

  // ── constants ────────────────────────────────────────────────────────────
  static const double _padLeft   = 26.0;
  static const double _padRight  = 14.0;
  static const double _padBottom = 22.0;
  static const double _padTop    = 0.0;

  // ── paint ─────────────────────────────────────────────────────────────────

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..isAntiAlias = true;

    final gW = size.width  - _padLeft - _padRight;
    final gH = size.height - _padTop  - _padBottom;

    canvas.save();
    canvas.translate(_padLeft, size.height - _padBottom);
    canvas.scale(1, -1);

    final xSc = gW / (xMax - xMin);
    final ySc = xSc * yScale;

    Offset toCanvas(double x, double y) =>
        Offset((x - xMin) * xSc, (y - yMin) * ySc);

    _drawAxes(canvas, paint, toCanvas);
    _drawTicks(canvas, paint, toCanvas);
    _drawAxisLabels(canvas, paint, toCanvas);
    _drawFunction(canvas, paint, toCanvas);
    _drawSpecialPoints(canvas, paint, toCanvas);
    // Draw point2 first so point1 is rendered on top when they overlap.
    _drawPoint(canvas, paint, point2X, point2Color, toCanvas);
    _drawPoint(canvas, paint, point1X, point1Color, toCanvas);

    canvas.restore();
  }

  // ── axes ──────────────────────────────────────────────────────────────────

  void _drawAxes(Canvas canvas, Paint p, Offset Function(double, double) tc) {
    p
      ..color       = Colors.black
      ..strokeWidth = axisStrokeWidth
      ..style       = PaintingStyle.stroke;
    canvas.drawLine(tc(xMin, 0), tc(xMax, 0), p);
    canvas.drawLine(tc(0, yMin), tc(0, yMax), p);
    _drawArrows(canvas, p, tc);
  }

  void _drawArrows(Canvas canvas, Paint p, Offset Function(double, double) tc) {
    p.style = PaintingStyle.fill;

    final xTip = tc(xMax, 0);
    canvas.drawPath(
      Path()
        ..moveTo(xTip.dx, xTip.dy)
        ..lineTo(xTip.dx - 9, xTip.dy + 4.5)
        ..lineTo(xTip.dx - 9, xTip.dy - 4.5)
        ..close(),
      p,
    );

    final yTip = tc(0, yMax);
    canvas.drawPath(
      Path()
        ..moveTo(yTip.dx, yTip.dy)
        ..lineTo(yTip.dx - 4.5, yTip.dy - 9)
        ..lineTo(yTip.dx + 4.5, yTip.dy - 9)
        ..close(),
      p,
    );
  }

  // ── tick marks ────────────────────────────────────────────────────────────

  void _drawTicks(Canvas canvas, Paint p, Offset Function(double, double) tc) {
    p
      ..color       = Colors.black
      ..strokeWidth = 1.5
      ..style       = PaintingStyle.stroke;

    for (int i = 0; i < xTicks.length; i++) {
      final v   = xTicks[i].toDouble();
      final pos = tc(v, 0);
      canvas.drawLine(pos, pos.translate(0, -5), p);
      final lbl = (xTickLabels != null && i < xTickLabels!.length)
          ? xTickLabels![i]
          : v.round().toString();
      _drawText(canvas, pos.translate(0, -16), lbl, 11,
          fontWeight: FontWeight.w700);
    }

    for (int i = 0; i < yTicks.length; i++) {
      final v   = yTicks[i].toDouble();
      final pos = tc(0, v);
      canvas.drawLine(pos, pos.translate(-5, 0), p);
      final lbl = (yTickLabels != null && i < yTickLabels!.length)
          ? yTickLabels![i]
          : v.round().toString();
      _drawText(canvas, pos.translate(-17, 0), lbl, 11,
          fontWeight: FontWeight.w700);
    }
  }

  // ── axis labels ───────────────────────────────────────────────────────────

  void _drawAxisLabels(Canvas canvas, Paint p, Offset Function(double, double) tc) {
    _drawText(canvas, tc(xMax, 0).translate(13, 0), xAxisLabel, 13,
        fontWeight: FontWeight.bold);
    _drawText(canvas, tc(0, yMax).translate(0, 15), yAxisLabel, 13,
        fontWeight: FontWeight.bold);
  }

  // ── function curve ────────────────────────────────────────────────────────

  void _drawFunction(Canvas canvas, Paint p, Offset Function(double, double) tc) {
    p
      ..color       = functionColor
      ..strokeWidth = functionStrokeWidth
      ..style       = PaintingStyle.stroke;

    final step  = (functionXMax - functionXMin) / 500;
    final discs = functionDef.discontinuities ?? [];

    // Build segment bounds around discontinuities.
    final bounds = <double>[functionXMin];
    for (final d in discs) {
      if (d > functionXMin && d < functionXMax) bounds.add(d);
    }
    bounds.add(functionXMax);

    for (int i = 0; i < bounds.length - 1; i++) {
      _drawSegment(canvas, p, tc, bounds[i], bounds[i + 1], step);
    }
  }

  void _drawSegment(
    Canvas canvas,
    Paint p,
    Offset Function(double, double) tc,
    double x0,
    double x1,
    double step,
  ) {
    final path = Path();
    bool first = true;

    for (double x = x0; x <= x1 + step * 0.01; x += step) {
      final xc = x.clamp(x0, x1);
      try {
        final y = functionDef.mainFunction(xc);
        if (!y.isNaN && !y.isInfinite) {
          final pt = tc(xc, y);
          if (first) {
            path.moveTo(pt.dx, pt.dy);
            first = false;
          } else {
            path.lineTo(pt.dx, pt.dy);
          }
        } else {
          if (!first) {
            canvas.drawPath(path, p);
            path.reset();
            first = true;
          }
        }
      } catch (_) {
        if (!first) {
          canvas.drawPath(path, p);
          path.reset();
          first = true;
        }
      }
    }
    if (!first) canvas.drawPath(path, p);
  }

  // ── special points (holes / filled dots) ─────────────────────────────────

  void _drawSpecialPoints(
      Canvas canvas, Paint p, Offset Function(double, double) tc) {
    for (final sp in functionDef.specialPoints) {
      final pos = tc(sp.x, sp.y);
      final r   = pointRadius * 0.8;
      if (sp.isFilled) {
        p..color = sp.color ?? functionColor..style = PaintingStyle.fill;
        canvas.drawCircle(pos, r, p);
        p..color = Colors.black..style = PaintingStyle.stroke..strokeWidth = 1.5;
        canvas.drawCircle(pos, r, p);
      } else {
        p..color = Colors.white..style = PaintingStyle.fill;
        canvas.drawCircle(pos, r, p);
        p..color = Colors.black..style = PaintingStyle.stroke..strokeWidth = 1.5;
        canvas.drawCircle(pos, r, p);
      }
    }
  }

  // ── single interactive point ──────────────────────────────────────────────

  // _drawPoint: resolves y then delegates to _renderPoint so that Dart's
  // definite-assignment analysis is satisfied — y is always known before use.
  void _drawPoint(
    Canvas canvas,
    Paint p,
    double x,
    Color color,
    Offset Function(double, double) tc,
  ) {
    if (x.isNaN || x.isInfinite) return;

    // 1. Check for an explicit filled special point at this x.
    for (final sp in functionDef.specialPoints) {
      if ((sp.x - x).abs() < 0.001 && sp.isFilled) {
        _renderPoint(canvas, p, tc, x, sp.y, color);
        return;
      }
    }

    // 2. Evaluate the function — y is now definitely assigned before use.
    try {
      final y = functionDef.mainFunction(x);
      if (y.isNaN || y.isInfinite) return;
      _renderPoint(canvas, p, tc, x, y, color);
    } catch (_) {
      // Function undefined at x — skip silently.
    }
  }

  // Draws guides + filled circle once both x and y are known.
  void _renderPoint(
    Canvas canvas,
    Paint p,
    Offset Function(double, double) tc,
    double x,
    double y,
    Color color,
  ) {
    final pos = tc(x, y);

    // Vertical dashed guide (x-axis → point).
    _drawDashed(canvas, p, tc(x, 0), pos, color.withOpacity(0.55), 1.5);
    // Horizontal dashed guide (y-axis → point).
    _drawDashed(canvas, p, tc(0, y), pos, color.withOpacity(0.35), 1.5);

    // Filled circle with white ring.
    p
      ..color = color
      ..style = PaintingStyle.fill;
    canvas.drawCircle(pos, pointRadius, p);
    p
      ..color       = Colors.white
      ..style       = PaintingStyle.stroke
      ..strokeWidth = 2.5;
    canvas.drawCircle(pos, pointRadius, p);
  }

  // ── dashed line helper ────────────────────────────────────────────────────

  void _drawDashed(
    Canvas canvas,
    Paint p,
    Offset start,
    Offset end,
    Color color,
    double strokeWidth,
  ) {
    const dash = 4.0, gap = 3.0;
    p..color = color..strokeWidth = strokeWidth..style = PaintingStyle.stroke;

    final dx   = end.dx - start.dx;
    final dy   = end.dy - start.dy;
    final dist = sqrt(dx * dx + dy * dy);
    if (dist < 0.5) return;

    final ux = dx / dist, uy = dy / dist;
    double cur = 0;
    bool   draw = true;

    while (cur < dist) {
      final seg    = draw ? dash : gap;
      final segEnd = (cur + seg).clamp(0.0, dist);
      if (draw) {
        canvas.drawLine(
          Offset(start.dx + cur * ux, start.dy + cur * uy),
          Offset(start.dx + segEnd * ux, start.dy + segEnd * uy),
          p,
        );
      }
      cur  = segEnd;
      draw = !draw;
    }
  }

  // ── text ─────────────────────────────────────────────────────────────────

  void _drawText(
    Canvas canvas,
    Offset pos,
    String text,
    double fontSize, {
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    final tp = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontSize:   fontSize,
          color:      color,
          fontWeight: fontWeight,
          fontFamily: 'Roboto',
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    canvas.save();
    canvas.scale(1, -1);
    tp.paint(
      canvas,
      Offset(pos.dx - tp.width / 2, -pos.dy - tp.height / 2),
    );
    canvas.restore();
  }

  // ── repaint ───────────────────────────────────────────────────────────────

  @override
  bool shouldRepaint(covariant SimpleGraphPainter old) =>
      old.point1X != point1X || old.point2X != point2X;
}