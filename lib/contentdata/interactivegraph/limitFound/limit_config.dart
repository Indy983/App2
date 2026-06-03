/// Configuration for the limit exploration UI.
class LimitConfig {
  final double limitX;
  final double limitValue;                // L  – the actual limit value
  final double? functionValueAtLimit;     // f(limitX) – null means undefined (hole)
  final List<double> leftPresets;         // must be < limitX
  final List<double> rightPresets;        // must be > limitX
  final String limitXLabel;              // display string, e.g. "2"

  /// Label shown in the data card's third column instead of "|f(x) − L|".
  /// Example: "ระยะห่างกับ 5"
  final String diffLabel;

  const LimitConfig({
    required this.limitX,
    required this.limitValue,
    this.functionValueAtLimit,            // omit (or pass null) for a hole
    required this.leftPresets,
    required this.rightPresets,
    this.limitXLabel = '2',
    this.diffLabel = '|f(x) − L|',
  });

  /// true only when f(limitX) is defined AND equals the limit.
  bool get hasValueAtLimit => functionValueAtLimit != null;
  bool get isContinuousAtLimit =>
      hasValueAtLimit && (functionValueAtLimit! - limitValue).abs() < 1e-9;

  /// true when f(limitX) is undefined – i.e. there is a hole at limitX.
  bool get hasHoleAtLimit => !hasValueAtLimit;
}