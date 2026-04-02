import 'package:flutter/material.dart';
import 'dart:math';

// Data structure for a point
class Point {
  final double x;
  final double y;
  
  const Point(this.x, this.y);
}

// Enhanced function definition for tangent line
class TangentFunctionDefinition {
  final double Function(double) mainFunction;
  final double Function(double) derivativeFunction; // For calculating tangent slope
  final List<SpecialPoint> specialPoints;
  final List<double>? discontinuities;
  final Color? tangentLineColor;
  final double tangentLineMinLength;
  final double tangentLineExtensionRatio;
  
  const TangentFunctionDefinition({
    required this.mainFunction,
    required this.derivativeFunction,
    this.specialPoints = const [],
    this.discontinuities,
    this.tangentLineColor,
    this.tangentLineMinLength = 1.5,
    this.tangentLineExtensionRatio = 0.5,
  });
}

// Data structure for special points (holes and filled points)
class SpecialPoint {
  final double x;
  final double y;
  final bool isFilled;
  final Color? color;
  
  const SpecialPoint({
    required this.x,
    required this.y,
    required this.isFilled,
    this.color,
  });
}

class GraphPainterTangent extends CustomPainter {
  // Function and bounds
  final TangentFunctionDefinition functionDef;
  final double xMin, xMax, yMin, yMax;
  final double functionXMin, functionXMax;
  
  // Single tangent point
  final double xTangent;
  
  // Visual settings
  final double yScale;
  final double functionStrokeWidth;
  final double pointRadius;
  final double axisStrokeWidth;
  final double padding;
  
  // Tick marks
  final List<dynamic> xTicks;
  final List<dynamic> yTicks;
  final List<String>? xTickLabels;
  final List<String>? yTickLabels;
  
  // Colors
  final Color functionColor;
  final Color tangentPointColor;

  // Track if dragging has started
  final bool showCoordinate;

