import 'package:flutter/material.dart';
import 'graph_ui_base.dart';
import 'dart:math';

/// ✅ Graph Data for Heart Curve: (x² + y² - 1)³ = x²y³
class GraphDataHeartCurve {
  // Heart curve parametric functions
  // Remove old parametric functions that don't match the equation
  // The equation (x² + y² - 1)³ = x²y³ has only 4 discrete points:
  // (0,1), (0,-1), (1,0), (-1,0)
  
  // Dummy function for interface compatibility
  static double _function(double x) => 0.0;
  
  // ✅ Configuration with CORRECTED POINTS
  static const GraphConfig config = GraphConfig(
    // Graph bounds
    xMin: -1.5,
    xMax: 1.5,
    yMin: -1.0,
    yMax: 1.5,
    functionXMin: -1.5,
    functionXMax: 1.5,
    
    // Visual settings
    pointRadius: 4.5,
    axisStrokeWidth: 3.0,
    functionStrokeWidth: 3.0,
    padding: 30.0,
    graphSize: 280.0,
    
    // Tick marks
    xTicks: [-1, 1],
    yTicks: [-1, 1],
    
    // Colors
    backgroundColor: Colors.white,
    axisColor: Colors.black,
    pointColor: Colors.black,
    selectedPointColor: Colors.red,
    functionLineColor: Color(0xFFE91E63),
    correctIconColor: Colors.green,
    incorrectIconColor: Colors.grey,
    
    // Function
    function: _function,
    functionExpression: '(x² + y² - 1)³ = x²y³',
    
    // ✅ CORRECTED: Game data with points on equation (x² + y² - 1)³ = x²y³
    allPoints: [
      // Correct points on the curve (x² + y² - 1)³ = x²y³
      GamePoint(x: 0.0, y: 1.0, isCorrect: true),      // Top: (0,1)
      GamePoint(x: 0.0, y: -1.0, isCorrect: true),     // Bottom: (0,-1)
      GamePoint(x: 1.0, y: 0.0, isCorrect: true),      // Right: (1,0)
      GamePoint(x: -1.0, y: 0.0, isCorrect: true),     // Left: (-1,0)
      
      // Distractor points (not on the curve)
      GamePoint(x: 0.5, y: 0.5, isCorrect: false),     // Inside
      GamePoint(x: -0.5, y: 0.5, isCorrect: false),    // Inside
      GamePoint(x: 0.5, y: -0.5, isCorrect: false),    // Inside
      GamePoint(x: -0.5, y: -0.5, isCorrect: false),   // Inside
      GamePoint(x: 0.7, y: 0.7, isCorrect: false),     // Outside
      GamePoint(x: -0.7, y: 0.7, isCorrect: false),    // Outside
      GamePoint(x: 0.0, y: 0.5, isCorrect: false),     // On y-axis but wrong
      GamePoint(x: 0.5, y: 0.0, isCorrect: false),     // On x-axis but wrong
    ],
    
    // ✅ CORRECTED: Extract only correct points
    correctPoints: [
      GamePoint(x: 0.0, y: 1.0, isCorrect: true),      // Top: (0,1)
      GamePoint(x: 0.0, y: -1.0, isCorrect: true),     // Bottom: (0,-1)
      GamePoint(x: 1.0, y: 0.0, isCorrect: true),      // Right: (1,0)
      GamePoint(x: -1.0, y: 0.0, isCorrect: true),     // Left: (-1,0)
    ],
    
    // Maximum selectable points
    maxSelectablePoints: 4,
    
    // Feedback messages
    correctFeedback: 'ยอดเยี่ยม! คุณเลือกจุดที่อยู่บนกราฟถูกต้องทั้งหมด 4 จุด',
    incorrectFeedback: 'ลองใหม่อีกครั้ง! เลือกจุดที่อยู่บนเส้นกราฟให้ครบ 4 จุด',
  );
}

/// ✅ Custom Heart Curve Background Painter
class HeartCurveBackgroundPainter extends GraphBackgroundPainter {
  HeartCurveBackgroundPainter({
    required GraphConfig config,
    required bool showFunctionLine,
    required CoordinateTransformer transformer,
  }) : super(
    config: config,
    showFunctionLine: showFunctionLine,
    transformer: transformer,
  );

  @override
  void paint(Canvas canvas, Size size) {
    // Draw standard background first
    super.paint(canvas, size);
    
    // Draw heart curve if needed
    if (showFunctionLine) {
      _drawHeartCurve(canvas, size);
    }
  }
  
