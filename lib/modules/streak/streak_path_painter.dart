import 'package:flutter/material.dart';

class StreakPathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    const double dashWidth = 8;
    const double dashSpace = 8;

    Path path = Path();
    path.moveTo(180, 650);
    path.cubicTo(260, 600, 100, 520, 200, 460);
    path.cubicTo(260, 400, 100, 330, 180, 280);
    path.cubicTo(260, 230, 140, 180, 220, 140);

    drawDashedPath(canvas, paint, path, dashWidth, dashSpace);
  }

  void drawDashedPath(
      Canvas canvas,
      Paint paint,
      Path path,
      double dashWidth,
      double dashSpace,
      ) {
    final metrics = path.computeMetrics().first;
    double distance = 0.0;

    while (distance < metrics.length) {
      final segment = metrics.extractPath(
        distance,
        distance + dashWidth,
      );
      canvas.drawPath(segment, paint);
      distance += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
