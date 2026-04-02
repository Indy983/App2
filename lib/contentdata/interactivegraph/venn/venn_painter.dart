import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'venn_data.dart';

/// Background painter - draws static elements that never change
class VennBackgroundPainter extends CustomPainter {
  final VennConfiguration config;
  
  VennBackgroundPainter({required this.config});

  @override
  void paint(Canvas canvas, Size size) {
    _drawUniversalRectangle(canvas);
    _drawCircleOutlines(canvas);
    _drawLabels(canvas);
  }
  
  void _drawUniversalRectangle(Canvas canvas) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = config.rectangleStrokeColor
      ..strokeWidth = config.rectangleStrokeWidth;
    
    canvas.drawRect(config.universalRect, paint);
  }
  
  void _drawCircleOutlines(Canvas canvas) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = config.circleStrokeColor
      ..strokeWidth = config.circleStrokeWidth;
    
    // Draw circle outlines only
    canvas.drawCircle(config.centerA, config.circleRadius, paint);
    canvas.drawCircle(config.centerB, config.circleRadius, paint);
    canvas.drawCircle(config.centerC, config.circleRadius, paint);
  }
  
  void _drawLabels(Canvas canvas) {
    _drawLabel(canvas, config.labelA, config.labelPosA);
    _drawLabel(canvas, config.labelB, config.labelPosB);
    _drawLabel(canvas, config.labelC, config.labelPosC);
    _drawLabel(canvas, config.labelU, config.labelPosU);
  }
  
  void _drawLabel(Canvas canvas, String text, Offset position) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontSize: config.labelFontSize,
          fontWeight: config.labelFontWeight,
          color: Colors.black,
          fontFamily: 'Roboto',
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    
    textPainter.layout();
    
    final offset = Offset(
      position.dx - textPainter.width / 2,
      position.dy - textPainter.height / 2,
    );
    
    textPainter.paint(canvas, offset);
  }
  
  @override
  bool shouldRepaint(covariant VennBackgroundPainter oldDelegate) {
    return false; // Background never changes!
  }
}

/// Individual region painter - only repaints when this specific region changes
class VennRegionPainter extends CustomPainter {
  final VennConfiguration config;
  final VennRegion region;
  final bool isSelected;
  