  void _drawHeartCurve(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = config.functionLineColor
      ..strokeWidth = config.functionStrokeWidth
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true;

    canvas.save();
    canvas.translate(config.padding, size.height - config.padding);
    canvas.scale(1, -1);

    final path = Path();
    bool isFirst = true;
    
    // วาดกราฟของสมการ (x² + y² - 1)³ = x²y³
    // ใช้การสแกนแบบละเอียดเพื่อหาจุดบนเส้นโค้ง
    for (double x = config.xMin; x <= config.xMax; x += 0.01) {
      for (double y = config.yMin; y <= config.yMax; y += 0.01) {
        final leftSide = pow(x*x + y*y - 1, 3);
        final rightSide = x*x * pow(y, 3);
        
        // ตรวจสอบว่าจุดนี้อยู่บนเส้นโค้งหรือไม่
        if ((leftSide - rightSide).abs() < 0.001) {
          final point = transformer.toPainterCanvas(x, y);
          
          if (isFirst) {
            path.moveTo(point.dx, point.dy);
            isFirst = false;
          } else {
            path.lineTo(point.dx, point.dy);
          }
        }
      }
    }
    
    // วาดจุดสำคัญที่รู้แน่นอน
    final importantPoints = [
      [0.0, 1.0],   // (0,1)
      [0.0, -1.0],  // (0,-1)
      [1.0, 0.0],   // (1,0)
      [-1.0, 0.0],  // (-1,0)
    ];
    
    final pointPaint = Paint()
      ..color = config.functionLineColor
      ..style = PaintingStyle.fill;
    
    for (final point in importantPoints) {
      final screenPoint = transformer.toPainterCanvas(point[0], point[1]);
      canvas.drawCircle(Offset(screenPoint.dx, screenPoint.dy), 2, pointPaint);
    }
    
    canvas.drawPath(path, paint);
    canvas.restore();
  }
  
  static double _heartX(double t) {
    return 0.8 * pow(sin(t), 3);
  }
  
  static double _heartY(double t) {
    return 0.8 * (13 * cos(t) - 5 * cos(2 * t) - 2 * cos(3 * t) - cos(4 * t)) / 16;
  }
}

/// ✅ Heart Curve Graph Widget
class OptimizedInteractiveGraphHeart extends OptimizedInteractiveGraph {
  const OptimizedInteractiveGraphHeart({
    Key? key,
  }) : super(
    key: key,
    config: GraphDataHeartCurve.config,
  );

  @override
  State<OptimizedInteractiveGraphHeart> createState() => _OptimizedInteractiveGraphHeartState();
}

class _OptimizedInteractiveGraphHeartState extends State<OptimizedInteractiveGraphHeart> {
  GraphConfig get config => widget.config;

  late List<ValueNotifier<bool>> pointSelectionNotifiers;
  late ValueNotifier<bool> showFunctionLineNotifier;
  late ValueNotifier<bool> hasCheckedAnswerNotifier;
  late ValueNotifier<bool> isAnswerCorrectNotifier;
  late ValueNotifier<int> _selectedPointsCountNotifier;
  late CoordinateTransformer _transformer;

  @override
  void initState() {
    super.initState();

    _transformer = CoordinateTransformer(config: config, canvasSize: Size(config.graphSize, config.graphSize));

    pointSelectionNotifiers = List.generate(
      config.allPoints.length,
      (index) {
        final notifier = ValueNotifier<bool>(false);
        notifier.addListener(_updateSelectedPointsCount);
        return notifier;
      },
    );

    showFunctionLineNotifier = ValueNotifier<bool>(false);
    hasCheckedAnswerNotifier = ValueNotifier<bool>(false);
    isAnswerCorrectNotifier = ValueNotifier<bool>(false);
    _selectedPointsCountNotifier = ValueNotifier<int>(0);
  }

  @override
  void dispose() {
    for (final notifier in pointSelectionNotifiers) {
      notifier.removeListener(_updateSelectedPointsCount);
      notifier.dispose();
    }
    showFunctionLineNotifier.dispose();
    hasCheckedAnswerNotifier.dispose();
    isAnswerCorrectNotifier.dispose();
    _selectedPointsCountNotifier.dispose();
    super.dispose();
  }

  void _updateSelectedPointsCount() {
    _selectedPointsCountNotifier.value = pointSelectionNotifiers.where((n) => n.value).length;
  }

  Offset _graphToScreen(double x, double y) {
    return _transformer.graphToCanvas(x, y);
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
    showFunctionLineNotifier.value = false;
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
    showFunctionLineNotifier.value = isCorrect;
  }

  bool _doPointsMatch(List<GamePoint> selected, List<GamePoint> correct) {
    if (selected.length != correct.length) return false;

    final selectedSet = Set<GamePoint>.from(selected);
    final correctSet = Set<GamePoint>.from(correct);

    return selectedSet.containsAll(correctSet) && correctSet.containsAll(selectedSet);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
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
                        ValueListenableBuilder<bool>(
                          valueListenable: showFunctionLineNotifier,
                          builder: (context, showLine, child) {
                            return CustomPaint(
                              painter: HeartCurveBackgroundPainter(
                                config: config,
                                showFunctionLine: showLine,
                                transformer: _transformer,
                              ),
                              size: Size(config.graphSize, config.graphSize),
                            );
                          },
                        ),

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

/// ✅ Export widget
Widget getGraphWidget2() {
  return const OptimizedInteractiveGraphHeart();
}

/// Alternative: Export as a constant variable for reuse
final Widget graphHeartCurve = getGraphWidget2();