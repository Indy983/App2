import 'package:flutter/material.dart';

// Data structure for complex number points
class ComplexPoint {
  final double real;  // r coordinate
  final double imaginary;  // i coordinate
  final bool isCorrect;
  final String? label;  // Label to show when correct (e.g., "1+i")

  const ComplexPoint({
    required this.real,
    required this.imaginary,
    required this.isCorrect,
    this.label,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ComplexPoint) return false;
    return other.real == real && other.imaginary == imaginary;
  }

  @override
  int get hashCode => real.hashCode ^ imaginary.hashCode;
}

/// ✅ Complex Graph Configuration Class
class ComplexGraphConfig {
  final double rMin, rMax, iMin, iMax;
  final double pointRadius;
  final double axisStrokeWidth;
  final double padding;
  final double graphSize;
  final List<int> rTicks;
  final List<int> iTicks;
  final Color backgroundColor;
  final Color axisColor;
  final Color pointColor;
  final Color selectedPointColor;
  final Color correctIconColor;
  final Color incorrectIconColor;
  final List<ComplexPoint> allPoints;
  final List<ComplexPoint> correctPoints;
  final int maxSelectablePoints;
  final String correctFeedback;
  final String incorrectFeedback;

  const ComplexGraphConfig({
    required this.rMin, required this.rMax, required this.iMin, required this.iMax,
    required this.pointRadius, required this.axisStrokeWidth,
    required this.padding, required this.graphSize,
    required this.rTicks, required this.iTicks,
    required this.backgroundColor, required this.axisColor, required this.pointColor,
    required this.selectedPointColor,
    required this.correctIconColor, required this.incorrectIconColor,
    required this.allPoints, required this.correctPoints, required this.maxSelectablePoints,
    required this.correctFeedback,
    required this.incorrectFeedback,
  });
}

/// Helper class for coordinate transformation
class ComplexCoordinateTransformer {
  final ComplexGraphConfig config;
  final Size canvasSize;

  ComplexCoordinateTransformer({required this.config, required this.canvasSize});

  Offset graphToCanvas(double r, double i) {
    final drawingWidth = canvasSize.width - (config.padding * 2);
    final drawingHeight = canvasSize.height - (config.padding * 2);

    final rRange = config.rMax - config.rMin;
    final iRange = config.iMax - config.iMin;

    final double unitSize = (drawingWidth < drawingHeight ? drawingWidth : drawingHeight) /
                            (rRange > iRange ? rRange : iRange);

    final canvasR = (r - config.rMin) * unitSize;
    final canvasI = (i - config.iMin) * unitSize;

    return Offset(config.padding + canvasR, canvasSize.height - config.padding - canvasI);
  }

  Offset toPainterCanvas(double r, double i) {
    final drawingWidth = canvasSize.width - (config.padding * 2);
    final double drawingHeight = canvasSize.height - (config.padding * 2);

    final rRange = config.rMax - config.rMin;
    final iRange = config.iMax - config.iMin;
    final unitSize = (drawingWidth < drawingHeight ? drawingWidth : drawingHeight) /
                     (rRange > iRange ? rRange : iRange);

    return Offset((r - config.rMin) * unitSize, (i - config.iMin) * unitSize);
  }
}

/// ✅ Complex Graph Background Painter
class ComplexGraphBackgroundPainter extends CustomPainter {
  final ComplexGraphConfig config;
  final ComplexCoordinateTransformer transformer;
  final List<ComplexPoint> pointsToLabel;  // Points to show labels for

