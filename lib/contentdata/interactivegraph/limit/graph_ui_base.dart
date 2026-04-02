import 'package:flutter/material.dart';
import 'graph_painter.dart';

class GraphUIBase extends StatefulWidget {
  // Function and bounds - now using FunctionDefinition
  final FunctionDefinition functionDef;
  final double xMin, xMax, yMin, yMax; // Graph bounds (axes bounds)
  final double functionXMin, functionXMax; // Function drawing bounds
  
  // Initial points and drag constraints
  final double initialXLeft, initialXRight;
  final double dragMinLeft, dragMaxLeft;
  final double dragMinRight, dragMaxRight;
  
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
  final Color leftPointColor;
  final Color rightPointColor;

  const GraphUIBase({
    Key? key,
    required this.functionDef,
    required this.xMin,
    required this.xMax,
    required this.yMin,
    required this.yMax,
    required this.functionXMin,
    required this.functionXMax,
    required this.initialXLeft,
    required this.initialXRight,
    required this.dragMinLeft,
    required this.dragMaxLeft,
    required this.dragMinRight,
    required this.dragMaxRight,
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
    required this.leftPointColor,
    required this.rightPointColor,
  }) : super(key: key);

  @override
  State<GraphUIBase> createState() => _GraphUIBaseState();
}

class _GraphUIBaseState extends State<GraphUIBase> {
  late double _xLeft;
  late double _xRight;
  bool? _draggingLeft;
  bool _showLeftCoordinate = false;
  bool _showRightCoordinate = false;
  bool _coordinateVisibilityEnabled = false; // Start with eye closed
  bool _userHasManuallyDisabled = false; // Track if user manually disabled
  
  Offset? _dragStartPosition;
  double _initialXLeft = 0;
  double _initialXRight = 0;

  @override
  void initState() {
    super.initState();
    _xLeft = widget.initialXLeft;
    _xRight = widget.initialXRight;
  }

  // ✅ เพิ่มฟังก์ชันคำนวณขนาดกราฟที่เหมาะสมสำหรับทุกอุปกรณ์
  double _getOptimalGraphSize(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    
    // ตรวจสอบว่าเป็น tablet หรือไม่ (shortestSide > 600)
    final isTablet = shortestSide > 600;
    
    if (isTablet) {
      // สำหรับ tablet: จำกัดขนาดกราฟให้เหมาะสมกับการใช้งาน
      // ใช้ขนาดคงที่ที่เหมาะสมแทนการใช้สัดส่วนหน้าจอ
      return 320.0; // ขนาดคงที่สำหรับ tablet เหมือนมือถือ
    } else {
      // สำหรับมือถือ: ใช้สัดส่วนหน้าจอแต่ลบ padding
      return screenWidth - 140; // 70 padding * 2
    }
  }

