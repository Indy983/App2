import 'package:flutter/material.dart';
import 'dart:math';

// Data structure for game points
class GamePoint {
  final double x;
  final double y;
  final bool isCorrect;

  const GamePoint({
    required this.x,
    required this.y,
    required this.isCorrect,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! GamePoint) return false;
    return other.x == x && other.y == y;
  }

  @override
  int get hashCode => x.hashCode ^ y.hashCode;
}

/// ✅ Graph Configuration Class - Import จาก graph_data
class GraphConfig {
  final double xMin, xMax, yMin, yMax;
  final double functionXMin, functionXMax;
  final double pointRadius;
  final double axisStrokeWidth;
  final double functionStrokeWidth;
  final double padding;
  final double graphSize;
  final List<int> xTicks;
  final List<int> yTicks;
  final Color backgroundColor;
  final Color axisColor;
  final Color pointColor;
  final Color selectedPointColor;
  final Color functionLineColor;
  final Color correctIconColor;
  final Color incorrectIconColor;
  final double Function(double) function;
  final String functionExpression;
  final List<GamePoint> allPoints;
  final List<GamePoint> correctPoints;
  final int maxSelectablePoints;
  final String correctFeedback; // เพิ่มเข้ามา
  final String incorrectFeedback; // เพิ่มเข้ามา
  final bool drawBothHalves; // เพิ่ม flag สำหรับวาดทั้งครึ่งบนและครึ่งล่าง

  const GraphConfig({
    required this.xMin, required this.xMax, required this.yMin, required this.yMax,
    required this.functionXMin, required this.functionXMax,
    required this.pointRadius, required this.axisStrokeWidth, required this.functionStrokeWidth,
    required this.padding, required this.graphSize,
    required this.xTicks, required this.yTicks,
    required this.backgroundColor, required this.axisColor, required this.pointColor,
    required this.selectedPointColor, required this.functionLineColor,
    required this.correctIconColor, required this.incorrectIconColor,
    required this.function, required this.functionExpression,
    required this.allPoints, required this.correctPoints, required this.maxSelectablePoints,
    required this.correctFeedback, // เพิ่มเข้ามา
    required this.incorrectFeedback, // เพิ่มเข้ามา
    this.drawBothHalves = false, // default false สำหรับ backward compatibility
  });
}

/// Helper class for coordinate transformation
class CoordinateTransformer {
  final GraphConfig config;
  final Size canvasSize;

  CoordinateTransformer({required this.config, required this.canvasSize});

  Offset graphToCanvas(double x, double y) {
    final drawingWidth = canvasSize.width - (config.padding * 2);
    final drawingHeight = canvasSize.height - (config.padding * 2);

    final xRange = config.xMax - config.xMin;
    final yRange = config.yMax - config.yMin;

    // Use the smaller dimension to determine unit size for 1:1 aspect ratio
    final double unitSize = (drawingWidth < drawingHeight ? drawingWidth : drawingHeight) /
                            (xRange > yRange ? xRange : yRange);

    // Convert graph coordinates to raw canvas coordinates (origin at bottom-left of drawing area)
    final canvasX = (x - config.xMin) * unitSize;
    final canvasY = (y - config.yMin) * unitSize;

    // Apply padding and flip Y-axis for Flutter's top-left origin
    return Offset(config.padding + canvasX, canvasSize.height - config.padding - canvasY);
  }

  // This method is for painters, where canvas transformations (translate, scale) are applied directly.
  // It returns coordinates relative to the transformed canvas origin (bottom-left of graph area)
  Offset toPainterCanvas(double x, double y) {
    final drawingWidth = canvasSize.width - (config.padding * 2);
    final double drawingHeight = canvasSize.height - (config.padding * 2); // Explicitly specify double type

    final xRange = config.xMax - config.xMin;
    final yRange = config.yMax - config.yMin;
    final unitSize = (drawingWidth < drawingHeight ? drawingWidth : drawingHeight) /
                     (xRange > yRange ? xRange : yRange);

    return Offset((x - config.xMin) * unitSize, (y - config.yMin) * unitSize);
  }
}

/// ✅ Static Graph Background Painter - รับ config แล้วใช้
class GraphBackgroundPainter extends CustomPainter {
  final GraphConfig config;
  final bool showFunctionLine;
  final CoordinateTransformer transformer; // Use the transformer

