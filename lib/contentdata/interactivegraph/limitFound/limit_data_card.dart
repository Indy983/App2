import 'package:flutter/material.dart';
import 'limit_config.dart';

// ─────────────────────────────────────────────────────────────────────────────
// LimitDataCard
// ─────────────────────────────────────────────────────────────────────────────
//
// Displays x | f(x) | |f(x) − L| for a single point.
// The difference cell is colour-coded red → amber → green as it shrinks.
// When the function has a hole at limitX, f(x) shows "—" (undefined).

class LimitDataCard extends StatelessWidget {
  final double x;
  final LimitConfig config;
  final double Function(double) function;
  final bool isLeft;
  final Color color; // accent colour (matches the approach bar)

  const LimitDataCard({
    Key? key,
    required this.x,
    required this.config,
    required this.function,
    required this.isLeft,
    required this.color,
  }) : super(key: key);

  // ── evaluate f(x) ─────────────────────────────────────────────────────────

  double _fx() {
    // At the limit point itself:
    if ((x - config.limitX).abs() < 1e-9) {
      // If there is a hole (undefined), return NaN so the cell shows "—".
      // If continuous, return the defined function value.
      return config.functionValueAtLimit ?? double.nan;
    }
    try {
      final y = function(x);
      return (y.isNaN || y.isInfinite) ? double.nan : y;
    } catch (_) {
      return double.nan;
    }
  }

  // ── colour for difference ─────────────────────────────────────────────────

  Color _diffColor(double diff) {
    if (diff.isNaN || diff.isInfinite) return const Color(0xFFEF4444);
    if (diff > 1.0)  return const Color(0xFFEF4444); // red   – far
    if (diff > 0.1)  return const Color(0xFFF59E0B); // amber – getting closer
    return const Color(0xFF22C55E);                   // green – nearly there
  }

  // ── formatting ────────────────────────────────────────────────────────────

  static String _fmt(double v) {
    if (v.isNaN)      return '—';
    if (v.isInfinite) return '∞';
    return v.toStringAsFixed(4);
  }

  // ── build ─────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final fx   = _fx();
    // Diff is undefined (NaN) when f(x) is undefined (hole at limitX).
    final diff = fx.isNaN ? double.nan : (fx - config.limitValue).abs();

    return Container(
      decoration: BoxDecoration(
        color:        Colors.white,
        borderRadius: BorderRadius.circular(16),
        border:       Border.all(color: const Color(0xFFE5E7EB)),
        boxShadow: [
          BoxShadow(
            color:      Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset:     const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
      child: IntrinsicHeight(
        child: Row(
          children: [
            // x
            _Cell(
              label: 'x',
              value: _fmt(x),
              valueColor: color,
            ),
            const _VDivider(),
            // f(x)  – shows "—" when undefined (hole)
            _Cell(
              label: 'f(x)',
              value: _fmt(fx),
              valueColor: fx.isNaN
                  ? const Color(0xFFEF4444)   // red dash for undefined
                  : const Color(0xFF1A1A2E),
            ),
            const _VDivider(),
            // |f(x) − L|
            _Cell(
              label: config.diffLabel,
              value: _fmt(diff),
              valueColor: _diffColor(diff),
            ),
          ],
        ),
      ),
    );
  }
}

// ── single value column ───────────────────────────────────────────────────────

class _Cell extends StatelessWidget {
  final String label;
  final String value;
  final Color  valueColor;

  const _Cell({
    required this.label,
    required this.value,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize:      13,
              fontWeight:    FontWeight.w600,
              color:         Color(0xFF6B7280),
              fontFamily:    'Roboto',
              letterSpacing: 0.2,
            ),
          ),
          const SizedBox(height: 6),
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 280),
            style: TextStyle(
              fontSize:   20,
              fontFamily: 'RobotoMono',
              fontWeight: FontWeight.w800,
              color:      valueColor,
            ),
            child: Text(value),
          ),
        ],
      ),
    );
  }
}

// ── thin vertical divider ─────────────────────────────────────────────────────

class _VDivider extends StatelessWidget {
  const _VDivider();

  @override
  Widget build(BuildContext context) => Container(
    width: 1,
    margin: const EdgeInsets.symmetric(horizontal: 4),
    color: const Color(0xFFE5E7EB),
  );
}