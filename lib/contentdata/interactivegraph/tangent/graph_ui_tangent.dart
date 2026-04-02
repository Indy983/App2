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
  bool _isDragging = false;
  bool _showCoordinate = false;
  bool _coordinateVisibilityEnabled = false;
  bool _userHasManuallyDisabled = false;
  
  Offset? _dragStartPosition;
  double _initialXTangent = 0;

  @override
  void initState() {
    super.initState();
    _xTangent = widget.initialXTangent;
  }

  // Calculate slope at the tangent point
  double _calculateSlope() {
    return widget.functionDef.derivativeFunction(_xTangent);
  }

  // Format slope for display
  String _formatSlope(double slope) {
    if (slope.isInfinite) {
      return "ไม่มีค่า (เส้นตั้งฉาก)";
    }
    return slope.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final graphSize = screenWidth - 80;
    
    final slopeDisplayHeight = 36.0;
    final totalHeight = graphSize + slopeDisplayHeight + 20;
    
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      width: graphSize,
      height: totalHeight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Slope display at the top
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            margin: EdgeInsets.only(bottom: 2, top: 2),
            decoration: BoxDecoration(
              color: Color(0xFFF8F9FA),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Color(0xFFE2E8F0)),
            ),
            child: Text(
              'ความชัน = ${_formatSlope(_calculateSlope())}',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2E3A59),
              ),
            ),
          ),
          
          // Graph
          Expanded(
            child: Stack(
              children: [
                GestureDetector(
                  onPanStart: _handlePanStart,
                  onPanUpdate: _handlePanUpdate,
                  onPanEnd: _handlePanEnd,
                  child: Container(
                    width: graphSize,
                    height: graphSize,
                    margin: const EdgeInsets.symmetric(vertical: 2),
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
                        showCoordinate: _showCoordinate && _coordinateVisibilityEnabled,
                      ),
                      size: Size(graphSize, graphSize),
                    ),
                  ),
                ),
                // Eye toggle button
                Positioned(
                  bottom: -10,
                  right: 0,
                  child: GestureDetector(
                    onTap: _toggleCoordinateVisibility,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(
                        _coordinateVisibilityEnabled ? Icons.visibility : Icons.visibility_off,
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
  }

  double _getYValueForPoint(double x) {
    for (final specialPoint in widget.functionDef.specialPoints) {
      if ((specialPoint.x - x).abs() < 0.001 && specialPoint.isFilled) {
        return specialPoint.y;
      }
    }
    
    try {
      final y = widget.functionDef.mainFunction(x);
      if (!y.isNaN && !y.isInfinite) {
        return y;
      }
    } catch (e) {
      // If function fails, return 0
    }
    
    return 0.0;
  }

  void _handlePanStart(DragStartDetails details) {
    final box = context.findRenderObject() as RenderBox;
    final localPosition = box.globalToLocal(details.globalPosition);
    final graphArea = box.size;
    
    _dragStartPosition = localPosition;
    _initialXTangent = _xTangent;
    
    final paddingLeft = 20.0;
    final paddingBottom = 20.0;
    final graphWidth = graphArea.width - 40.0;
    
    final xScale = graphWidth / (widget.xMax - widget.xMin);
    final yScaleActual = xScale * widget.yScale;
    
    final canvasX = localPosition.dx - paddingLeft;
    final canvasY = (graphArea.height - localPosition.dy - paddingBottom);
    
    final adjustedCanvasY = canvasY + 30; // Adjust for slope display
    
    if (_showCoordinate) {
      final tangentY = _getYValueForPoint(_xTangent);
      
      final tangentCanvasX = (_xTangent - widget.xMin) * xScale;
      final tangentCanvasY = (tangentY - widget.yMin) * yScaleActual;
      
      if (_isClickingOnCoordinateBox(canvasX, adjustedCanvasY, tangentCanvasX, tangentCanvasY)) {
        _isDragging = true;
        return;
      }
    }
    
    final graphX = widget.xMin + (canvasX / xScale);
    final distanceToPoint = (graphX - _xTangent).abs();

    // Only start dragging if clicking near the point
    if (distanceToPoint < 0.3) {
      setState(() {
        _isDragging = true;
        _showCoordinate = true;
        if (!_userHasManuallyDisabled) {
          _coordinateVisibilityEnabled = true;
        }
      });
    }
  }

  void _toggleCoordinateVisibility() {
    setState(() {
      _coordinateVisibilityEnabled = !_coordinateVisibilityEnabled;
      
      if (!_coordinateVisibilityEnabled) {
        _userHasManuallyDisabled = true;
        _showCoordinate = false;
      } else {
        _userHasManuallyDisabled = false;
        _showCoordinate = true;
      }
    });
  }

  bool _isClickingOnCoordinateBox(double clickX, double clickY, double pointX, double pointY) {
    final boxWidth = 80.0;
    final boxHeight = 24.0;
    final offset = 15.0;
    
    final boxLeft = pointX - boxWidth / 2;
    final boxRight = boxLeft + boxWidth;
    final boxBottom = pointY + offset;
    final boxTop = boxBottom + boxHeight;
    
    return clickX >= boxLeft && clickX <= boxRight && 
           clickY >= boxBottom && clickY <= boxTop;
  }

  void _handlePanUpdate(DragUpdateDetails details) {
    if (!_isDragging) return;
    
    final box = context.findRenderObject() as RenderBox;
    final localPosition = box.globalToLocal(details.globalPosition);
    final graphArea = box.size;
    
    final paddingLeft = 20.0;
    final graphWidth = graphArea.width - 40.0;
    final xScale = graphWidth / (widget.xMax - widget.xMin);
    
    final canvasX = localPosition.dx - paddingLeft;
    final newX = widget.xMin + (canvasX / xScale);

    setState(() {
      _xTangent = newX.clamp(widget.dragMinTangent, widget.dragMaxTangent);
    });
  }

  void _handlePanEnd(DragEndDetails details) {
    if (_isDragging && _dragStartPosition != null) {
      final box = context.findRenderObject() as RenderBox;
      final localPosition = box.globalToLocal(details.globalPosition);
      
      final distance = (localPosition - _dragStartPosition!).distance;
      final valueChanged = (_xTangent - _initialXTangent).abs() > 0.01;
      
      final isTap = distance < 10.0 && !valueChanged;
      
      if (isTap && _showCoordinate) {
        final paddingLeft = 20.0;
        final paddingBottom = 20.0;
        final graphWidth = box.size.width - 40.0;
        
        final xScale = graphWidth / (widget.xMax - widget.xMin);
        final yScaleActual = xScale * widget.yScale;
        
        final canvasX = localPosition.dx - paddingLeft;
        final canvasY = (box.size.height - localPosition.dy - paddingBottom);
        
        final adjustedCanvasY = canvasY + 30;
        
        final tangentY = _getYValueForPoint(_xTangent);
        
        final tangentCanvasX = (_xTangent - widget.xMin) * xScale;
        final tangentCanvasY = (tangentY - widget.yMin) * yScaleActual;
        
        if (_isClickingOnCoordinateBox(canvasX, adjustedCanvasY, tangentCanvasX, tangentCanvasY)) {
          setState(() {
            _showCoordinate = false;
          });
        }
      }
    }
    
    _isDragging = false;
    _dragStartPosition = null;
  }
}