  GraphBackgroundPainter({
    required this.config,
    required this.showFunctionLine,
    required this.transformer,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..isAntiAlias = true;

    // Transform coordinate system for painter
    // Origin will be at bottom-left of the graph drawing area
    canvas.save();
    canvas.translate(config.padding, size.height - config.padding);
    canvas.scale(1, -1);

    // Draw background
    paint
      ..color = config.backgroundColor
      ..style = PaintingStyle.fill;
    // Draw background across the entire widget size
    canvas.drawRect(Rect.fromLTWH(-config.padding, -config.padding, size.width, size.height), paint);

    // Draw axes
    paint
      ..color = config.axisColor
      ..strokeWidth = config.axisStrokeWidth
      ..style = PaintingStyle.stroke;

    // Use transformer.toPainterCanvas for coordinates relative to painter's transformed canvas
    canvas.drawLine(transformer.toPainterCanvas(config.xMin, 0), transformer.toPainterCanvas(config.xMax, 0), paint);
    canvas.drawLine(transformer.toPainterCanvas(0, config.yMin), transformer.toPainterCanvas(0, config.yMax), paint);

    // Draw arrows
    _drawArrows(canvas, paint, transformer.toPainterCanvas);

    // Draw tick marks
    _drawTickMarks(canvas, paint, transformer.toPainterCanvas);

    // Draw axis labels
    _drawAxisLabels(canvas, paint, transformer.toPainterCanvas);

    // Draw function line if needed
    if (showFunctionLine) {
      _drawFunctionLine(canvas, paint, transformer.toPainterCanvas);
    }

    canvas.restore();
  }

  void _drawArrows(Canvas canvas, Paint paint, Offset Function(double, double) toCanvas) {
    paint
      ..color = config.axisColor
      ..style = PaintingStyle.fill;

    // X-axis arrow
    final xArrowTip = toCanvas(config.xMax, 0);
    final xArrowPath = Path();
    xArrowPath.moveTo(xArrowTip.dx, xArrowTip.dy);
    xArrowPath.lineTo(xArrowTip.dx - 8, xArrowTip.dy + 4);
    xArrowPath.lineTo(xArrowTip.dx - 8, xArrowTip.dy - 4);
    xArrowPath.close();
    canvas.drawPath(xArrowPath, paint);

    // Y-axis arrow
    final yArrowTip = toCanvas(0, config.yMax);
    final yArrowPath = Path();
    yArrowPath.moveTo(yArrowTip.dx, yArrowTip.dy);
    yArrowPath.lineTo(yArrowTip.dx - 4, yArrowTip.dy - 8);
    yArrowPath.lineTo(yArrowTip.dx + 4, yArrowTip.dy - 8);
    yArrowPath.close();
    canvas.drawPath(yArrowPath, paint);
  }

  void _drawTickMarks(Canvas canvas, Paint paint, Offset Function(double, double) toCanvas) {
    paint
      ..color = config.axisColor
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    for (final tick in config.xTicks) {
      final tickValue = tick.toDouble();
      final pos = toCanvas(tickValue, 0);
      canvas.drawLine(pos, pos.translate(0, -5), paint);
      _drawText(canvas, pos.translate(0, -15), tickValue.round().toString(), 12);
    }

    for (final tick in config.yTicks) {
      final tickValue = tick.toDouble();
      final pos = toCanvas(0, tickValue);
      canvas.drawLine(pos, pos.translate(-5, 0), paint);
      _drawText(canvas, pos.translate(-15, 0), tickValue.round().toString(), 12);
    }
  }

  void _drawAxisLabels(Canvas canvas, Paint paint, Offset Function(double, double) toCanvas) {
    // X-axis label
    final xLabelPos = toCanvas(config.xMax, 0).translate(15, 0);
    _drawText(canvas, xLabelPos, 'x', 14, fontWeight: FontWeight.bold);

    // Y-axis label
    final yLabelPos = toCanvas(0, config.yMax).translate(0, 15);
    _drawText(canvas, yLabelPos, 'y', 14, fontWeight: FontWeight.bold);
  }

  void _drawFunctionLine(Canvas canvas, Paint paint, Offset Function(double, double) toCanvas) {
    paint
      ..color = config.functionLineColor
      ..strokeWidth = config.functionStrokeWidth
      ..style = PaintingStyle.stroke;

    final stepSize = (config.functionXMax - config.functionXMin) / 200;

    if (config.drawBothHalves) {
      // วาดทั้งครึ่งบน (+y) และครึ่งล่าง (-y)
      // วาดครึ่งบนก่อน
      final pathTop = Path();
      bool isFirstTop = true;

      for (double x = config.functionXMin; x <= config.functionXMax; x += stepSize) {
        try {
          final y = config.function(x);
          if (!y.isNaN && !y.isInfinite) {
            final point = toCanvas(x, y);
            if (isFirstTop) {
              pathTop.moveTo(point.dx, point.dy);
              isFirstTop = false;
            } else {
              pathTop.lineTo(point.dx, point.dy);
            }
          }
        } catch (e) {
          continue;
        }
      }
      canvas.drawPath(pathTop, paint);

      // วาดครึ่งล่าง (negative y)
      final pathBottom = Path();
      bool isFirstBottom = true;

      for (double x = config.functionXMin; x <= config.functionXMax; x += stepSize) {
        try {
          final y = config.function(x);
          if (!y.isNaN && !y.isInfinite) {
            final point = toCanvas(x, -y); // ใช้ -y สำหรับครึ่งล่าง
            if (isFirstBottom) {
              pathBottom.moveTo(point.dx, point.dy);
              isFirstBottom = false;
            } else {
              pathBottom.lineTo(point.dx, point.dy);
            }
          }
        } catch (e) {
          continue;
        }
      }
      canvas.drawPath(pathBottom, paint);
    } else {
      // วาดแค่ครึ่งเดียว (backward compatibility)
      final path = Path();
      bool isFirst = true;

      for (double x = config.functionXMin; x <= config.functionXMax; x += stepSize) {
        try {
          final y = config.function(x);
          if (!y.isNaN && !y.isInfinite) {
            final point = toCanvas(x, y);
            if (isFirst) {
              path.moveTo(point.dx, point.dy);
              isFirst = false;
            } else {
              path.lineTo(point.dx, point.dy);
            }
          }
        } catch (e) {
          continue;
        }
      }
      canvas.drawPath(path, paint);
    }
  }

  void _drawText(Canvas canvas, Offset position, String text, double fontSize,
                {Color color = Colors.black, FontWeight fontWeight = FontWeight.normal}) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(fontSize: fontSize, color: color, fontWeight: fontWeight),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    canvas.save();
    // Only scale Y-axis for text, as the main canvas is already scaled for drawing.
    // The position.dy is already relative to the scaled canvas (bottom-left origin),
    // so we need to flip it back for textPainter which expects top-left origin.
    canvas.scale(1, -1);
    textPainter.paint(
      canvas,
      Offset(position.dx - textPainter.width / 2, -position.dy - textPainter.height / 2),
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(GraphBackgroundPainter oldDelegate) {
    return oldDelegate.showFunctionLine != showFunctionLine ||
           oldDelegate.config != config; // Added config to repaint condition
  }
}

/// ✅ Individual Point Widget - ใช้ config
class InteractivePoint extends StatelessWidget {
  final Offset position;
  final GraphConfig config;
  final ValueNotifier<bool> isSelectedNotifier;
  final VoidCallback onTap;

  const InteractivePoint({
    Key? key,
    required this.position,
    required this.config,
    required this.isSelectedNotifier,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx - config.pointRadius,
      top: position.dy - config.pointRadius,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: config.pointRadius * 2,
          height: config.pointRadius * 2,
          child: ValueListenableBuilder<bool>(
            valueListenable: isSelectedNotifier,
            builder: (context, isSelected, child) {
              return CustomPaint(
                painter: _PointPainter(
                  color: isSelected ? config.selectedPointColor : config.pointColor,
                  radius: config.pointRadius,
                ),
                size: Size(config.pointRadius * 2, config.pointRadius * 2),
              );
            },
          ),
        ),
      ),
    );
  }
}

