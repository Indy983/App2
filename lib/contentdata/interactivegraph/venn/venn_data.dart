import 'package:flutter/material.dart';
import 'venn_ui_base.dart';

/// Venn Diagram Data: 3-Set Euler Diagram - Simplified for maximum performance
class _VennData {
  // Canvas dimensions - smaller for better mobile experience
  static const double canvasWidth = 280.0;
  static const double canvasHeight = 200.0;
  static const double padding = 20.0;
  
  // Circle properties
  static const double circleRadius = 60.0;
  static const double circleStrokeWidth = 2.0;
  
  // Circle positions (centers) - adjusted for smaller canvas
  static const Offset centerA = Offset(100.0, 80.0);   // Top-left
  static const Offset centerB = Offset(180.0, 80.0);   // Top-right  
  static const Offset centerC = Offset(140.0, 130.0);  // Bottom-center
  
  // Colors
  static const Color circleStrokeColor = Colors.black;
  static const Color unselectedColor = Colors.transparent; // Transparent instead of white
  static const Color selectedColor = Colors.red;
  static const Color rectangleStrokeColor = Colors.black;
  static const double rectangleStrokeWidth = 2.0;
  
  // Labels
  static const String labelA = 'A';
  static const String labelB = 'B';
  static const String labelC = 'C';
  static const String labelU = 'U';
  
  // Label positions - adjusted
  static const Offset labelPosA = Offset(60.0, 40.0);
  static const Offset labelPosB = Offset(220.0, 40.0);
  static const Offset labelPosC = Offset(140.0, 180.0);
  static const Offset labelPosU = Offset(250.0, 190.0);
  
  // Font settings
  static const double labelFontSize = 18.0;
  static const FontWeight labelFontWeight = FontWeight.bold;
  
  // Rectangle bounds (Universal set)
  static const Rect universalRect = Rect.fromLTWH(
    padding,
    padding,
    canvasWidth - 2 * padding,
    canvasHeight - 2 * padding,
  );
  
  // Initial state - all regions unselected
  static const Map<VennRegion, bool> initialSelections = {
    VennRegion.outsideAll: false,
    VennRegion.aOnly: false,
    VennRegion.bOnly: false,
    VennRegion.cOnly: false,
    VennRegion.aAndB: false,
    VennRegion.aAndC: false,
    VennRegion.bAndC: false,
    VennRegion.aAndBAndC: false,
  };
}

/// Enum representing the 8 distinct regions in a 3-set Venn diagram
enum VennRegion {
  outsideAll,    // Outside all circles but inside U
  aOnly,         // A only (A - B - C)
  bOnly,         // B only (B - A - C)
  cOnly,         // C only (C - A - B)
  aAndB,         // A ∩ B - C
  aAndC,         // A ∩ C - B
  bAndC,         // B ∩ C - A
  aAndBAndC,     // A ∩ B ∩ C
}

/// Simple region detector
class VennRegionDetector {
  static VennRegion? detectRegion(Offset point) {
    if (!_VennData.universalRect.contains(point)) {
      return null;
    }
    
    final bool inA = _isInCircle(point, _VennData.centerA, _VennData.circleRadius);
    final bool inB = _isInCircle(point, _VennData.centerB, _VennData.circleRadius);
    final bool inC = _isInCircle(point, _VennData.centerC, _VennData.circleRadius);
    
    if (inA && inB && inC) return VennRegion.aAndBAndC;
    if (inA && inB && !inC) return VennRegion.aAndB;
    if (inA && !inB && inC) return VennRegion.aAndC;
    if (!inA && inB && inC) return VennRegion.bAndC;
    if (inA && !inB && !inC) return VennRegion.aOnly;
    if (!inA && inB && !inC) return VennRegion.bOnly;
    if (!inA && !inB && inC) return VennRegion.cOnly;
    if (!inA && !inB && !inC) return VennRegion.outsideAll;
    
    return null;
  }
  
  static bool _isInCircle(Offset point, Offset center, double radius) {
    final dx = point.dx - center.dx;
    final dy = point.dy - center.dy;
    return (dx * dx + dy * dy) <= (radius * radius);
  }
}

/// Simplified configuration
class VennConfiguration {
  final double canvasWidth;
  final double canvasHeight;
  final double padding;
  final double circleRadius;
  final double circleStrokeWidth;
  final Offset centerA;
  final Offset centerB;
  final Offset centerC;
  final Color circleStrokeColor;
  final Color unselectedColor;
  final Color selectedColor;
  final Color rectangleStrokeColor;
  final double rectangleStrokeWidth;
  final String labelA;
  final String labelB;
  final String labelC;
  final String labelU;
  final Offset labelPosA;
  final Offset labelPosB;
  final Offset labelPosC;
  final Offset labelPosU;
  final double labelFontSize;
  final FontWeight labelFontWeight;
  final Rect universalRect;
  
  const VennConfiguration({
    this.canvasWidth = _VennData.canvasWidth,
    this.canvasHeight = _VennData.canvasHeight,
    this.padding = _VennData.padding,
    this.circleRadius = _VennData.circleRadius,
    this.circleStrokeWidth = _VennData.circleStrokeWidth,
    this.centerA = _VennData.centerA,
    this.centerB = _VennData.centerB,
    this.centerC = _VennData.centerC,
    this.circleStrokeColor = _VennData.circleStrokeColor,
    this.unselectedColor = _VennData.unselectedColor,
    this.selectedColor = _VennData.selectedColor,
    this.rectangleStrokeColor = _VennData.rectangleStrokeColor,
    this.rectangleStrokeWidth = _VennData.rectangleStrokeWidth,
    this.labelA = _VennData.labelA,
    this.labelB = _VennData.labelB,
    this.labelC = _VennData.labelC,
    this.labelU = _VennData.labelU,
    this.labelPosA = _VennData.labelPosA,
    this.labelPosB = _VennData.labelPosB,
    this.labelPosC = _VennData.labelPosC,
    this.labelPosU = _VennData.labelPosU,
    this.labelFontSize = _VennData.labelFontSize,
    this.labelFontWeight = _VennData.labelFontWeight,
    this.universalRect = _VennData.universalRect,
  });
  
  static const VennConfiguration defaultConfig = VennConfiguration();
}

/// Export widget
Widget getVennDiagramWidget() {
  return VennUIBase(
    configuration: VennConfiguration.defaultConfig,
    initialSelections: _VennData.initialSelections,
  );
}

final Widget vennDiagram = getVennDiagramWidget();