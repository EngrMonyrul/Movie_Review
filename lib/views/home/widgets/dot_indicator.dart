import 'package:flutter/material.dart';
import 'package:movie_review/utils/theme/color_scheme_config.dart';

class DotIndicator extends CustomPainter {
  const DotIndicator({this.position});

  final double? position;

  @override
  void paint(Canvas canvas, Size size) {
    Paint dotPaint = Paint()..color = Colors.red;

    double dotRadius = 8.0;
    double expandingDotRadius = dotRadius + 6.0;
    double dotPosition =
        position?.clamp(0.0, size.width - expandingDotRadius * 2) ?? 0;

    canvas.drawCircle(
      Offset(dotPosition + expandingDotRadius, size.height / 2),
      expandingDotRadius,
      dotPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
