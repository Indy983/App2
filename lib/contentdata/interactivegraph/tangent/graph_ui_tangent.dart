import 'package:flutter/material.dart';
import 'graph_painter_tangent.dart';

class GraphUITangent extends StatefulWidget {
  // Function and bounds
  final TangentFunctionDefinition functionDef;
  final double xMin, xMax, yMin, yMax;
  final double functionXMin, functionXMax;

  // Initial point and drag constraints
  final double initialXTangent;
  final double dragMinTangent, dragMaxTangent;

  // Visual settings
  final double yScale;
  final double functionStrokeWidth;
  final double pointRadius;
  final double axisStrokeWidth;
  final double padding;

  // Tick marks
  final List<dynamic> xTicks;
  final List<dynamic> yTicks;
  final List<String>? xTickLabels;
  final List<String>? yTickLabels;

  // Colors
  final Color functionColor;
  final Color tangentPointColor;

  const GraphUITangent({
    Key? key,
    required this.functionDef,
    required this.xMin,
    required this.xMax,
    required this.yMin,
    required this.yMax,
    required this.functionXMin,
    required this.functionXMax,
    required this.initialXTangent,
    required this.dragMinTangent,
    required this.dragMaxTangent,
    required this.yScale,
    required this.functionStrokeWidth,
    required this.pointRadius,
    required this.axisStrokeWidth,
    required this.padding,
    required this.xTicks,
    required this.yTicks,
    this.xTickLabels,
    this.yTickLabels,
    required this.functionColor,
    required this.tangentPointColor,
  }) : super(key: key);

  @override
  State<GraphUITangent> createState() => _GraphUITangentState();
}

class _GraphUITangentState extends State<GraphUITangent> {
  late double _xTangent;
  bool _showCoordinate = false;
  bool _coordinateVisibilityEnabled = false;

  @override
  void initState() {
    super.initState();
    _xTangent = widget.initialXTangent;
  }

  double _calculateSlope() =>
      widget.functionDef.derivativeFunction(_xTangent);

  String _formatSlope(double slope) {
    if (slope.isInfinite) return 'ไม่มีค่า (เส้นตั้งฉาก)';
    return slope.toStringAsFixed(2);
  }

  double _getOptimalGraphSize(BoxConstraints constraints) {
    final double availableWidth = constraints.maxWidth;
    final double availableHeight = constraints.maxHeight;

    final double limitingDimension = availableHeight.isInfinite
        ? availableWidth
        : (availableWidth < availableHeight ? availableWidth : availableHeight);

    double optimalSize = limitingDimension * 0.9;
    if (optimalSize > 450.0) optimalSize = 450.0;

    return optimalSize;
  }

  // แปลง local dx → graph x จาก canvas width ที่รู้จริง
  double _localDxToGraphX(double localDx, double canvasWidth) {
    const paddingLeft = 20.0;
    final graphWidth = canvasWidth - 40.0;
    final xScale = graphWidth / (widget.xMax - widget.xMin);
    return widget.xMin + ((localDx - paddingLeft) / xScale);
  }

  void _updateXFromDrag(double localDx, double canvasWidth) {
    final newX = _localDxToGraphX(localDx, canvasWidth);
    setState(() {
      _xTangent = newX.clamp(widget.dragMinTangent, widget.dragMaxTangent);
    });
  }

  void _toggleCoordinateVisibility() {
    setState(() {
      _coordinateVisibilityEnabled = !_coordinateVisibilityEnabled;
      if (_coordinateVisibilityEnabled) _showCoordinate = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final graphSize = _getOptimalGraphSize(constraints);

        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // ── Slope display ────────────────────────────────────────
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                margin: const EdgeInsets.only(bottom: 2, top: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F9FA),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: Text(
                  'ความชัน = ${_formatSlope(_calculateSlope())}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2E3A59),
                  ),
                ),
              ),

              // ── Graph area ───────────────────────────────────────────
              Container(
                width: graphSize,
                height: graphSize,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // ทั้ง graph area ลากได้เลย ไม่ต้องกดโดนจุด
                    GestureDetector(
                      onPanStart: (details) {
                        // แสดง coordinate ทันทีที่เริ่มลาก
                        if (!_showCoordinate && _coordinateVisibilityEnabled) {
                          setState(() => _showCoordinate = true);
                        }
                        _updateXFromDrag(details.localPosition.dx, graphSize);
                      },
                      onPanUpdate: (details) {
                        _updateXFromDrag(details.localPosition.dx, graphSize);
                      },
                      onPanEnd: (_) {
                        // ไม่ต้องทำอะไรเพิ่มเมื่อปล่อยนิ้ว
                      },
                      child: SizedBox(
                        width: graphSize,
                        height: graphSize,
                        child: CustomPaint(
                          painter: GraphPainterTangent(
                            functionDef: widget.functionDef,
                            xMin: widget.xMin,
                            xMax: widget.xMax,
                            yMin: widget.yMin,
                            yMax: widget.yMax,
                            functionXMin: widget.functionXMin,
                            functionXMax: widget.functionXMax,
                            xTangent: _xTangent,
                            yScale: widget.yScale,
                            functionStrokeWidth: widget.functionStrokeWidth,
                            pointRadius: widget.pointRadius,
                            axisStrokeWidth: widget.axisStrokeWidth,
                            padding: widget.padding,
                            xTicks: widget.xTicks,
                            yTicks: widget.yTicks,
                            xTickLabels: widget.xTickLabels,
                            yTickLabels: widget.yTickLabels,
                            functionColor: widget.functionColor,
                            tangentPointColor: widget.tangentPointColor,
                            showCoordinate:
                                _showCoordinate && _coordinateVisibilityEnabled,
                          ),
                          size: Size(graphSize, graphSize),
                        ),
                      ),
                    ),

                    // ── Eye toggle button ──────────────────────────────
                    Positioned(
                      bottom: -10,
                      right: 0,
                      child: GestureDetector(
                        onTap: _toggleCoordinateVisibility,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Icon(
                            _coordinateVisibilityEnabled
                                ? Icons.visibility
                                : Icons.visibility_off,
                            size: 20,
                            color: _coordinateVisibilityEnabled
                                ? const Color.fromARGB(130, 0, 0, 0)
                                : Colors.grey.shade500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}