  @override
  Widget build(BuildContext context) {
    final graphSize = _getOptimalGraphSize(context);
    
    return Container(
      // ✅ ทำให้กราฟอยู่ตรงกลางเสมอ
      child: Center(
        child: Container(
          width: graphSize,
          child: Stack(
            children: [
              GestureDetector(
                onPanStart: _handlePanStart,
                onPanUpdate: _handlePanUpdate,
                onPanEnd: _handlePanEnd,
                child: Container(
                  width: graphSize,
                  height: graphSize,
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: CustomPaint(
                    painter: GraphPainter(
                      functionDef: widget.functionDef,
                      xMin: widget.xMin,
                      xMax: widget.xMax,
                      yMin: widget.yMin,
                      yMax: widget.yMax,
                      functionXMin: widget.functionXMin,
                      functionXMax: widget.functionXMax,
                      xLeft: _xLeft,
                      xRight: _xRight,
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
                      leftPointColor: widget.leftPointColor,
                      rightPointColor: widget.rightPointColor,
                      showLeftCoordinate: _showLeftCoordinate && _coordinateVisibilityEnabled,
                      showRightCoordinate: _showRightCoordinate && _coordinateVisibilityEnabled,
                    ),
                    size: Size(graphSize, graphSize),
                  ),
                ),
              ),
              // Eye toggle button - flat on screen without background circle
              Positioned(
                bottom: -10, // Moved down to align with green line area
                right: 0,
                child: GestureDetector(
                  onTap: _toggleCoordinateVisibility,
                  child: Padding(
                    padding: EdgeInsets.all(8), // Increase touch area
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
      ),
    );
  }

  double _getYValueForInteractivePoint(double x) {
    // Check if this x value has a special point (filled point takes precedence)
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
      // If function fails, return 0 or some default
    }
    
    return 0.0;
  }

  void _handlePanStart(DragStartDetails details) {
    final box = context.findRenderObject() as RenderBox;
    final localPosition = box.globalToLocal(details.globalPosition);
    final graphArea = box.size;
    
    _dragStartPosition = localPosition;
    _initialXLeft = _xLeft;
    _initialXRight = _xRight;
    
    final paddingLeft = 20.0;
    final paddingBottom = 20.0;
    final graphWidth = graphArea.width - 40.0;
    
    final xScale = graphWidth / (widget.xMax - widget.xMin);
    final yScaleActual = xScale * widget.yScale;
    
    final canvasX = localPosition.dx - paddingLeft;
    final canvasY = (graphArea.height - localPosition.dy - paddingBottom);
    
    if (_showLeftCoordinate || _showRightCoordinate) {
      final leftY = _getYValueForInteractivePoint(_xLeft);
      final rightY = _getYValueForInteractivePoint(_xRight);
      
      final leftCanvasX = (_xLeft - widget.xMin) * xScale;
      final leftCanvasY = (leftY - widget.yMin) * yScaleActual;
      
      final rightCanvasX = (_xRight - widget.xMin) * xScale;
      final rightCanvasY = (rightY - widget.yMin) * yScaleActual;
      
      if (_showLeftCoordinate && _isClickingOnCoordinateBox(canvasX, canvasY, leftCanvasX, leftCanvasY, true)) {
        _draggingLeft = true;
        return;
      }
      
      if (_showRightCoordinate && _isClickingOnCoordinateBox(canvasX, canvasY, rightCanvasX, rightCanvasY, false)) {
        _draggingLeft = false;
        return;
      }
    }
    
    final graphX = widget.xMin + (canvasX / xScale);
    final distanceToLeft = (graphX - _xLeft).abs();
    final distanceToRight = (graphX - _xRight).abs();

    setState(() {
      if (distanceToLeft < distanceToRight) {
        _draggingLeft = true;
        _showLeftCoordinate = true;
        // Auto-enable coordinate visibility when starting to drag (unless manually disabled)
        if (!_userHasManuallyDisabled) {
          _coordinateVisibilityEnabled = true;
        }
      } else {
        _draggingLeft = false;
        _showRightCoordinate = true;
        // Auto-enable coordinate visibility when starting to drag (unless manually disabled)
        if (!_userHasManuallyDisabled) {
          _coordinateVisibilityEnabled = true;
        }
      }
    });
  }

  void _toggleCoordinateVisibility() {
    setState(() {
      _coordinateVisibilityEnabled = !_coordinateVisibilityEnabled;
      
      if (!_coordinateVisibilityEnabled) {
        // User manually disabled - remember this state
        _userHasManuallyDisabled = true;
        _showLeftCoordinate = false;
        _showRightCoordinate = false;
      } else {
        // User manually enabled - reset the manual disable flag and show current coordinates
        _userHasManuallyDisabled = false;
        // Show coordinate boxes immediately for both points
        _showLeftCoordinate = true;
        _showRightCoordinate = true;
      }
    });
  }

  bool _isClickingOnCoordinateBox(double clickX, double clickY, double pointX, double pointY, bool isLeft) {
    final boxWidth = 80.0;
    final boxHeight = 24.0;
    final offset = 15.0;
    
    double boxLeft, boxTop, boxRight, boxBottom;
    
    if (isLeft) {
      boxLeft = pointX + offset;
      boxRight = boxLeft + boxWidth;
      boxTop = pointY - offset;
      boxBottom = boxTop - boxHeight;
    } else {
      boxRight = pointX - offset;
      boxLeft = boxRight - boxWidth;
      boxBottom = pointY + offset;
      boxTop = boxBottom + boxHeight;
    }
    
    return clickX >= boxLeft && clickX <= boxRight && 
           clickY >= boxBottom && clickY <= boxTop;
  }

  void _handlePanUpdate(DragUpdateDetails details) {
    final box = context.findRenderObject() as RenderBox;
    final localPosition = box.globalToLocal(details.globalPosition);
    final graphArea = box.size;
    
    final paddingLeft = 20.0;
    final graphWidth = graphArea.width - 40.0;
    final xScale = graphWidth / (widget.xMax - widget.xMin);
    
    final canvasX = localPosition.dx - paddingLeft;
    final newX = widget.xMin + (canvasX / xScale);

    setState(() {
      if (_draggingLeft == true) {
        _xLeft = newX.clamp(widget.dragMinLeft, widget.dragMaxLeft);
      } else if (_draggingLeft == false) {
        _xRight = newX.clamp(widget.dragMinRight, widget.dragMaxRight);
      }
    });
  }

  void _handlePanEnd(DragEndDetails details) {
    if (_draggingLeft != null && _dragStartPosition != null) {
      final box = context.findRenderObject() as RenderBox;
      final localPosition = box.globalToLocal(details.globalPosition);
      
      final distance = (localPosition - _dragStartPosition!).distance;
      final leftValueChanged = (_xLeft - _initialXLeft).abs() > 0.01;
      final rightValueChanged = (_xRight - _initialXRight).abs() > 0.01;
      
      final isTap = distance < 10.0 && !leftValueChanged && !rightValueChanged;
      
      if (isTap) {
        final paddingLeft = 20.0;
        final paddingBottom = 20.0;
        final graphWidth = box.size.width - 40.0;
        
        final xScale = graphWidth / (widget.xMax - widget.xMin);
        final yScaleActual = xScale * widget.yScale;
        
        final canvasX = localPosition.dx - paddingLeft;
        final canvasY = (box.size.height - localPosition.dy - paddingBottom);
        
        final leftY = _getYValueForInteractivePoint(_xLeft);
        final rightY = _getYValueForInteractivePoint(_xRight);
        
        final leftCanvasX = (_xLeft - widget.xMin) * xScale;
        final leftCanvasY = (leftY - widget.yMin) * yScaleActual;
        
        final rightCanvasX = (_xRight - widget.xMin) * xScale;
        final rightCanvasY = (rightY - widget.yMin) * yScaleActual;
        
        if (_draggingLeft == true && _showLeftCoordinate && 
            _isClickingOnCoordinateBox(canvasX, canvasY, leftCanvasX, leftCanvasY, true)) {
          setState(() {
            _showLeftCoordinate = false;
          });
        } else if (_draggingLeft == false && _showRightCoordinate && 
                   _isClickingOnCoordinateBox(canvasX, canvasY, rightCanvasX, rightCanvasY, false)) {
          setState(() {
            _showRightCoordinate = false;
          });
        }
      }
    }
    
    _draggingLeft = null;
    _dragStartPosition = null;
  }
}