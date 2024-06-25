import 'package:flutter/painting.dart';

enum SketchMode {
  draw,
  erase,
  circle,
  rectangle,
  line,
  hexagon,
  pan,
}

/// Represents a stroke in the sketch canvas.
class SketchStroke {
  final List<Offset> offsetList;
  final Color color;
  final double strokeWidth;
  final SketchMode sketchMode;

  SketchStroke({
    required this.offsetList,
    required this.color,
    required this.strokeWidth,
    required this.sketchMode,
  });
}
