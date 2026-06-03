import 'package:flutter/material.dart';

// ─────────────────────────────────────────────────────────────────────────────
// StepDataCard
// ─────────────────────────────────────────────────────────────────────────────
//
// Displays one step in a composite-function chain:
//
//   col1 (input, accent colour)  |  col2 (output, dark)  |  col3 (diff, traffic-light)
//
// Example for x → g(x):
//   col1Label='x',  col2Label='g(x)',    col3Label='ระยะห่างกับ 1'
//
// Example for g(x) → f(g(x)):
//   col1Label='g(x)', col2Label='f(g(x))', col3Label='ระยะห่างกับ 3'

class StepDataCard extends StatelessWidget {
  // ── Column 1: input ──────────────────────────────────────────────────────
  final String col1Label;
  final double col1Value;
  final Color  col1Color; // accent — matches the approach bar colour

  // ── Column 2: output ─────────────────────────────────────────────────────
  final String col2Label;
  final double col2Value;

  // ── Column 3: difference ─────────────────────────────────────────────────
  final String col3Label;   // e.g. 'ระยะห่างกับ 3'
  final double limitValue;  // L — used to compute |col2Value − L|

  const StepDataCard({
    Key? key,
    required this.col1Label,
    required this.col1Value,
    required this.col1Color,
    required this.col2Label,
    required this.col2Value,
    required this.col3Label,
    required this.limitValue,
  }) : super(key: key);

  // ── diff helpers ──────────────────────────────────────────────────────────

  double get _diff {
    if (col2Value.isNaN || col2Value.isInfinite) return double.nan;
    return (col2Value - limitValue).abs();
  }

  Color _diffColor(double diff) {
    if (diff.isNaN || diff.isInfinite) return const Color(0xFFEF4444);
    if (diff > 1.0) return const Color(0xFFEF4444); // red   – far
    if (diff > 0.1) return const Color(0xFFF59E0B); // amber – getting closer
    return const Color(0xFF22C55E);                  // green – nearly there
  }

  static String _fmt(double v) {
    if (v.isNaN)      return '—';
    if (v.isInfinite) return '∞';
    return v.toStringAsFixed(4);
  }

  // ── build ─────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final diff = _diff;

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
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      child: IntrinsicHeight(
        child: Row(
          children: [
            // Column 1 — input (accent colour)
            _Cell(
              label:      col1Label,
              value:      _fmt(col1Value),
              valueColor: col1Color,
            ),
            const _VDivider(),
            // Column 2 — output (dark)
            _Cell(
              label:      col2Label,
              value:      _fmt(col2Value),
              valueColor: const Color(0xFF1A1A2E),
            ),
            const _VDivider(),
            // Column 3 — difference (animated traffic-light colour)
            _AnimatedCell(
              label:      col3Label,
              value:      _fmt(diff),
              valueColor: _diffColor(diff),
            ),
          ],
        ),
      ),
    );
  }
}

// ── static cell ───────────────────────────────────────────────────────────────

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
  Widget build(BuildContext context) => Expanded(
    child: Column(
      mainAxisAlignment:  MainAxisAlignment.center,
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
        const SizedBox(height: 5),
        Text(
          value,
          style: TextStyle(
            fontSize:   19,
            fontFamily: 'RobotoMono',
            fontWeight: FontWeight.w800,
            color:      valueColor,
          ),
        ),
      ],
    ),
  );
}

// ── animated-colour cell (for diff column) ────────────────────────────────────

class _AnimatedCell extends StatelessWidget {
  final String label;
  final String value;
  final Color  valueColor;

  const _AnimatedCell({
    required this.label,
    required this.value,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) => Expanded(
    child: Column(
      mainAxisAlignment:  MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize:      13,
            fontWeight:    FontWeight.w600,
            color:         Color(0xFF6B7280),
            fontFamily:    'Roboto',
            letterSpacing: 0.2,
          ),
        ),
        const SizedBox(height: 5),
        AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 300),
          style: TextStyle(
            fontSize:   19,
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

// ── thin vertical divider ─────────────────────────────────────────────────────

class _VDivider extends StatelessWidget {
  const _VDivider();

  @override
  Widget build(BuildContext context) => Container(
    width:  1,
    margin: const EdgeInsets.symmetric(horizontal: 4),
    color:  const Color(0xFFE5E7EB),
  );
}