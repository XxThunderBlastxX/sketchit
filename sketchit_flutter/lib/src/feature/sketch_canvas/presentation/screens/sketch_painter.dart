import 'package:flutter/material.dart';

import '../model/sketch_stroke.dart';

class SketchPainter extends CustomPainter {
  final List<SketchStroke> sketchStrokes;

  const SketchPainter(this.sketchStrokes);

  @override
  void paint(Canvas canvas, Size size) {
    for (SketchStroke sketchStroke in sketchStrokes) {
      final paint = Paint()
        ..color = sketchStroke.color
        ..strokeWidth = sketchStroke.strokeWidth
        ..strokeCap = StrokeCap.round
        ..isAntiAlias = true;

      if (sketchStroke.offsetList.isEmpty) {
        continue;
      }

      final firstOffset = sketchStroke.offsetList.first;
      final lastOffset = sketchStroke.offsetList.last;

      switch (sketchStroke.sketchMode) {
        case SketchMode.draw:
          break;
        case SketchMode.erase:
          break;
        case SketchMode.circle:
          break;
        case SketchMode.rectangle:
          break;
        case SketchMode.line:
          canvas.drawLine(
            firstOffset,
            lastOffset,
            paint,
          );
          break;
        case SketchMode.hexagon:
          break;
      }
    }
  }

  @override
  bool shouldRepaint(covariant SketchPainter oldDelegate) {
    return true;
  }
}