  VennRegionPainter({
    required this.config,
    required this.region,
    required this.isSelected,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Only draw this specific region if it's selected
    if (isSelected) {
      final path = _createRegionPath(region);
      if (path != null) {
        final paint = Paint()
          ..style = PaintingStyle.fill
          ..color = config.selectedColor;
        
        canvas.drawPath(path, paint);
      }
    }
  }
  
  Path? _createRegionPath(VennRegion region) {
    switch (region) {
      case VennRegion.outsideAll:
        return _createOutsideAllPath();
      case VennRegion.aOnly:
        return _createAOnlyPath();
      case VennRegion.bOnly:
        return _createBOnlyPath();
      case VennRegion.cOnly:
        return _createCOnlyPath();
      case VennRegion.aAndB:
        return _createAAndBPath();
      case VennRegion.aAndC:
        return _createAAndCPath();
      case VennRegion.bAndC:
        return _createBAndCPath();
      case VennRegion.aAndBAndC:
        return _createAAndBAndCPath();
    }
  }
  
  Path _createOutsideAllPath() {
    final rect = Path()..addRect(config.universalRect);
    final circleA = _createCirclePath(config.centerA, config.circleRadius);
    final circleB = _createCirclePath(config.centerB, config.circleRadius);
    final circleC = _createCirclePath(config.centerC, config.circleRadius);
    
    return Path.combine(
      PathOperation.difference,
      Path.combine(
        PathOperation.difference,
        Path.combine(PathOperation.difference, rect, circleA),
        circleB,
      ),
      circleC,
    );
  }
  
  Path _createAOnlyPath() {
    final circleA = _createCirclePath(config.centerA, config.circleRadius);
    final circleB = _createCirclePath(config.centerB, config.circleRadius);
    final circleC = _createCirclePath(config.centerC, config.circleRadius);
    final unionBC = Path.combine(PathOperation.union, circleB, circleC);
    
    return Path.combine(PathOperation.difference, circleA, unionBC);
  }
  
  Path _createBOnlyPath() {
    final circleA = _createCirclePath(config.centerA, config.circleRadius);
    final circleB = _createCirclePath(config.centerB, config.circleRadius);
    final circleC = _createCirclePath(config.centerC, config.circleRadius);
    final unionAC = Path.combine(PathOperation.union, circleA, circleC);
    
    return Path.combine(PathOperation.difference, circleB, unionAC);
  }
  
  Path _createCOnlyPath() {
    final circleA = _createCirclePath(config.centerA, config.circleRadius);
    final circleB = _createCirclePath(config.centerB, config.circleRadius);
    final circleC = _createCirclePath(config.centerC, config.circleRadius);
    final unionAB = Path.combine(PathOperation.union, circleA, circleB);
    
    return Path.combine(PathOperation.difference, circleC, unionAB);
  }
  
  Path _createAAndBPath() {
    final circleA = _createCirclePath(config.centerA, config.circleRadius);
    final circleB = _createCirclePath(config.centerB, config.circleRadius);
    final circleC = _createCirclePath(config.centerC, config.circleRadius);
    final intersectAB = Path.combine(PathOperation.intersect, circleA, circleB);
    
    return Path.combine(PathOperation.difference, intersectAB, circleC);
  }
  
  Path _createAAndCPath() {
    final circleA = _createCirclePath(config.centerA, config.circleRadius);
    final circleB = _createCirclePath(config.centerB, config.circleRadius);
    final circleC = _createCirclePath(config.centerC, config.circleRadius);
    final intersectAC = Path.combine(PathOperation.intersect, circleA, circleC);
    
    return Path.combine(PathOperation.difference, intersectAC, circleB);
  }
  
  Path _createBAndCPath() {
    final circleA = _createCirclePath(config.centerA, config.circleRadius);
    final circleB = _createCirclePath(config.centerB, config.circleRadius);
    final circleC = _createCirclePath(config.centerC, config.circleRadius);
    final intersectBC = Path.combine(PathOperation.intersect, circleB, circleC);
    
    return Path.combine(PathOperation.difference, intersectBC, circleA);
  }
  
  Path _createAAndBAndCPath() {
    final circleA = _createCirclePath(config.centerA, config.circleRadius);
    final circleB = _createCirclePath(config.centerB, config.circleRadius);
    final circleC = _createCirclePath(config.centerC, config.circleRadius);
    final intersectAB = Path.combine(PathOperation.intersect, circleA, circleB);
    
    return Path.combine(PathOperation.intersect, intersectAB, circleC);
  }
  
  Path _createCirclePath(Offset center, double radius) {
    return Path()..addOval(Rect.fromCircle(center: center, radius: radius));
  }
  
  @override
  bool shouldRepaint(covariant VennRegionPainter oldDelegate) {
    // Only repaint if this specific region's selection state changed
    return oldDelegate.isSelected != isSelected;
  }
  
  @override
  bool hitTest(Offset position) {
    // Allow tap events to pass through
    return true;
  }
}

/// Legacy painter for backward compatibility - now optimized with new architecture
class VennPainter extends CustomPainter {
  final VennConfiguration config;
  final Map<VennRegion, bool> selections;
  
  VennPainter({
    required this.config,
    required this.selections,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Draw background
    VennBackgroundPainter(config: config).paint(canvas, size);
    
    // Draw each selected region
    for (final region in VennRegion.values) {
      if (selections[region] == true) {
        VennRegionPainter(
          config: config,
          region: region,
          isSelected: true,
        ).paint(canvas, size);
      }
    }
  }
  
  @override
  bool shouldRepaint(covariant VennPainter oldDelegate) {
    return oldDelegate.selections != selections;
  }
  
  @override
  bool hitTest(Offset position) {
    return true;
  }
}