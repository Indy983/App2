import 'package:flutter/material.dart';
import 'dart:math';
import 'venn_diagram_data.dart'; // Import data for enum access

class VennDiagramPainter extends CustomPainter {
  final VennOperation? selectedOperation;
  final int intersectionCount;
  final Color colorA;
  final Color colorB;
  final Color colorIntersection;
  final Color colorUniverse;
  final Color unselectedColor;

  VennDiagramPainter({
    required this.selectedOperation,
    required this.intersectionCount,
    required this.colorA,
    required this.colorB,
    required this.colorIntersection,
    required this.colorUniverse,
    required this.unselectedColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..isAntiAlias = true;
    final center = Offset(size.width / 2, size.height / 2);
    final universeRect = Rect.fromLTWH(0, 0, size.width, size.height);

    // --- Define Circle properties (fixed size and position) ---
    final double circleRadius = size.width / 3.5;
    final double overlap = circleRadius / 2; // Fixed overlap for aesthetics
    final bool doIntersect = intersectionCount > 0;

    final Offset centerA = doIntersect
        ? Offset(center.dx - circleRadius / 2, center.dy)
        : Offset(center.dx - circleRadius - 20, center.dy);
    final Offset centerB = doIntersect
        ? Offset(center.dx + circleRadius / 2, center.dy)
        : Offset(center.dx + circleRadius + 20, center.dy);

    final Path pathA = Path()..addOval(Rect.fromCircle(center: centerA, radius: circleRadius));
    final Path pathB = Path()..addOval(Rect.fromCircle(center: centerB, radius: circleRadius));
    final Path universePath = Path()..addRect(universeRect);

    // --- Define Logical Regions ---
    final Path pathIntersection = Path.combine(PathOperation.intersect, pathA, pathB);
    final Path pathAOnly = Path.combine(PathOperation.difference, pathA, pathB);
    final Path pathBOnly = Path.combine(PathOperation.difference, pathB, pathA);
    final Path pathUnion = Path.combine(PathOperation.union, pathA, pathB);
    final Path pathUniverseOnly = Path.combine(PathOperation.difference, universePath, pathUnion);


    // --- Coloring Logic based on Selected Operation ---
    Color aOnlyColor = unselectedColor;
    Color bOnlyColor = unselectedColor;
    Color intersectionColor = doIntersect ? unselectedColor : Colors.transparent;
    Color universeColor = unselectedColor;

    switch (selectedOperation) {
      case VennOperation.A:
        aOnlyColor = colorA;
        if (doIntersect) intersectionColor = colorIntersection;
        break;
      case VennOperation.B:
        bOnlyColor = colorB;
        if (doIntersect) intersectionColor = colorIntersection;
        break;
      case VennOperation.A_INTERSECT_B:
         if (doIntersect) intersectionColor = colorIntersection;
        break;
      case VennOperation.A_UNION_B:
        aOnlyColor = colorA;
        bOnlyColor = colorB;
        if (doIntersect) intersectionColor = colorIntersection;
        break;
      case VennOperation.A_COMPLEMENT:
        bOnlyColor = colorB;
        universeColor = colorUniverse;
        break;
      case VennOperation.B_COMPLEMENT:
        aOnlyColor = colorA;
        universeColor = colorUniverse;
        break;
      case VennOperation.A_MINUS_B:
        aOnlyColor = colorA;
        break;
      case VennOperation.B_MINUS_A:
        bOnlyColor = colorB;
        break;
      case null: // Default state when nothing is selected
        aOnlyColor = colorA;
        bOnlyColor = colorB;
        if (doIntersect) intersectionColor = colorIntersection;
        universeColor = colorUniverse;
        break;
    }

    // --- Draw Everything ---
    // 1. Draw Universe background
    paint.style = PaintingStyle.fill;
    paint.color = universeColor;
    canvas.drawPath(pathUniverseOnly, paint);

    // 2. Draw A-only region
    paint.color = aOnlyColor;
    canvas.drawPath(pathAOnly, paint);

    // 3. Draw B-only region
    paint.color = bOnlyColor;
    canvas.drawPath(pathBOnly, paint);

    // 4. Draw Intersection region
    if (doIntersect) {
        paint.color = intersectionColor;
        canvas.drawPath(pathIntersection, paint);
    }

    // 5. Draw borders
    paint
      ..style = PaintingStyle.stroke
      ..color = Colors.black54
      ..strokeWidth = 2.0;

    canvas.drawRect(universeRect, paint);
    canvas.drawPath(pathA, paint);
    canvas.drawPath(pathB, paint);

    // 6. Draw Labels
    _drawText(canvas, centerA - Offset(0, circleRadius + 20), 'A', 24, fontWeight: FontWeight.bold);
    _drawText(canvas, centerB - Offset(0, circleRadius + 20), 'B', 24, fontWeight: FontWeight.bold);
  }

  void _drawText(
    Canvas canvas,
    Offset position,
    String text,
    double fontSize, {
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight,
        ),
      ),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );

    textPainter.layout();

    final textPosition = Offset(
      position.dx - textPainter.width / 2,
      position.dy - textPainter.height / 2,
    );

    textPainter.paint(canvas, textPosition);
  }


  @override
  bool shouldRepaint(covariant VennDiagramPainter oldDelegate) {
    // Repaint whenever the selected operation changes.
    return oldDelegate.selectedOperation != selectedOperation;
  }
}