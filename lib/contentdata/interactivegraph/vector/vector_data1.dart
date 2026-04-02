import 'package:flutter/material.dart';
import 'dart:math';
import 'ui_base.dart';


const double tileSize = 50.0;

class VectorData1 {
  // Function to calculate screen Y from grid X using the slope equation (y = x/2)
  static double calculateScreenYFromGridX(double gridX, Size size) {
    final equationY = gridX / 2;
    final dynamicTileSize = size.width / 7; // ใช้ขนาดที่ปรับตามจริง
    return size.height - ((equationY - 1) * dynamicTileSize + dynamicTileSize / 2);
  }

  // Generate roughness offsets for the slope
  static void generateRoughnessOffsets(List<double> roughnessOffsets, Random random, double roughnessAmplitude) {
    roughnessOffsets.clear();
    for (double i = 1.0; i <= 7.0; i += 0.1) {
      roughnessOffsets.add((random.nextDouble() * 2 - 1) * roughnessAmplitude);
    }
  }

  // Get car rotation based on grid position
  static double getCarRotation(double gridX) {
    return -atan(0.5); // Slope is constant at 1/2
  }

  // Get slope angle based on grid position
  static double getSlopeAngle(double gridX) {
    return -atan(0.5); // Slope is constant at 1/2
  }

  // Get the slope equation Y value for given X
  static double getEquationY(double gridX) {
    return gridX / 2;
  }

  // Draw the filled area and slope line for this data type
  static void drawSlope(Canvas canvas, Size size, List<double> roughnessOffsets) {
    final dynamicTileSize = size.width / 7; // คำนวณขนาด tile ตามขนาดจริง
    
    final fillPath = Path();
    final startGridX = 1.0;
    final endGridX = 7.0;
    final baseLineY = size.height;

    // Move to the bottom-left point of the filled area
    fillPath.moveTo((startGridX - 1) * dynamicTileSize + dynamicTileSize / 2, baseLineY);

    // Draw up to the first point on the rough slope
    final initialGridY = startGridX / 2;
    double initialScreenY = size.height - ((initialGridY - 1) * dynamicTileSize + dynamicTileSize / 2);
    if (roughnessOffsets.isNotEmpty) {
      initialScreenY += roughnessOffsets.first;
    }
    fillPath.lineTo((startGridX - 1) * dynamicTileSize + dynamicTileSize / 2, initialScreenY);

    // Draw along the rough slope
    int offsetIndex = 0;
    for (double i = startGridX; i <= endGridX; i += 0.1) {
      final currentScreenX = (i - 1) * dynamicTileSize + dynamicTileSize / 2;
      final currentGridY = i / 2;
      double currentScreenY = size.height - ((currentGridY - 1) * dynamicTileSize + dynamicTileSize / 2);

      if (offsetIndex < roughnessOffsets.length) {
        currentScreenY += roughnessOffsets.elementAt(offsetIndex);
      }
      fillPath.lineTo(currentScreenX, currentScreenY);
      offsetIndex++;
    }

    // Draw down to the bottom-right point of the filled area
    fillPath.lineTo((endGridX - 1) * dynamicTileSize + dynamicTileSize / 2, baseLineY);
    fillPath.close();

    // Define the gradient for the fill
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

    // Draw the slope line
    final slopeLinePath = Path();
    final lineStartGridX = 1.0;
    final lineStartScreenX = (lineStartGridX - 1) * dynamicTileSize + dynamicTileSize / 2;
    final lineStartGridY = lineStartGridX / 2;
    double lineStartScreenY = size.height - ((lineStartGridY - 1) * dynamicTileSize + dynamicTileSize / 2);
    if (roughnessOffsets.isNotEmpty) {
      lineStartScreenY += roughnessOffsets.first;
    }
    slopeLinePath.moveTo(lineStartScreenX, lineStartScreenY);

    int lineOffsetIndex = 0;
    for (double i = lineStartGridX; i <= endGridX; i += 0.1) {
      final currentScreenX = (i - 1) * dynamicTileSize + dynamicTileSize / 2;
      final currentGridY = i / 2;
      double currentScreenY = size.height - ((currentGridY - 1) * dynamicTileSize + dynamicTileSize / 2);

      if (lineOffsetIndex < roughnessOffsets.length) {
        currentScreenY += roughnessOffsets.elementAt(lineOffsetIndex);
      }
      slopeLinePath.lineTo(currentScreenX, currentScreenY);
      lineOffsetIndex++;
    }

    final slopePaint = Paint()
      ..color = brownColor
      ..strokeWidth = 5.0
      ..style = PaintingStyle.stroke;

    canvas.drawPath(slopeLinePath, slopePaint);
  }
}

Widget getVectorWidget() {
  return LayoutBuilder(
    builder: (context, constraints) {
      return InteractiveVectorWidget(
        data: VectorFigureData(points: [], arrows: []),
        dataType: VectorDataType.type1,
      );
    },
  );
}