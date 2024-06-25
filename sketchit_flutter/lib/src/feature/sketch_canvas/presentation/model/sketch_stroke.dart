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
      case SketchMode.draw:
        return SystemMouseCursors.cell;
      case SketchMode.erase:
        return SystemMouseCursors.forbidden;
      case SketchMode.circle:
        return SystemMouseCursors.cell;
      case SketchMode.rectangle:
        return SystemMouseCursors.cell;
      case SketchMode.line:
        return SystemMouseCursors.cell;
      case SketchMode.hexagon:
        return SystemMouseCursors.cell;
      case SketchMode.pan:
        return SystemMouseCursors.grab;
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
