import 'package:flutter/material.dart';
import 'dart:math';
import 'ui_base.dart';
import 'vector_data1.dart';
import 'vector_data2.dart';

class VectorPainter extends CustomPainter {
  final List<VectorPoint> points;
  final List<VectorArrow> arrows;
  final Offset carPosition;
  final double carRotation;
  final double slopeAngle;
  final List<double> roughnessOffsets;
  final VectorDataType dataType;

  VectorPainter({
    required this.points,
    required this.arrows,
    required this.carPosition,
    required this.carRotation,
    required this.slopeAngle,
    required this.roughnessOffsets,
    required this.dataType, required Size canvasSize,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Draw the slope based on data type
    if (dataType == VectorDataType.type1) {
      VectorData1.drawSlope(canvas, size, roughnessOffsets);
    } else {
      VectorData2.drawSlope(canvas, size, roughnessOffsets);
    }

    // Draw arrows
    final arrowPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;

    for (var arrow in arrows) {
      if (arrow.isCarDirection) {
        arrowPaint.color = Colors.blue;
        arrowPaint.strokeWidth = 3;
        final arrowLength = 30.0;
        final arrowEndX = carPosition.dx + arrowLength * cos(slopeAngle);
        final arrowEndY = carPosition.dy + arrowLength * sin(slopeAngle);
        canvas.drawLine(carPosition, Offset(arrowEndX, arrowEndY), arrowPaint);
        _drawArrowHead(canvas, carPosition, Offset(arrowEndX, arrowEndY), arrowPaint.color, arrowPaint.strokeWidth);
      }
    }
  }

  void _drawArrowHead(Canvas canvas, Offset start, Offset end, Color color, double strokeWidth) {
    const size = 20;
    final angle = atan2(end.dy - start.dy, end.dx - start.dx);
    final path = Path();
    path.moveTo(end.dx, end.dy);
    path.lineTo(end.dx - size * cos(angle - pi / 7), end.dy - size * sin(angle - pi / 7));
    path.lineTo(end.dx - size * cos(angle + pi / 7), end.dy - size * sin(angle + pi / 7));
    path.close();
    canvas.drawPath(path, Paint()..color = color);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is VectorPainter &&
        (oldDelegate.carPosition != carPosition ||
            oldDelegate.carRotation != carRotation ||
            oldDelegate.slopeAngle != slopeAngle ||
            oldDelegate.dataType != dataType);
  }
}