  ComplexGraphBackgroundPainter({
    required this.config,
    required this.transformer,
    required this.pointsToLabel,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..isAntiAlias = true;

    canvas.save();
    canvas.translate(config.padding, size.height - config.padding);
    canvas.scale(1, -1);

    // Draw background
    paint
      ..color = config.backgroundColor
      ..style = PaintingStyle.fill;
    canvas.drawRect(Rect.fromLTWH(-config.padding, -config.padding, size.width, size.height), paint);

    // Draw axes
    paint
      ..color = config.axisColor
      ..strokeWidth = config.axisStrokeWidth
      ..style = PaintingStyle.stroke;

    canvas.drawLine(transformer.toPainterCanvas(config.rMin, 0), transformer.toPainterCanvas(config.rMax, 0), paint);
    canvas.drawLine(transformer.toPainterCanvas(0, config.iMin), transformer.toPainterCanvas(0, config.iMax), paint);

    // Draw arrows
    _drawArrows(canvas, paint, transformer.toPainterCanvas);

    // Draw tick marks
    _drawTickMarks(canvas, paint, transformer.toPainterCanvas);

    // Draw axis labels (r and i instead of x and y)
    _drawAxisLabels(canvas, paint, transformer.toPainterCanvas);

    // Draw labels for correct points
    _drawPointLabels(canvas, paint, transformer.toPainterCanvas);

    canvas.restore();
  }

  void _drawArrows(Canvas canvas, Paint paint, Offset Function(double, double) toCanvas) {
    paint
      ..color = config.axisColor
      ..style = PaintingStyle.fill;

    // R-axis arrow
    final rArrowTip = toCanvas(config.rMax, 0);
    final rArrowPath = Path();
    rArrowPath.moveTo(rArrowTip.dx, rArrowTip.dy);
    rArrowPath.lineTo(rArrowTip.dx - 8, rArrowTip.dy + 4);
    rArrowPath.lineTo(rArrowTip.dx - 8, rArrowTip.dy - 4);
    rArrowPath.close();
    canvas.drawPath(rArrowPath, paint);

    // I-axis arrow
    final iArrowTip = toCanvas(0, config.iMax);
    final iArrowPath = Path();
    iArrowPath.moveTo(iArrowTip.dx, iArrowTip.dy);
    iArrowPath.lineTo(iArrowTip.dx - 4, iArrowTip.dy - 8);
    iArrowPath.lineTo(iArrowTip.dx + 4, iArrowTip.dy - 8);
    iArrowPath.close();
    canvas.drawPath(iArrowPath, paint);
  }

  void _drawTickMarks(Canvas canvas, Paint paint, Offset Function(double, double) toCanvas) {
    paint
      ..color = config.axisColor
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    for (final tick in config.rTicks) {
      final tickValue = tick.toDouble();
      if (tickValue == 0) continue;  // Skip origin
      final pos = toCanvas(tickValue, 0);
      canvas.drawLine(pos, pos.translate(0, -5), paint);
      _drawText(canvas, pos.translate(0, -15), tickValue.round().toString(), 12);
    }

    for (final tick in config.iTicks) {
      final tickValue = tick.toDouble();
      if (tickValue == 0) continue;  // Skip origin
      final pos = toCanvas(0, tickValue);
      canvas.drawLine(pos, pos.translate(-5, 0), paint);
      _drawText(canvas, pos.translate(-15, 0), tickValue.round().toString(), 12);
    }
  }

  void _drawAxisLabels(Canvas canvas, Paint paint, Offset Function(double, double) toCanvas) {
    // R-axis label
    final rLabelPos = toCanvas(config.rMax, 0).translate(15, 0);
    _drawText(canvas, rLabelPos, 'r', 14, fontWeight: FontWeight.bold);

    // I-axis label
    final iLabelPos = toCanvas(0, config.iMax).translate(0, 15);
    _drawText(canvas, iLabelPos, 'i', 14, fontWeight: FontWeight.bold);
  }

  void _drawPointLabels(Canvas canvas, Paint paint, Offset Function(double, double) toCanvas) {
    for (final point in pointsToLabel) {
      if (point.label != null) {
        final pos = toCanvas(point.real, point.imaginary);
        // Draw label above the point
        _drawText(
          canvas, 
          pos.translate(0, 20),  // Position above the point
          point.label!,
          13,
          fontWeight: FontWeight.bold,
          color: Colors.blue.shade700,
        );
      }
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
    canvas.scale(1, -1);
    textPainter.paint(
      canvas,
      Offset(position.dx - textPainter.width / 2, -position.dy - textPainter.height / 2),
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(ComplexGraphBackgroundPainter oldDelegate) {
    return oldDelegate.pointsToLabel != pointsToLabel ||
           oldDelegate.config != config;
  }
}

/// ✅ Individual Point Widget
class ComplexInteractivePoint extends StatelessWidget {
  final Offset position;
  final ComplexGraphConfig config;
  final ValueNotifier<bool> isSelectedNotifier;
  final VoidCallback onTap;

  const ComplexInteractivePoint({
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
                painter: _ComplexPointPainter(
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

/// ✅ Point Painter
class _ComplexPointPainter extends CustomPainter {
  final Color color;
  final double radius;

  _ComplexPointPainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    canvas.drawCircle(Offset(radius, radius), radius, paint);
  }

  @override
  bool shouldRepaint(_ComplexPointPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

/// ✅ Main Complex Graph Widget
class OptimizedComplexGraph extends StatefulWidget {
  final ComplexGraphConfig config;

  const OptimizedComplexGraph({
    Key? key,
    required this.config,
  }) : super(key: key);

  @override
  State<OptimizedComplexGraph> createState() => _OptimizedComplexGraphState();
}

class _OptimizedComplexGraphState extends State<OptimizedComplexGraph> {
  ComplexGraphConfig get config => widget.config;

  late List<ValueNotifier<bool>> pointSelectionNotifiers;
  late ValueNotifier<bool> hasCheckedAnswerNotifier;
  late ValueNotifier<bool> isAnswerCorrectNotifier;
  late ValueNotifier<int> _selectedPointsCountNotifier;
  late ValueNotifier<List<ComplexPoint>> _pointsToLabelNotifier;  // Points to show labels for
  late ComplexCoordinateTransformer _transformer;

  @override
  void initState() {
    super.initState();

    _transformer = ComplexCoordinateTransformer(
      config: config, 
      canvasSize: Size(config.graphSize, config.graphSize)
    );

    pointSelectionNotifiers = List.generate(
      config.allPoints.length,
      (index) {
        final notifier = ValueNotifier<bool>(false);
        notifier.addListener(_updateSelectedPointsCount);
        return notifier;
      },
    );

    hasCheckedAnswerNotifier = ValueNotifier<bool>(false);
    isAnswerCorrectNotifier = ValueNotifier<bool>(false);
    _selectedPointsCountNotifier = ValueNotifier<int>(0);
    _pointsToLabelNotifier = ValueNotifier<List<ComplexPoint>>([]);
  }

  @override
  void didUpdateWidget(covariant OptimizedComplexGraph oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.config != oldWidget.config) {
      _transformer = ComplexCoordinateTransformer(
        config: config, 
        canvasSize: Size(config.graphSize, config.graphSize)
      );
      
      if (widget.config.allPoints.length != oldWidget.config.allPoints.length) {
        for (final notifier in pointSelectionNotifiers) {
          notifier.removeListener(_updateSelectedPointsCount);
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
      _updateSelectedPointsCount();
    }
  }

  @override
  void dispose() {
    for (final notifier in pointSelectionNotifiers) {
      notifier.removeListener(_updateSelectedPointsCount);
      notifier.dispose();
    }
    hasCheckedAnswerNotifier.dispose();
    isAnswerCorrectNotifier.dispose();
    _selectedPointsCountNotifier.dispose();
    _pointsToLabelNotifier.dispose();
    super.dispose();
  }

  void _updateSelectedPointsCount() {
    _selectedPointsCountNotifier.value = pointSelectionNotifiers.where((n) => n.value).length;
  }

  Offset _graphToScreen(double r, double i) {
    return _transformer.graphToCanvas(r, i);
  }

  void _onPointTapped(int index) {
    final currentSelectedCount = _selectedPointsCountNotifier.value;
    final isCurrentlySelected = pointSelectionNotifiers[index].value;

    if (!isCurrentlySelected && currentSelectedCount >= config.maxSelectablePoints) {
      return;
    }

    pointSelectionNotifiers[index].value = !isCurrentlySelected;

    hasCheckedAnswerNotifier.value = false;
    isAnswerCorrectNotifier.value = false;
    _pointsToLabelNotifier.value = [];  // Hide labels
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

    final isCorrect = _doPointsMatch(selectedPoints, config.correctPoints);

    hasCheckedAnswerNotifier.value = true;
    isAnswerCorrectNotifier.value = isCorrect;
    
    // Show labels only if correct
    if (isCorrect) {
      _pointsToLabelNotifier.value = config.correctPoints;
    } else {
      _pointsToLabelNotifier.value = [];
    }
  }

  bool _doPointsMatch(List<ComplexPoint> selected, List<ComplexPoint> correct) {
    if (selected.length != correct.length) return false;

    final selectedSet = Set<ComplexPoint>.from(selected);
    final correctSet = Set<ComplexPoint>.from(correct);

    return selectedSet.containsAll(correctSet) && correctSet.containsAll(selectedSet);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
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
                        // Background with labels
                        ValueListenableBuilder<List<ComplexPoint>>(
                          valueListenable: _pointsToLabelNotifier,
                          builder: (context, pointsToLabel, child) {
                            return CustomPaint(
                              painter: ComplexGraphBackgroundPainter(
                                config: config,
                                transformer: _transformer,
                                pointsToLabel: pointsToLabel,
                              ),
                              size: Size(config.graphSize, config.graphSize),
                            );
                          },
                        ),

                        // Interactive Points
                        ...config.allPoints.asMap().entries.map((entry) {
                          final index = entry.key;
                          final point = entry.value;
                          final screenPos = _graphToScreen(point.real, point.imaginary);

                          return ComplexInteractivePoint(
                            position: screenPos,
                            config: config,
                            isSelectedNotifier: pointSelectionNotifiers[index],
                            onTap: () => _onPointTapped(index),
                          );
                        }).toList(),

                        // Checkmark icon when correct
                        ValueListenableBuilder<bool>(
                          valueListenable: hasCheckedAnswerNotifier,
                          builder: (context, hasChecked, child) {
                            if (!hasChecked) return const SizedBox.shrink();

                            return ValueListenableBuilder<bool>(
                              valueListenable: isAnswerCorrectNotifier,
                              builder: (context, isCorrect, child) {
                                if (!isCorrect) return const SizedBox.shrink();

                                return Positioned(
                                  right: 5,
                                  bottom: 5,
                                  child: Icon(
                                    Icons.check_circle_outline,
                                    size: 30,
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
            ],
          ),

          const SizedBox(height: 24),

          // Check button
          ValueListenableBuilder<int>(
            valueListenable: _selectedPointsCountNotifier,
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

          // Result message
          ValueListenableBuilder<bool>(
            valueListenable: hasCheckedAnswerNotifier,
            builder: (context, hasChecked, child) {
              if (!hasChecked) return const SizedBox.shrink();

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