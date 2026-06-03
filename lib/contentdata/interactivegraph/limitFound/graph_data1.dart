import 'package:flutter/material.dart';
import 'graph_ui_base.dart';
import '../limit/graph_painter.dart';
import 'limit_config.dart';

/// Graph 1 – f(x) = (x² + x − 6) / (x − 2)   (hole at x = 2)
///
///   lim x→2 f(x) = 5   but   f(2) is undefined  (hole, not filled)
class _GraphData1 {
  /// Returns (x² + x − 6) / (x − 2).
  /// The expression is undefined at x = 2; callers must guard for that.
  static double function(double x) {
    if ((x - 2.0).abs() < 1e-9) return double.nan; // hole – undefined
    return (x * x + x - 6.0) / (x - 2.0);          // simplifies to x + 3
  }

  static const double xMin = -0.5, xMax = 5.0;
  static const double yMin = -1.0, yMax = 10.0;
  static const double functionXMin = 0.0, functionXMax = 5.0;

  static const double initialXLeft  = 1.5;
  static const double initialXRight = 2.5;

  static const double dragMinLeft   = 0.0;
  static const double dragMaxLeft   = 1.9999;
  static const double dragMinRight  = 2.0001;
  static const double dragMaxRight  = 4.5;

  static const double yScale               = 0.5;
  static const double functionStrokeWidth  = 6.0;
  static const double pointRadius          = 6.5;
  static const double axisStrokeWidth      = 3.0;
  static const double padding              = 20.0;

  static const List<int> xTicks = [1, 2, 3, 4];
  static const List<int> yTicks = [2, 4, 6, 8];

  static const int functionColor   = 0xFFA9BFFD;
  static const int leftPointColor  = 0xFF4F8DFB;
  static const int rightPointColor = 0xFFF8834F;

  // Open circle at (2, 5) – isFilled: false renders a hollow dot.
  static final List<SpecialPoint> _specialPoints = [
    SpecialPoint(x: 2.0, y: 5.0, isFilled: false),
  ];

  // The function has a single removable discontinuity at x = 2.
  static final List<double> _discontinuities = [2.0];

  static const LimitConfig limitConfig = LimitConfig(
    limitX:               2.0,
    limitValue:           5.0,
    functionValueAtLimit: null,   // undefined – hole, so no filled value
    limitXLabel:          '2',
    diffLabel:            'ระยะห่างกับ 5',
    leftPresets:  [1.5, 1.8, 1.9, 1.99, 1.9999],
    rightPresets: [2.0001, 2.01, 2.1, 2.2, 2.5],
  );

  static FunctionDefinition get functionDefinition => FunctionDefinition(
    mainFunction:    function,
    specialPoints:   _specialPoints,
    discontinuities: _discontinuities,
  );
}

Widget getGraphWidget() => GraphUIBase(
  functionDef:         _GraphData1.functionDefinition,
  xMin:                _GraphData1.xMin,
  xMax:                _GraphData1.xMax,
  yMin:                _GraphData1.yMin,
  yMax:                _GraphData1.yMax,
  functionXMin:        _GraphData1.functionXMin,
  functionXMax:        _GraphData1.functionXMax,
  initialXLeft:        _GraphData1.initialXLeft,
  initialXRight:       _GraphData1.initialXRight,
  dragMinLeft:         _GraphData1.dragMinLeft,
  dragMaxLeft:         _GraphData1.dragMaxLeft,
  dragMinRight:        _GraphData1.dragMinRight,
  dragMaxRight:        _GraphData1.dragMaxRight,
  yScale:              _GraphData1.yScale,
  functionStrokeWidth: _GraphData1.functionStrokeWidth,
  pointRadius:         _GraphData1.pointRadius,
  axisStrokeWidth:     _GraphData1.axisStrokeWidth,
  padding:             _GraphData1.padding,
  xTicks:              _GraphData1.xTicks,
  yTicks:              _GraphData1.yTicks,
  functionColor:       const Color(_GraphData1.functionColor),
  leftPointColor:      const Color(_GraphData1.leftPointColor),
  rightPointColor:     const Color(_GraphData1.rightPointColor),
  limitConfig:         _GraphData1.limitConfig,
);

final Widget graph = getGraphWidget();