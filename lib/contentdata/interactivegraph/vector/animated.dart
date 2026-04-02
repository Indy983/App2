import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';

class AnimatedCarWidget extends StatefulWidget {
  const AnimatedCarWidget({super.key});

  @override
  State<AnimatedCarWidget> createState() => _AnimatedCarWidgetState();
}

class _AnimatedCarWidgetState extends State<AnimatedCarWidget>
    with TickerProviderStateMixin {
  late AnimationController _carAnimationController;
  late Animation<double> _carPositionAnimation;

  bool _isAnimating = false;
  double _currentCarX = 1.0;
  double _carRotation = 0.0;

  final Random _random = Random();
  final double roughnessAmplitude = 3.0;
  List<double> _roughnessOffsets = [];

  @override
  void initState() {
    super.initState();

    _generateRoughnessOffsets();

    _carAnimationController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );

    _carPositionAnimation = Tween<double>(
      begin: 1.0,
      end: 7.0,
    ).animate(CurvedAnimation(
      parent: _carAnimationController,
      curve: Curves.easeInOut,
    ));

    _carPositionAnimation.addListener(() {
      setState(() {
        _currentCarX = _carPositionAnimation.value;
        _carRotation = 0.0;
      });
    });

    _carAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isAnimating = false;
        });
      } else if (status == AnimationStatus.forward) {
        setState(() {
          _isAnimating = true;
        });
      }
    });
  }

  void _generateRoughnessOffsets() {
    _roughnessOffsets.clear();
    for (double i = 1.0; i <= 7.0; i += 0.1) {
      _roughnessOffsets.add((_random.nextDouble() * 2 - 1) * roughnessAmplitude);
    }
  }

  @override
  void dispose() {
    _carAnimationController.dispose();
    super.dispose();
  }

  // Calculate screen Y from grid X - car runs on smooth road surface (y = 1)
  double calculateScreenYFromGridX(double gridX, Size size) {
    final equationY = 1.0; // Road equation: y = 1
    final dynamicTileSize = size.width / 7;
    // Calculate smooth road surface position without roughness
    double screenY = size.height - ((equationY - 1) * dynamicTileSize + dynamicTileSize / 2);
    
    return screenY;
  }

  // Get optimal widget size based on screen dimensions
  Size getOptimalWidgetSize(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    
    final isTablet = shortestSide > 600;
    
    double optimalSize;
    if (isTablet) {
      // For tablets: use fixed size but larger
      optimalSize = 400.0;
    } else {
      // For phones: use percentage of screen width with limits
      final contentWidth = screenWidth - 140; // Account for padding
      optimalSize = (contentWidth * 0.9).clamp(280.0, 380.0);
    }
    
    return Size(optimalSize, optimalSize);
  }

  void _startAnimation() {
    if (!_isAnimating) {
      _carAnimationController.reset();
      _carAnimationController.forward();
    }
  }

  void _resetAnimation() {
    _carAnimationController.reset();
    setState(() {
      _currentCarX = 1.0;
      _isAnimating = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final optimalSize = getOptimalWidgetSize(context);
    final dynamicTileSize = optimalSize.width / 7;
    
    // Changed Scaffold to Container to remove default background
    return Container( 
      alignment: Alignment.center, // Center the content within the container
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: optimalSize.width,
            height: optimalSize.height,
            child: Stack(
              children: [
                CustomPaint(
                  size: optimalSize,
                  painter: RoughRoadPainter(
                    roughnessOffsets: _roughnessOffsets,
                    carX: _currentCarX,
                    carYPosition: calculateScreenYFromGridX(_currentCarX, optimalSize),
                  ),
                ),
                Positioned(
                  left: (_currentCarX - 1) * dynamicTileSize + dynamicTileSize / 2 - 40,
                  top: calculateScreenYFromGridX(_currentCarX, optimalSize) - 40,
                  child: Transform.rotate(
                    angle: _carRotation,
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      'assets/car.svg',
                      width: 80,
                      height: 40,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  left: (7 - 1) * dynamicTileSize + dynamicTileSize / 2 - 30,
                  top: calculateScreenYFromGridX(7.0, optimalSize) - 80,
                  child: SvgPicture.asset(
                    'assets/tree.svg',
                    width: 60,
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _isAnimating ? null : _startAnimation,
                child: const Text('เริ่มเคลื่อนที่'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: _resetAnimation,
                child: const Text('รีเซ็ต'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RoughRoadPainter extends CustomPainter {
  final List<double> roughnessOffsets;
  final double carX;
  final double carYPosition;

  RoughRoadPainter({required this.roughnessOffsets, required this.carX, required this.carYPosition});

  @override
  void paint(Canvas canvas, Size size) {
    _drawRoughRoad(canvas, size);
    _drawArrow(canvas, size);
  }

  void _drawRoughRoad(Canvas canvas, Size size) {
    final dynamicTileSize = size.width / 7;

    final fillPath = Path();
    final startGridX = 1.0;
    final endGridX = 7.0;
    final baseLineY = size.height;

    fillPath.moveTo((startGridX - 1) * dynamicTileSize + dynamicTileSize / 2, baseLineY);

    final initialGridY = 1.0;
    double initialScreenY = size.height - ((initialGridY - 1) * dynamicTileSize + dynamicTileSize / 2);
    if (roughnessOffsets.isNotEmpty) {
      initialScreenY += roughnessOffsets.first;
    }
    fillPath.lineTo((startGridX - 1) * dynamicTileSize + dynamicTileSize / 2, initialScreenY);

    int offsetIndex = 0;
    for (double i = startGridX; i <= endGridX; i += 0.1) {
      final currentScreenX = (i - 1) * dynamicTileSize + dynamicTileSize / 2;
      final currentGridY = 1.0;
      double currentScreenY = size.height - ((currentGridY - 1) * dynamicTileSize + dynamicTileSize / 2);

      if (offsetIndex < roughnessOffsets.length) {
        currentScreenY += roughnessOffsets[offsetIndex];
      }
      fillPath.lineTo(currentScreenX, currentScreenY);
      offsetIndex++;
    }

    fillPath.lineTo((endGridX - 1) * dynamicTileSize + dynamicTileSize / 2, baseLineY);
    fillPath.close();

    final brownColor = Colors.brown;
    final fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          brownColor,
          brownColor,
          brownColor.shade900,
          brownColor.shade800,
          brownColor.shade700,
          brownColor.shade500,
        ],
        stops: const [0.0, 0.15, 0.3, 0.5, 0.7, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawPath(fillPath, fillPaint);

    final roadLinePath = Path();
    final lineStartGridX = 1.0;
    final lineStartScreenX = (lineStartGridX - 1) * dynamicTileSize + dynamicTileSize / 2;
    final lineStartGridY = 1.0;
    double lineStartScreenY = size.height - ((lineStartGridY - 1) * dynamicTileSize + dynamicTileSize / 2);
    if (roughnessOffsets.isNotEmpty) {
      lineStartScreenY += roughnessOffsets.first;
    }
    roadLinePath.moveTo(lineStartScreenX, lineStartScreenY);

    int lineOffsetIndex = 0;
    for (double i = lineStartGridX; i <= endGridX; i += 0.1) {
      final currentScreenX = (i - 1) * dynamicTileSize + dynamicTileSize / 2;
      final currentGridY = 1.0;
      double currentScreenY = size.height - ((currentGridY - 1) * dynamicTileSize + dynamicTileSize / 2);

      if (lineOffsetIndex < roughnessOffsets.length) {
        currentScreenY += roughnessOffsets[lineOffsetIndex];
      }
      roadLinePath.lineTo(currentScreenX, currentScreenY);
      lineOffsetIndex++;
    }

    final roadSurfacePaint = Paint()
      ..color = brownColor
      ..strokeWidth = 5.0
      ..style = PaintingStyle.stroke;

    canvas.drawPath(roadLinePath, roadSurfacePaint);
  }

  void _drawArrow(Canvas canvas, Size size) {
    final dynamicTileSize = size.width / 7;
    
    final arrowStartX = (1.0 - 1) * dynamicTileSize + dynamicTileSize / 2;
    final arrowStartY = size.height - ((1.0 - 1) * dynamicTileSize + dynamicTileSize / 2) - 50;
    
    final arrowEndX = (carX - 1) * dynamicTileSize + dynamicTileSize / 2;
    final arrowEndY = arrowStartY;

    final arrowStart = Offset(arrowStartX, arrowStartY);
    final arrowEnd = Offset(arrowEndX, arrowEndY);

    final displacement = carX - 1.0;
    if (displacement > 0.01) {
      final arrowPaint = Paint()
        ..color = Colors.yellow
        ..strokeWidth = 3;

      canvas.drawLine(arrowStart, arrowEnd, arrowPaint);

      _drawArrowHead(canvas, arrowStart, arrowEnd, Colors.yellow);

      final textPainter = TextPainter(
        text: TextSpan(
          text: '${displacement.toStringAsFixed(1)}',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      
      final midX = (arrowStartX + arrowEndX) / 2;
      textPainter.paint(canvas, Offset(midX - textPainter.width / 2, arrowStartY - 20));
    }
  }

  void _drawArrowHead(Canvas canvas, Offset start, Offset end, Color color) {
    const size = 15;
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
    return oldDelegate is RoughRoadPainter && oldDelegate.carX != carX;
  }
}

Widget getVectorWidget() {
  return LayoutBuilder(
    builder: (context, constraints) {
      return const AnimatedCarWidget();
    },
  );
}