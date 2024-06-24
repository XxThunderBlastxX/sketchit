import 'package:flutter/painting.dart';

enum SketchMode {
  draw,
  erase,
  circle,
  rectangle,
  line,
  hexagon,
}

/// Represents a stroke in the sketch canvas.
class SketchStroke {
  final Offset offset;
  final Color color;
  final double strokeWidth;

  SketchStroke({
    required this.offset,
    required this.color,
    required this.strokeWidth,
  });
}
