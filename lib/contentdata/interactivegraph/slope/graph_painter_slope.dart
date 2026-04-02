import 'package:flutter/material.dart';
import 'dart:math';

// Data structure for a point
class Point {
  final double x;
  final double y;
  
  const Point(this.x, this.y);
}

// Enhanced function definition that can handle conditional functions AND secant lines
class FunctionDefinition {
  final double Function(double) mainFunction;
  final List<SpecialPoint> specialPoints;
  final List<double>? discontinuities; // x values where function is discontinuous
  final bool hasSecantLine; // Enable secant line drawing
  final Color? secantLineColor; // Color for secant line
  final double secantLineMinLength; // NEW: Minimum half-length of secant line
  final double secantLineExtensionRatio; // NEW: Extension ratio for secant line
  
  const FunctionDefinition({
    required this.mainFunction,
    this.specialPoints = const [],
    this.discontinuities,
    this.hasSecantLine = false, // Default: no secant line
    this.secantLineColor,
    this.secantLineMinLength = 1.0, // Default minimum half-length
    this.secantLineExtensionRatio = 0.2, // Default extension ratio (20%)
  });
}

// Data structure for special points (holes and filled points) - from original system
class SpecialPoint {
  final double x;
  final double y;
  final bool isFilled; // true = filled point, false = hole (empty point)
  final Color? color; // null = white for holes
  
  const SpecialPoint({
    required this.x,
    required this.y,
    required this.isFilled,
    this.color,
  });
}

class GraphPainterSlope extends CustomPainter {
  // Function and bounds - now using FunctionDefinition
  final FunctionDefinition functionDef;
  final double xMin, xMax, yMin, yMax; // Graph bounds (axes bounds)
  final double functionXMin, functionXMax; // Function drawing bounds
  
  // Interactive points
  final double xLeft, xRight;
  
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
  final Color leftPointColor;
  final Color rightPointColor;

  // Track if dragging has started
  final bool showLeftCoordinate;
  final bool showRightCoordinate;

  // NEW: Slope calculation and display
  final bool showSlope;
  final double Function(double)? slopeFunction;

  GraphPainterSlope({
    required this.functionDef,
    required this.xMin,
    required this.xMax,
    required this.yMin,
    required this.yMax,
    required this.functionXMin,
    required this.functionXMax,
    required this.xLeft,
    required this.xRight,
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
    required this.leftPointColor,
    required this.rightPointColor,
    this.showLeftCoordinate = false,
    this.showRightCoordinate = false,
    this.showSlope = false,
    this.slopeFunction,
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
    _drawEnhancedFunction(canvas, paint, toCanvas);
    _drawSpecialPoints(canvas, paint, toCanvas);
    
    // NEW: Draw secant line if enabled
    if (functionDef.hasSecantLine && showSlope && slopeFunction != null) {
      _drawSecantLine(canvas, paint, toCanvas);
    }
    
    _drawInteractivePoints(canvas, paint, toCanvas);

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

  void _drawEnhancedFunction(Canvas canvas, Paint paint, Offset Function(double, double) toCanvas) {
    paint
      ..color = functionColor
      ..strokeWidth = functionStrokeWidth
      ..style = PaintingStyle.stroke;

    final stepSize = (functionXMax - functionXMin) / 400; // Increased resolution for better detection
    final discontinuities = functionDef.discontinuities ?? [];
    
    // Sort discontinuities for easier processing
    final sortedDiscontinuities = List<double>.from(discontinuities)..sort();
    
    // Create segments between discontinuities
    List<double> segmentBounds = [functionXMin];
    for (double disc in sortedDiscontinuities) {
      if (disc > functionXMin && disc < functionXMax) {
        segmentBounds.add(disc);
      }
    }
    segmentBounds.add(functionXMax);
    
    // Draw each continuous segment
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
          // If we encounter invalid value, break the path and start new one
          if (hasValidPoint) {
            canvas.drawPath(path, paint);
            path.reset();
            isFirst = true;
            hasValidPoint = false;
          }
        }
      } catch (e) {
        // If we encounter error, break the path and start new one
        if (hasValidPoint) {
          canvas.drawPath(path, paint);
          path.reset();
          isFirst = true;
          hasValidPoint = false;
        }
        continue;
      }
    }