  GraphPainterTangent({
    required this.functionDef,
    required this.xMin,
    required this.xMax,
    required this.yMin,
    required this.yMax,
    required this.functionXMin,
    required this.functionXMax,
    required this.xTangent,
    required this.yScale,
    required this.functionStrokeWidth,
    required this.pointRadius,
    required this.axisStrokeWidth,
    required this.padding,
    required this.xTicks,
    required this.yTicks,
    this.xTickLabels,
    this.yTickLabels,
    required this.functionColor,
    required this.tangentPointColor,
    this.showCoordinate = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..isAntiAlias = true;
    final paddingTop = 0.0;
    final paddingBottom = 20.0;
    final paddingLeft = 20.0;
    final paddingRight = 20.0;
    
    final graphWidth = size.width - (paddingLeft + paddingRight);
    final graphHeight = size.height - (paddingTop + paddingBottom);

    canvas.save();
    canvas.translate(paddingLeft, size.height - paddingBottom);
    canvas.scale(1, -1);

    final xScale = graphWidth / (xMax - xMin);
    final yScaleActual = xScale * yScale;

    Offset toCanvas(double x, double y) => Offset(
      (x - xMin) * xScale,
      (y - yMin) * yScaleActual,
    );

    _drawAxes(canvas, paint, toCanvas);
    _drawTickMarks(canvas, paint, toCanvas);
    _drawAxisLabels(canvas, paint, toCanvas);
    _drawFunction(canvas, paint, toCanvas);
    _drawSpecialPoints(canvas, paint, toCanvas);
    _drawTangentLine(canvas, paint, toCanvas);
    _drawTangentPoint(canvas, paint, toCanvas);

    canvas.restore();
  }

  void _drawAxes(Canvas canvas, Paint paint, Offset Function(double, double) toCanvas) {
    paint
      ..color = Colors.black
      ..strokeWidth = axisStrokeWidth
      ..style = PaintingStyle.stroke;

    canvas.drawLine(toCanvas(xMin, 0), toCanvas(xMax, 0), paint);
    canvas.drawLine(toCanvas(0, yMin), toCanvas(0, yMax), paint);

    _drawArrows(canvas, paint, toCanvas);
  }

  void _drawArrows(Canvas canvas, Paint paint, Offset Function(double, double) toCanvas) {
    paint
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    
    final xArrowTip = toCanvas(xMax, 0);
    final xArrowPath = Path();
    xArrowPath.moveTo(xArrowTip.dx, xArrowTip.dy);
    xArrowPath.lineTo(xArrowTip.dx - 10, xArrowTip.dy + 5);
    xArrowPath.lineTo(xArrowTip.dx - 10, xArrowTip.dy - 5);
    xArrowPath.close();
    canvas.drawPath(xArrowPath, paint);

    final yArrowTip = toCanvas(0, yMax);
    final yArrowPath = Path();
    yArrowPath.moveTo(yArrowTip.dx, yArrowTip.dy);
    yArrowPath.lineTo(yArrowTip.dx - 5, yArrowTip.dy - 10);
    yArrowPath.lineTo(yArrowTip.dx + 5, yArrowTip.dy - 10);
    yArrowPath.close();
    canvas.drawPath(yArrowPath, paint);
  }

  void _drawTickMarks(Canvas canvas, Paint paint, Offset Function(double, double) toCanvas) {
    paint
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    for (int i = 0; i < xTicks.length; i++) {
      final tickValue = xTicks[i].toDouble();
      final pos = toCanvas(tickValue, 0);
      canvas.drawLine(pos, pos.translate(0, -6), paint);
      
      final label = xTickLabels != null && i < xTickLabels!.length 
          ? xTickLabels![i] 
          : tickValue.round().toString();
      _drawText(canvas, pos.translate(0, -20), label, 14, fontWeight: FontWeight.bold);
    }

    for (int i = 0; i < yTicks.length; i++) {
      final tickValue = yTicks[i].toDouble();
      final pos = toCanvas(0, tickValue);
      canvas.drawLine(pos, pos.translate(-6, 0), paint);
      
      final label = yTickLabels != null && i < yTickLabels!.length 
          ? yTickLabels![i] 
          : tickValue.round().toString();
      _drawText(canvas, pos.translate(-20, 0), label, 14, fontWeight: FontWeight.bold);
    }
  }

  void _drawAxisLabels(Canvas canvas, Paint paint, Offset Function(double, double) toCanvas) {
    final xTip = toCanvas(xMax, 0);
    _drawText(canvas, xTip.translate(15, 0), 'x', 18, fontWeight: FontWeight.bold);

    final yTip = toCanvas(0, yMax);
    _drawText(canvas, yTip.translate(0, 18), 'y', 18, fontWeight: FontWeight.bold);
  }

  void _drawFunction(Canvas canvas, Paint paint, Offset Function(double, double) toCanvas) {
    paint
      ..color = functionColor
      ..strokeWidth = functionStrokeWidth
      ..style = PaintingStyle.stroke;

    final stepSize = (functionXMax - functionXMin) / 400;
    final discontinuities = functionDef.discontinuities ?? [];
    
    final sortedDiscontinuities = List<double>.from(discontinuities)..sort();
    
    List<double> segmentBounds = [functionXMin];
    for (double disc in sortedDiscontinuities) {
      if (disc > functionXMin && disc < functionXMax) {
        segmentBounds.add(disc);
      }
    }
    segmentBounds.add(functionXMax);
    
    for (int i = 0; i < segmentBounds.length - 1; i++) {
      _drawFunctionSegment(
        canvas, 
        paint, 
        toCanvas, 
        segmentBounds[i], 
        segmentBounds[i + 1], 
        stepSize
      );
    }
  }

  void _drawFunctionSegment(
    Canvas canvas, 
    Paint paint, 
    Offset Function(double, double) toCanvas,
    double startX,
    double endX,
    double stepSize
  ) {
    final path = Path();
    bool isFirst = true;
    bool hasValidPoint = false;

    for (double x = startX; x <= endX; x += stepSize) {
      try {
        final y = functionDef.mainFunction(x);
        if (!y.isNaN && !y.isInfinite) {
          final point = toCanvas(x, y);
          if (isFirst) {
            path.moveTo(point.dx, point.dy);
            isFirst = false;
            hasValidPoint = true;
          } else {
            path.lineTo(point.dx, point.dy);
          }
        } else {
          if (hasValidPoint) {
            canvas.drawPath(path, paint);
            path.reset();
            isFirst = true;
            hasValidPoint = false;
          }
        }
      } catch (e) {
        if (hasValidPoint) {
          canvas.drawPath(path, paint);
          path.reset();
          isFirst = true;
          hasValidPoint = false;
        }
        continue;
      }
    }

    if (hasValidPoint) {
      canvas.drawPath(path, paint);
    }
  }

  void _drawSpecialPoints(Canvas canvas, Paint paint, Offset Function(double, double) toCanvas) {
    for (final specialPoint in functionDef.specialPoints) {
      final position = toCanvas(specialPoint.x, specialPoint.y);
      final specialPointRadius = pointRadius * 0.8;
      
      if (specialPoint.isFilled) {
        paint
          ..color = specialPoint.color ?? functionColor
          ..style = PaintingStyle.fill;
        canvas.drawCircle(position, specialPointRadius, paint);
        
        paint
          ..color = Colors.black
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.5;
        canvas.drawCircle(position, specialPointRadius, paint);
      } else {
        paint
          ..color = Colors.white
          ..style = PaintingStyle.fill;
        canvas.drawCircle(position, specialPointRadius, paint);
        
        paint
          ..color = Colors.black
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.5;
        canvas.drawCircle(position, specialPointRadius, paint);
      }
    }
  }

  void _drawTangentLine(Canvas canvas, Paint paint, Offset Function(double, double) toCanvas) {
    final tangentY = functionDef.mainFunction(xTangent);
    final slope = functionDef.derivativeFunction(xTangent);
    
    final minHalfLength = functionDef.tangentLineMinLength;
    final extensionRatio = functionDef.tangentLineExtensionRatio;
    
    final actualHalfLength = minHalfLength * (1 + extensionRatio);
    
    final extendedXLeft = (xTangent - actualHalfLength).clamp(xMin, xMax);
    final extendedXRight = (xTangent + actualHalfLength).clamp(xMin, xMax);
    
    final extendedYLeft = tangentY + slope * (extendedXLeft - xTangent);
    final extendedYRight = tangentY + slope * (extendedXRight - xTangent);
    
    final leftPoint = toCanvas(extendedXLeft, extendedYLeft);
    final rightPoint = toCanvas(extendedXRight, extendedYRight);
    
    paint
      ..color = (functionDef.tangentLineColor ?? Color(0xFF34D399)).withOpacity(0.8)
      ..strokeWidth = functionStrokeWidth
      ..style = PaintingStyle.stroke;
    
    canvas.drawLine(leftPoint, rightPoint, paint);
  }

  void _drawTangentPoint(Canvas canvas, Paint paint, Offset Function(double, double) toCanvas) {
    final tangentY = _getYValueForPoint(xTangent);
    _drawPoint(canvas, paint, xTangent, tangentY, tangentPointColor, toCanvas, showCoordinate);
  }

  double _getYValueForPoint(double x) {
    for (final specialPoint in functionDef.specialPoints) {
      if ((specialPoint.x - x).abs() < 0.001 && specialPoint.isFilled) {
        return specialPoint.y;
      }
    }
    
    try {
      final y = functionDef.mainFunction(x);
      if (!y.isNaN && !y.isInfinite) {
        return y;
      }
    } catch (e) {
      // If function fails, return 0
    }
    
    return 0.0;
  }

  void _drawPoint(
    Canvas canvas,
    Paint paint,
    double x,
    double y,
    Color color,
    Offset Function(double, double) toCanvas,
    bool showCoordinate,
  ) {
    final position = toCanvas(x, y);
    
    paint
      ..color = Colors.grey.shade600
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    _drawDashedLine(canvas, toCanvas(x, 0), position, paint);

    paint
      ..color = color
      ..style = PaintingStyle.fill;
    canvas.drawCircle(position, pointRadius, paint);

    paint
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    canvas.drawCircle(position, pointRadius, paint);

    if (showCoordinate) {
      final coordinateText = '(${x.toStringAsFixed(2)}, ${y.toStringAsFixed(2)})';
      _drawCoordinateBox(canvas, position, coordinateText, color);
    }
  }

  void _drawCoordinateBox(
    Canvas canvas,
    Offset position,
    String text,
    Color color,
  ) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontSize: 12,
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontFamily: 'Roboto',
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    final boxPadding = 6.0;
    final boxWidth = textPainter.width + (boxPadding * 2);
    final boxHeight = textPainter.height + (boxPadding * 2);

    final boxPosition = Offset(
      position.dx - boxWidth / 2,
      position.dy + 15,
    );

    final boxRect = Rect.fromLTWH(
      boxPosition.dx,
      boxPosition.dy,
      boxWidth,
      boxHeight,
    );

    final boxPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final boxPath = Path();
    boxPath.addRRect(RRect.fromRectAndRadius(boxRect, Radius.circular(4)));
    canvas.drawPath(boxPath, boxPaint);

    canvas.save();
    canvas.scale(1, -1);
    
    final textPosition = Offset(
      boxPosition.dx + boxPadding,
      -boxPosition.dy - boxPadding - textPainter.height,
    );
    
    textPainter.paint(canvas, textPosition);
    canvas.restore();
  }