/// ✅ Point Painter - วาดเฉพาะจุดเดียว
class _PointPainter extends CustomPainter {
  final Color color;
  final double radius;

  _PointPainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    canvas.drawCircle(Offset(radius, radius), radius, paint);
  }

  @override
  bool shouldRepaint(_PointPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

/// ✅ Main Optimized Graph Widget - รับ config เดียว
class OptimizedInteractiveGraph extends StatefulWidget {
  final GraphConfig config;

  const OptimizedInteractiveGraph({
    Key? key,
    required this.config,
  }) : super(key: key);

  @override
  State<OptimizedInteractiveGraph> createState() => _OptimizedInteractiveGraphState();
}

class _OptimizedInteractiveGraphState extends State<OptimizedInteractiveGraph> {
  // ✅ ใช้ config จาก widget.config
  GraphConfig get config => widget.config;

  // State
  late List<ValueNotifier<bool>> pointSelectionNotifiers;
  late ValueNotifier<bool> showFunctionLineNotifier;
  late ValueNotifier<bool> hasCheckedAnswerNotifier;
  late ValueNotifier<bool> isAnswerCorrectNotifier;
  late ValueNotifier<int> _selectedPointsCountNotifier; // Added to track selected points count
  late CoordinateTransformer _transformer;

  @override
  void initState() {
    super.initState();

    _transformer = CoordinateTransformer(config: config, canvasSize: Size(config.graphSize, config.graphSize));

    // Initialize notifiers for each point
    pointSelectionNotifiers = List.generate(
      config.allPoints.length,
      (index) {
        final notifier = ValueNotifier<bool>(false);
        notifier.addListener(_updateSelectedPointsCount); // Listen to changes
        return notifier;
      },
    );

    showFunctionLineNotifier = ValueNotifier<bool>(false);
    hasCheckedAnswerNotifier = ValueNotifier<bool>(false);
    isAnswerCorrectNotifier = ValueNotifier<bool>(false);
    _selectedPointsCountNotifier = ValueNotifier<int>(0); // Initialize count
  }

  @override
  void didUpdateWidget(covariant OptimizedInteractiveGraph oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.config != oldWidget.config) {
      // Reinitialize transformer if config changes
      _transformer = CoordinateTransformer(config: config, canvasSize: Size(config.graphSize, config.graphSize));
      // Reinitialize notifiers if allPoints changes (optional, depends on specific needs)
      if (widget.config.allPoints.length != oldWidget.config.allPoints.length) {
         for (final notifier in pointSelectionNotifiers) {
            notifier.removeListener(_updateSelectedPointsCount); // Remove old listener
            notifier.dispose();
          }
          pointSelectionNotifiers = List.generate(
            config.allPoints.length,
            (index) {
              final notifier = ValueNotifier<bool>(false);
              notifier.addListener(_updateSelectedPointsCount);
              return notifier;
            },
          );
      }
      _updateSelectedPointsCount(); // Update count after config change
    }
  }

  @override
  void dispose() {
    for (final notifier in pointSelectionNotifiers) {
      notifier.removeListener(_updateSelectedPointsCount); // Remove listener before disposing
      notifier.dispose();
    }
    showFunctionLineNotifier.dispose();
    hasCheckedAnswerNotifier.dispose();
    isAnswerCorrectNotifier.dispose();
    _selectedPointsCountNotifier.dispose(); // Dispose the new notifier
    super.dispose();
  }

  // Helper to update the count of selected points
  void _updateSelectedPointsCount() {
    _selectedPointsCountNotifier.value = pointSelectionNotifiers.where((n) => n.value).length;
  }

  // Convert graph coordinates to screen coordinates using the transformer
  Offset _graphToScreen(double x, double y) {
    return _transformer.graphToCanvas(x, y);
  }

  void _onPointTapped(int index) {
    final currentSelectedCount = _selectedPointsCountNotifier.value;
    final isCurrentlySelected = pointSelectionNotifiers[index].value;

    if (!isCurrentlySelected && currentSelectedCount >= config.maxSelectablePoints) {
      // If point is not selected and max points already selected, do nothing
      return;
    }

    // Toggle point selection
    pointSelectionNotifiers[index].value = !isCurrentlySelected;

    // Reset answer check when selection changes
    hasCheckedAnswerNotifier.value = false;
    isAnswerCorrectNotifier.value = false; // Reset correctness
    showFunctionLineNotifier.value = false; // Hide function line
  }

  List<int> _getSelectedPointIndices() {
    return pointSelectionNotifiers
        .asMap()
        .entries
        .where((entry) => entry.value.value)
        .map((entry) => entry.key)
        .toList();
  }

  void _checkAnswer() {
    final selectedIndices = _getSelectedPointIndices();
    final selectedPoints = selectedIndices.map((i) => config.allPoints[i]).toList();

    // Check if selected points match correct points
    final isCorrect = _doPointsMatch(selectedPoints, config.correctPoints);

    hasCheckedAnswerNotifier.value = true;
    isAnswerCorrectNotifier.value = isCorrect;
    showFunctionLineNotifier.value = isCorrect; // Show function line only if correct
  }

  bool _doPointsMatch(List<GamePoint> selected, List<GamePoint> correct) {
    if (selected.length != correct.length) return false;

    final selectedSet = Set<GamePoint>.from(selected);
    final correctSet = Set<GamePoint>.from(correct);

    // Check if all selected points are in correctSet AND all correct points are in selectedSet
    return selectedSet.containsAll(correctSet) && correctSet.containsAll(selectedSet);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // ✅ Graph Area with Stack
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Container(
                    width: config.graphSize,
                    height: config.graphSize,
                    child: Stack(
                      children: [
                        // ✅ Static Background (วาดครั้งเดียว)
                        ValueListenableBuilder<bool>(
                          valueListenable: showFunctionLineNotifier,
                          builder: (context, showLine, child) {
                            return CustomPaint(
                              painter: GraphBackgroundPainter(
                                config: config,
                                showFunctionLine: showLine,
                                transformer: _transformer, // Pass the transformer
                              ),
                              size: Size(config.graphSize, config.graphSize),
                            );
                          },
                        ),

                        // ✅ Interactive Points (แต่ละจุด repaint แยกกัน)
                        ...config.allPoints.asMap().entries.map((entry) {
                          final index = entry.key;
                          final point = entry.value;
                          final screenPos = _graphToScreen(point.x, point.y);

                          return InteractivePoint(
                            position: screenPos,
                            config: config,
                            isSelectedNotifier: pointSelectionNotifiers[index],
                            onTap: () => _onPointTapped(index),
                          );
                        }).toList(),

                        // ✅ New: Small checkmark at bottom-right of graph if correct
                        ValueListenableBuilder<bool>(
                          valueListenable: hasCheckedAnswerNotifier,
                          builder: (context, hasChecked, child) {
                            if (!hasChecked) return const SizedBox.shrink(); // Hide if not checked

                            return ValueListenableBuilder<bool>(
                              valueListenable: isAnswerCorrectNotifier,
                              builder: (context, isCorrect, child) {
                                if (!isCorrect) return const SizedBox.shrink(); // Hide if incorrect

                                return Positioned(
                                  right: 5, // Adjust position as needed
                                  bottom: 5, // Adjust position as needed
                                  child: Icon(
                                    Icons.check_circle_outline, // Use a suitable icon
                                    size: 30, // Adjust size as needed
                                    color: config.correctIconColor,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // ✅ Removed: Result icon next to graph
            ],
          ),

          const SizedBox(height: 24),

          // Check button
          ValueListenableBuilder<int>(
            valueListenable: _selectedPointsCountNotifier, // Listen to the new notifier
            builder: (context, selectedCount, child) {
              final isEnabled = selectedCount == config.maxSelectablePoints;

              return ElevatedButton(
                onPressed: isEnabled ? _checkAnswer : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isEnabled ? Colors.blue : Colors.grey.shade400,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                child: const Text('Check Answer'),
              );
            },
          ),

          // ✅ New: Result message from config
          ValueListenableBuilder<bool>(
            valueListenable: hasCheckedAnswerNotifier,
            builder: (context, hasChecked, child) {
              if (!hasChecked) return const SizedBox.shrink(); // Hide if not checked yet

              return Padding(
                padding: const EdgeInsets.only(top: 16),
                child: ValueListenableBuilder<bool>(
                  valueListenable: isAnswerCorrectNotifier,
                  builder: (context, isCorrect, child) {
                    return Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: (isCorrect ? Colors.green : Colors.orange).shade50,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: (isCorrect ? Colors.green : Colors.orange).shade200,
                        ),
                      ),
                      child: Text(
                        isCorrect ? config.correctFeedback : config.incorrectFeedback,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: (isCorrect ? Colors.green : Colors.orange).shade800,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}