import 'package:flutter/material.dart';
import 'dart:math';
import 'ui_base.dart';

const double tileSize = 50.0;

class VectorData2 {
  // Function to calculate screen Y from grid X using the slope equation for two segments
  static double calculateScreenYFromGridX(double gridX, Size size) {
    double equationY;
    if (gridX >= 1.0 && gridX <= 3.6) {
      equationY = gridX / 3; // For x between 1 and 3, y = x/3
    } else if (gridX > 3.6 && gridX <= 7.0) {
      equationY = gridX -2.4; // For x between 3 and 7, y = x/2
    } else {
      // Handle cases outside the defined range
      if (gridX < 1.0) {
        equationY = 1.0 / 3; // Use y = x/3 slope at x=1
      } else {
        equationY = 7.0 ; // Use y = x/2 slope at x=7
      }
    }
    return size.height - ((equationY - 1) * tileSize + tileSize / 2);
  }

  // Generate roughness offsets for the slope
  static void generateRoughnessOffsets(List<double> roughnessOffsets, Random random, double roughnessAmplitude) {
    roughnessOffsets.clear();
    // We need enough points to cover the range 1.0 to 7.0 with 0.1 increments
    for (double i = 1.0; i <= 7.0 + 0.05; i += 0.1) { // Add small offset to ensure last point
      roughnessOffsets.add((random.nextDouble() * 2 - 1) * roughnessAmplitude);
    }
  }

  // Get car rotation based on grid position
  static double getCarRotation(double gridX) {
    double currentSlope;
    if (gridX >= 1.0 && gridX <= 3.6) {
      currentSlope = 1.0 / 3.0; // Slope for y = x/3
    } else { // gridX > 3.0 && gridX <= 7.0
      currentSlope = 1.0 / 1.0; // Slope for y = x/2
    }
    return -atan(currentSlope);
  }

  // Get slope angle based on grid position
  static double getSlopeAngle(double gridX) {
    double currentSlope;
    if (gridX >= 1.0 && gridX <= 3.6) {
      currentSlope = 1.0 / 3.0; // Slope for y = x/3
    } else { // gridX > 3.0 && gridX <= 7.0
      currentSlope = 1.0 / 1.0; // Slope for y = x/2
    }
    return -atan(currentSlope);
  }

  // Get the slope equation Y value for given X
  static double getEquationY(double gridX) {
    if (gridX >= 1.0 && gridX <= 3.6) {
      return gridX / 3; // For x between 1 and 3, y = x/3
    } else if (gridX > 3.6 && gridX <= 7.0) {
      return gridX - 2.4; // For x between 3 and 7, y = x/2
    } else {
      // Handle cases outside the defined range
      if (gridX < 1.0) {
        return 1.0 / 3; // Use y = x/3 slope at x=1
      } else {
        return 7.0 / 1; // Use y = x/2 slope at x=7
      }
    }
  }

  // Draw the filled area and slope line for this data type
  static void drawSlope(Canvas canvas, Size size, List<double> roughnessOffsets) {
    final fillPath = Path();
    final startGridX = 1.0;
    final endGridX = 7.0;
    final baseLineY = size.height;

    // Move to the bottom-left point of the filled area
    fillPath.moveTo((startGridX - 1) * tileSize + tileSize / 2, baseLineY);

    // Draw up to the first point on the rough slope
    double initialScreenY = calculateScreenYFromGridX(startGridX, size);
    if (roughnessOffsets.isNotEmpty) {
      initialScreenY += roughnessOffsets.first;
    }
    fillPath.lineTo((startGridX - 1) * tileSize + tileSize / 2, initialScreenY);

    // Draw along the rough slope
    int offsetIndex = 0;
    for (double i = startGridX; i <= endGridX + 0.05; i += 0.1) { // Add small offset to ensure end point is included
      final currentScreenX = (i - 1) * tileSize + tileSize / 2;
      double currentGridY;
      if (i >= 1.0 && i <= 3.6) {
        currentGridY = i / 3; // สำหรับ x ในช่วง 1 ถึง 3
      } else { // i > 3.0 && i <= 7.0
        currentGridY = i - 2.4; // สำหรับ x ในช่วง 3 ถึง 7
      }

      double currentScreenY = size.height - ((currentGridY - 1) * tileSize + tileSize / 2);

      if (offsetIndex < roughnessOffsets.length) {
        currentScreenY += roughnessOffsets.elementAt(offsetIndex);
      }
      fillPath.lineTo(currentScreenX, currentScreenY);
      offsetIndex++;
    }

    // Draw down to the bottom-right point of the filled area
    fillPath.lineTo((endGridX - 1) * tileSize + tileSize / 2, baseLineY);
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
    final lineStartScreenX = (lineStartGridX - 1) * tileSize + tileSize / 2;
    
    double lineStartScreenY = calculateScreenYFromGridX(lineStartGridX, size);
    if (roughnessOffsets.isNotEmpty) {
      lineStartScreenY += roughnessOffsets.first;
    }
    slopeLinePath.moveTo(lineStartScreenX, lineStartScreenY);

    int lineOffsetIndex = 0;
    for (double i = lineStartGridX; i <= endGridX + 0.05; i += 0.1) { // Add small offset
      final currentScreenX = (i - 1) * tileSize + tileSize / 2;
      double currentGridY;
      if (i >= 1.0 && i <= 3.6) {
        currentGridY = i / 3; // สำหรับ x ในช่วง 1 ถึง 3
      } else { // i > 3.0 && i <= 7.0
        currentGridY = i - 2.4; // สำหรับ x ในช่วง 3 ถึง 7
      }

      double currentScreenY = size.height - ((currentGridY - 1) * tileSize + tileSize / 2);

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
        dataType: VectorDataType.type2,
      );
    },
  );
}