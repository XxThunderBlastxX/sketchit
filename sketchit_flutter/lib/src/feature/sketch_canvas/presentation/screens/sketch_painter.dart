import 'package:flutter/material.dart';

class SketchPainter extends CustomPainter {
  final List<Offset> points;
  final Color color;
  final double strokeWidth;

  SketchPainter(
    this.points,
    this.color,
    this.strokeWidth,
  );

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    if (points.length == 1) {
      canvas.drawLine(points[0], points[0], paint);
      return;
    }

    for (int i = 0; i < points.length - 1; i++) {
      // var path = Path();
      //
      // for (int i = 1; i < points.length - 1; ++i) {
      //   final p0 = points[i];
      //   final p1 = points[i + 1];
      //   path.quadraticBezierTo(
      //     p0.dx,
      //     p0.dy,
      //     (p0.dx + p1.dx) / 2,
      //     (p0.dy + p1.dy) / 2,
      //   );
      // }
      // path.fillType = PathFillType.evenOdd;
      // path.moveTo(points[i].dx, points[i].dy);
      //
      // canvas.drawPath(path, paint);

      canvas.drawLine(points[i], points[i + 1], paint);
    }
  }

  @override
  bool shouldRepaint(covariant SketchPainter oldDelegate) {
    return oldDelegate.points != points;
  }
}