  void _drawDashedLine(Canvas canvas, Offset start, Offset end, Paint paint) {
    const dashLength = 5.0;
    const gapLength = 3.0;

    final dx = end.dx - start.dx;
    final dy = end.dy - start.dy;
    final distance = sqrt(dx * dx + dy * dy);
    final unitX = dx / distance;
    final unitY = dy / distance;

    double currentDistance = 0;
    bool drawDash = true;

    while (currentDistance < distance) {
      final segmentLength = drawDash ? dashLength : gapLength;
      final segmentEnd = min(currentDistance + segmentLength, distance);

      if (drawDash) {
        final segmentStart = Offset(
          start.dx + currentDistance * unitX,
          start.dy + currentDistance * unitY,
        );
        final segmentEndPoint = Offset(
          start.dx + segmentEnd * unitX,
          start.dy + segmentEnd * unitY,
        );
        canvas.drawLine(segmentStart, segmentEndPoint, paint);
      }

      currentDistance = segmentEnd;
      drawDash = !drawDash;
    }
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
          fontFamily: 'Roboto',
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    
    canvas.save();
    canvas.scale(1, -1);
    textPainter.paint(
      canvas,
      Offset(
        position.dx - textPainter.width / 2,
        -position.dy - textPainter.height / 2,
      ),
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant GraphPainterTangent oldDelegate) {
    return oldDelegate.xTangent != xTangent ||
           oldDelegate.showCoordinate != showCoordinate;
  }
}