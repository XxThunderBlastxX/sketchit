import 'package:flutter/services.dart';

enum SketchMode {
  draw,
  erase,
  circle,
  rectangle,
  line,
  hexagon,
  pan,
}

extension SketchModeExtenion on SketchMode {
  SystemMouseCursor get systemCursor {
    switch (this) {
      case SketchMode.pan:
        return SystemMouseCursors.grab;
      default:
        return SystemMouseCursors.cell;
    }
  }
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
