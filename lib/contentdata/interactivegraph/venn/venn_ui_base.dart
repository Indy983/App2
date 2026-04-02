import 'package:flutter/material.dart';
import 'venn_data.dart';

class VennUIBase extends StatefulWidget {
  final VennConfiguration configuration;
  final Map<VennRegion, bool> initialSelections;
  
  const VennUIBase({
    Key? key,
    required this.configuration,
    required this.initialSelections,
  }) : super(key: key);

  @override
  State<VennUIBase> createState() => _VennUIBaseState();
}

class _VennUIBaseState extends State<VennUIBase> {
  // Simple Map for selections - no complex notifiers
  late Map<VennRegion, bool> _selections;
  
  @override
  void initState() {
    super.initState();
    _selections = Map<VennRegion, bool>.from(widget.initialSelections);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: widget.configuration.canvasWidth,
          height: widget.configuration.canvasHeight,
          child: Stack(
            children: [
              // Static background
              _buildBackground(),
              
              // 8 Interactive regions as simple containers
              ..._buildInteractiveRegions(),
              
              // Labels on top
              _buildLabels(),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildBackground() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: widget.configuration.rectangleStrokeColor,
          width: widget.configuration.rectangleStrokeWidth,
        ),
      ),
      child: CustomPaint(
        painter: _CircleOutlinesPainter(config: widget.configuration),
        size: Size(widget.configuration.canvasWidth, widget.configuration.canvasHeight),
      ),
    );
  }
  
  List<Widget> _buildInteractiveRegions() {
    return VennRegion.values.map((region) {
      return _buildClickableRegion(region);
    }).toList();
  }
  
  Widget _buildClickableRegion(VennRegion region) {
    return Positioned.fill(
      child: GestureDetector(
        onTapDown: (details) {
          final detectedRegion = VennRegionDetector.detectRegion(details.localPosition);
          if (detectedRegion == region) {
            setState(() {
              _selections[region] = !(_selections[region] ?? false);
            });
          }
        },
        child: ClipPath(
          clipper: _RegionClipper(region: region, config: widget.configuration),
          child: AnimatedContainer(
            duration: Duration.zero, // Instant color change like button press
            color: _selections[region] == true 
                ? widget.configuration.selectedColor
                : widget.configuration.unselectedColor,
          ),
        ),
      ),
    );
  }
  
  Widget _buildLabels() {
    return Stack(
      children: [
        _buildLabel(widget.configuration.labelA, widget.configuration.labelPosA),
        _buildLabel(widget.configuration.labelB, widget.configuration.labelPosB),
        _buildLabel(widget.configuration.labelC, widget.configuration.labelPosC),
        _buildLabel(widget.configuration.labelU, widget.configuration.labelPosU),
      ],
    );
  }
  
  Widget _buildLabel(String text, Offset position) {
    return Positioned(
      left: position.dx - 10, // Approximate centering
      top: position.dy - 10,
      child: Text(
        text,
        style: TextStyle(
          fontSize: widget.configuration.labelFontSize,
          fontWeight: widget.configuration.labelFontWeight,
          color: Colors.black,
        ),
      ),
    );
  }
  
  /// Public methods for external control
  Map<VennRegion, bool> getSelections() => Map.from(_selections);
  
  void setSelections(Map<VennRegion, bool> newSelections) {
    setState(() {
      _selections = Map.from(newSelections);
    });
  }
  
  void clearAllSelections() {
    setState(() {
      for (var key in _selections.keys) {
        _selections[key] = false;
      }
    });
  }
  
  void selectAllRegions() {
    setState(() {
      for (var key in _selections.keys) {
        _selections[key] = true;
      }
    });
  }
  
  void toggleSpecificRegion(VennRegion region) {
    setState(() {
      _selections[region] = !(_selections[region] ?? false);
    });
  }
  
  List<VennRegion> getSelectedRegions() {
    return _selections.entries
        .where((entry) => entry.value == true)
        .map((entry) => entry.key)
        .toList();
  }
}

/// Simple painter for circle outlines only
class _CircleOutlinesPainter extends CustomPainter {
  final VennConfiguration config;
  
  _CircleOutlinesPainter({required this.config});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = config.circleStrokeColor
      ..strokeWidth = config.circleStrokeWidth;
    
    canvas.drawCircle(config.centerA, config.circleRadius, paint);
    canvas.drawCircle(config.centerB, config.circleRadius, paint);
    canvas.drawCircle(config.centerC, config.circleRadius, paint);
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Custom clipper for each region - simplest approach
class _RegionClipper extends CustomClipper<Path> {
  final VennRegion region;
  final VennConfiguration config;
  
  _RegionClipper({required this.region, required this.config});

  @override
  Path getClip(Size size) {
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
  
  Path _createCirclePath(Offset center, double radius) {
    return Path()..addOval(Rect.fromCircle(center: center, radius: radius));
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

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}