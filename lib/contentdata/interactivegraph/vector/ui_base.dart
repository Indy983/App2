import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_svg/flutter_svg.dart';
import 'vector_data1.dart';
import 'vector_data2.dart';
import 'vector_painter.dart';

// Grid tile size (ยังคงใช้เพื่อการคำนวณสเกล)
const double tileSize = 50.0;

// Convert grid coordinates to screen coordinates (bottom-left as (1,1))
Offset gridToScreenFromBottomLeft(int gridX, int gridY, Size size) {
  final screenX = (gridX - 1) * tileSize + tileSize / 2;
  final screenY = size.height - ((gridY - 1) * tileSize + tileSize / 2);
  return Offset(screenX, screenY);
}

// Function to convert screen coordinates to grid X
double screenXToGridX(double screenX) {
  return (screenX - tileSize / 2) / tileSize + 1;
}

class VectorPoint {
  final String label;
  final Offset position;
  VectorPoint({required this.label, required this.position});
}

class VectorArrow {
  final String startLabel;
  final String endLabel;
  Offset startPos;
  Offset endPos;
  final bool isCarDirection;

  VectorArrow({
    required this.startLabel,
    required this.endLabel,
    required this.startPos,
    required this.endPos,
    this.isCarDirection = false,
  });
}

class VectorFigureData {
  final List<VectorPoint> points;
  final List<VectorArrow> arrows;

  VectorFigureData({required this.points, required this.arrows});
}

enum VectorDataType { type1, type2 }

class InteractiveVectorWidget extends StatefulWidget {
  final VectorFigureData data;
  final VectorDataType dataType;
  
  const InteractiveVectorWidget({
    super.key, 
    required this.data,
    this.dataType = VectorDataType.type1,
  });

  @override
  State<InteractiveVectorWidget> createState() => _InteractiveVectorWidgetState();
}

class _InteractiveVectorWidgetState extends State<InteractiveVectorWidget> {
  late List<VectorArrow> _arrows;
  late List<VectorPoint> _points;
  VectorArrow? _currentDraggingArrow;
  bool _isDraggingStart = false;

  Offset _carPosition = Offset.zero;
  double _carRotation = 0.0;
  double _slopeAngle = 0.0;

  final Random _random = Random();
  final double roughnessAmplitude = 3.0;
  List<double> _roughnessOffsets = [];

  @override
  void initState() {
    super.initState();
    _points = widget.data.points;
    _arrows = widget.data.arrows;

    // Generate roughness offsets based on data type
    if (widget.dataType == VectorDataType.type1) {
      VectorData1.generateRoughnessOffsets(_roughnessOffsets, _random, roughnessAmplitude);
    } else {
      VectorData2.generateRoughnessOffsets(_roughnessOffsets, _random, roughnessAmplitude);
    }

    // Initialize car position based on data type
    final initialGridX = 1.0;
    if (widget.dataType == VectorDataType.type1) {
      _carPosition = Offset(
        (initialGridX - 1) * tileSize + tileSize / 2,
        VectorData1.calculateScreenYFromGridX(initialGridX, Size(7 * tileSize, 7 * tileSize)),
      );
      _carRotation = VectorData1.getCarRotation(initialGridX);
      _slopeAngle = VectorData1.getSlopeAngle(initialGridX);
    } else {
      _carPosition = Offset(
        (initialGridX - 1) * tileSize + tileSize / 2,
        VectorData2.calculateScreenYFromGridX(initialGridX, Size(7 * tileSize, 7 * tileSize)),
      );
      _carRotation = VectorData2.getCarRotation(initialGridX);
      _slopeAngle = VectorData2.getSlopeAngle(initialGridX);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanDown: _handlePanDown,
      onPanUpdate: _handlePanUpdate,
      onPanEnd: _handlePanEnd,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(7 * tileSize, 7 * tileSize),
            painter: VectorPainter(
              points: _points,
              arrows: _arrows,
              carPosition: _carPosition,
              carRotation: _carRotation,
              slopeAngle: _slopeAngle,
              roughnessOffsets: _roughnessOffsets,
              dataType: widget.dataType,
              canvasSize: Size(7 * tileSize, 7 * tileSize),
            ),
          ),
          Positioned(
            left: _carPosition.dx - 60,
            top: _carPosition.dy - 30,
            child: Transform.rotate(
              angle: _carRotation,
              alignment: Alignment.center,
              child: SvgPicture.asset(
                'assets/car.svg',
                width: 80,
                height: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handlePanDown(DragDownDetails details) {
    final touch = details.localPosition;

    if ((touch - _carPosition).distance < 25) {
      _currentDraggingArrow = VectorArrow(
        startLabel: 'car',
        endLabel: 'car',
        startPos: _carPosition,
        endPos: _carPosition,
        isCarDirection: true,
      );
      _isDraggingStart = false;
      return;
    }
  }

  void _handlePanUpdate(DragUpdateDetails details) {
    if (_currentDraggingArrow != null && _currentDraggingArrow!.isCarDirection) {
      setState(() {
        double newScreenX = _carPosition.dx + details.delta.dx;
        double currentGridX = screenXToGridX(newScreenX);
        currentGridX = currentGridX.clamp(1.0, 7.0);
        newScreenX = (currentGridX - 1) * tileSize + tileSize / 2;

        double newScreenY;
        if (widget.dataType == VectorDataType.type1) {
          newScreenY = VectorData1.calculateScreenYFromGridX(currentGridX, Size(7 * tileSize, 7 * tileSize));
          _carRotation = VectorData1.getCarRotation(currentGridX);
          _slopeAngle = VectorData1.getSlopeAngle(currentGridX);
        } else {
          newScreenY = VectorData2.calculateScreenYFromGridX(currentGridX, Size(7 * tileSize, 7 * tileSize));
          _carRotation = VectorData2.getCarRotation(currentGridX);
          _slopeAngle = VectorData2.getSlopeAngle(currentGridX);
        }

        _carPosition = Offset(newScreenX, newScreenY);
      });
    }
  }

  void _handlePanEnd(DragEndDetails details) {
    _currentDraggingArrow = null;
  }
}
