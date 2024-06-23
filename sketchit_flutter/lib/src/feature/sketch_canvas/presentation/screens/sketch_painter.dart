import 'dart:ui';

import 'package:flutter/material.dart';

import '../model/sketch_stroke.dart';

class SketchPainter extends CustomPainter {
  final List<SketchStroke?> sketchStrokes;

  SketchPainter(this.sketchStrokes);

  List<Offset> offsetList = [];

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < sketchStrokes.length - 1; i++) {
      if (sketchStrokes[i] != null && sketchStrokes[i + 1] != null) {
        final paint = Paint()
          ..color = sketchStrokes[i]!.color
          ..strokeWidth = sketchStrokes[i]!.strokeWidth
          ..strokeCap = StrokeCap.round
          ..isAntiAlias = true;

        canvas.drawLine(
          sketchStrokes[i]!.offset,
          sketchStrokes[i + 1]!.offset,
          paint,
        );
      } else if (sketchStrokes[i] != null && sketchStrokes[i + 1] == null) {
        offsetList.clear();
        offsetList.add(sketchStrokes[i]!.offset);

        canvas.drawPoints(
          PointMode.points,
          offsetList,
          Paint()
            ..color = sketchStrokes[i]!.color
            ..strokeWidth = sketchStrokes[i]!.strokeWidth
            ..strokeCap = StrokeCap.round
            ..isAntiAlias = true,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant SketchPainter oldDelegate) {
    return true;
  }
}
