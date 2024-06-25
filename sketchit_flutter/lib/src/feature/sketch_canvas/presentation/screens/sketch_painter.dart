import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../model/sketch_stroke.dart';

class SketchPainter extends CustomPainter {
  final List<SketchStroke> sketchStrokes;

  const SketchPainter(this.sketchStrokes);

  @override
  void paint(Canvas canvas, Size size) {
    for (SketchStroke sketchStroke in sketchStrokes) {
      // Skip empty strokes
      if (sketchStroke.offsetList.isEmpty) {
        continue;
      }

      final path = Path()
        ..moveTo(
          sketchStroke.offsetList.first.dx,
          sketchStroke.offsetList.first.dy,
        );

      for (int i = 1; i < sketchStroke.offsetList.length - 1; ++i) {
        final p0 = sketchStroke.offsetList[i];
        final p1 = sketchStroke.offsetList[i + 1];

        path.quadraticBezierTo(
          p0.dx,
          p0.dy,
          (p0.dx + p1.dx) / 2,
          (p0.dy + p1.dy) / 2,
        );
      }

      final paint = Paint()
        ..color = sketchStroke.color
        ..strokeWidth = sketchStroke.strokeWidth
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke
        ..isAntiAlias = true;

      // First and last offset from the stroke
      final firstOffset = sketchStroke.offsetList.first;
      final lastOffset = sketchStroke.offsetList.last;

      // Calculate center offset point from the first and last offset points
      final centerOffset = firstOffset / 2 + lastOffset / 2;

      // Calculate path's radius from the first and last offset points
      final radius = (firstOffset - lastOffset).distance / 2;

      // create rect to use in circle
      Rect rect = Rect.fromPoints(firstOffset, lastOffset);

      switch (sketchStroke.sketchMode) {
        case SketchMode.draw:
          canvas.drawPath(path, paint);
          break;
        case SketchMode.line:
          canvas.drawLine(
            firstOffset,
            lastOffset,
            paint,
          );
          break;
        case SketchMode.erase:
          canvas.drawPath(path, paint);
          break;
        case SketchMode.circle:
          canvas.drawCircle(centerOffset, radius, paint);
          break;
        case SketchMode.rectangle:
          canvas.drawRect(rect, paint);
          break;
        case SketchMode.hexagon:
          final path = Path();
          const angle = math.pi * 2 / 6;
          double radian = 0.0;

          Offset startOffset = Offset(
            radius * math.cos(radian),
            radius * math.sin(radian),
          );

          path.moveTo(
            startOffset.dx + centerOffset.dx,
            startOffset.dy + centerOffset.dy,
          );

          for (int i = 1; i <= 6; i++) {
            double x = radius * math.cos(radian + angle * i) + centerOffset.dx;
            double y = radius * math.sin(radian + angle * i) + centerOffset.dy;
            path.lineTo(x, y);
          }
          path.close();
          canvas.drawPath(path, paint);
          break;
      }
    }
  }

  @override
  bool shouldRepaint(covariant SketchPainter oldDelegate) {
    return true;
  }
}