    // Draw the final path segment if it has valid points
    if (hasValidPoint) {
      canvas.drawPath(path, paint);
    }
  }

  void _drawSpecialPoints(Canvas canvas, Paint paint, Offset Function(double, double) toCanvas) {
    for (final specialPoint in functionDef.specialPoints) {
      final position = toCanvas(specialPoint.x, specialPoint.y);
      
      // Use same radius for both filled and empty points
      final specialPointRadius = pointRadius * 0.8;
      
      if (specialPoint.isFilled) {
        // Draw filled point with same size as hole
        paint
          ..color = specialPoint.color ?? functionColor
          ..style = PaintingStyle.fill;
        canvas.drawCircle(position, specialPointRadius, paint);
        
        // Black border for filled points (same as holes)
        paint
          ..color = Colors.black
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.5;
        canvas.drawCircle(position, specialPointRadius, paint);
      } else {
        // Draw hole (empty point)
        paint
          ..color = Colors.white
          ..style = PaintingStyle.fill;
        canvas.drawCircle(position, specialPointRadius, paint);
        
        // Black border for holes
        paint
          ..color = Colors.black
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.5;
        canvas.drawCircle(position, specialPointRadius, paint);
      }
    }
  }

  // NEW: Draw secant line with MINIMUM LENGTH and EXTENSION RATIO from data
  void _drawSecantLine(Canvas canvas, Paint paint, Offset Function(double, double) toCanvas) {
    if (slopeFunction == null) return;
    
    // Calculate y-values on the function curve for both x-coordinates
    final leftY = slopeFunction!(xLeft);
    final rightY = slopeFunction!(xRight);
    
    // Calculate slope of the secant line
    final slope = (rightY - leftY) / (xRight - xLeft);
    
    // Get settings from FunctionDefinition
    final minHalfLength = functionDef.secantLineMinLength;
    final extensionRatio = functionDef.secantLineExtensionRatio;
    
    // Calculate current distance between points
    final currentDistance = (xRight - xLeft).abs();
    final currentHalfDistance = currentDistance / 2;
    
    // Calculate extension based on current distance, but ensure minimum length
    final calculatedExtension = currentDistance * extensionRatio;
    final actualHalfLength = (currentHalfDistance + calculatedExtension).clamp(minHalfLength, double.infinity);
    
    // Calculate center point
    final centerX = (xLeft + xRight) / 2;
    final centerY = (leftY + rightY) / 2;
    
    // Calculate extended endpoints
    final extendedXLeft = (centerX - actualHalfLength).clamp(xMin, xMax);
    final extendedXRight = (centerX + actualHalfLength).clamp(xMin, xMax);
    
    // Calculate y-values for extended line using slope-intercept form
    // y - y_center = m(x - x_center)
    final extendedYLeft = centerY + slope * (extendedXLeft - centerX);
    final extendedYRight = centerY + slope * (extendedXRight - centerX);
    
    final leftPoint = toCanvas(extendedXLeft, extendedYLeft);
    final rightPoint = toCanvas(extendedXRight, extendedYRight);
    
    paint
      ..color = (functionDef.secantLineColor ?? Color(0xFF34D399)).withOpacity(0.8) // Use fade effect
      ..strokeWidth = functionStrokeWidth // Same thickness as function
      ..style = PaintingStyle.stroke;
    
    canvas.drawLine(leftPoint, rightPoint, paint);
  }

  void _drawInteractivePoints(Canvas canvas, Paint paint, Offset Function(double, double) toCanvas) {
    // Get y values using the main function for points on the curve
    final leftY = _getYValueForInteractivePoint(xLeft);
    final rightY = _getYValueForInteractivePoint(xRight);
    
    _drawPoint(canvas, paint, xLeft, leftY, leftPointColor, toCanvas, true, showLeftCoordinate);
    _drawPoint(canvas, paint, xRight, rightY, rightPointColor, toCanvas, false, showRightCoordinate);
  }

  double _getYValueForInteractivePoint(double x) {
    // Check if this x value has a special point (filled point takes precedence)
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
      // If function fails, try to find nearest valid point
    }
    
    // If function is undefined at this point, return 0 or some default
    return 0.0;
  }

  void _drawPoint(
    Canvas canvas,
    Paint paint,
    double x,
    double y,
    Color color,
    Offset Function(double, double) toCanvas,
    bool isLeft,
    bool showCoordinate,
  ) {
    final position = toCanvas(x, y);
    
    // Draw dashed line from x-axis to point
    paint
      ..color = Colors.grey.shade600
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    _drawDashedLine(canvas, toCanvas(x, 0), position, paint);

    // Draw point
    paint
      ..color = color
      ..style = PaintingStyle.fill;
    canvas.drawCircle(position, pointRadius, paint);

    paint
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    canvas.drawCircle(position, pointRadius, paint);

    // Draw coordinate box only if showCoordinate is true for this specific point
    if (showCoordinate) {
      final coordinateText = '(${x.toStringAsFixed(2)}, ${y.toStringAsFixed(2)})';
      _drawCoordinateBox(canvas, position, coordinateText, color, isLeft);
    }
  }

  void _drawCoordinateBox(
    Canvas canvas,
    Offset position,
    String text,
    Color color,
    bool isLeft,
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

    Offset boxPosition;
    if (isLeft) {
      boxPosition = Offset(
        position.dx + 15,
        position.dy - 15 - boxHeight,
      );
    } else {
      boxPosition = Offset(
        position.dx - 15 - boxWidth,
        position.dy + 15,
      );
    }

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
  bool shouldRepaint(covariant GraphPainterSlope oldDelegate) {
    return oldDelegate.xLeft != xLeft || 
           oldDelegate.xRight != xRight ||
           oldDelegate.showLeftCoordinate != showLeftCoordinate ||
           oldDelegate.showRightCoordinate != showRightCoordinate;
  }
}