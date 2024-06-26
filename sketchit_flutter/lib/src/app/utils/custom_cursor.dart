import 'package:custom_mouse_cursor/custom_mouse_cursor.dart';
import 'package:flutter/material.dart';

import '../../feature/sketch_canvas/presentation/model/sketch_stroke.dart';

class CustomCursor {
  late CustomMouseCursor penCursor;
  late CustomMouseCursor eraserCursor;
  late CustomMouseCursor panCursor;
  late CustomMouseCursor shapeCursor;

  Future<void> init() async {
    penCursor = await CustomMouseCursor.icon(
      Icons.edit,
      color: Colors.black,
      hotX: 3,
      hotY: 28,
    );

    eraserCursor = await CustomMouseCursor.icon(
      const IconData(
        59648,
        fontFamily: 'icomoon',
      ),
      color: Colors.black,
      hotX: 3,
      hotY: 28,
    );

    panCursor = await CustomMouseCursor.icon(
      Icons.pan_tool_rounded,
      color: Colors.black,
      hotX: 3,
      hotY: 3,
    );

    shapeCursor = await CustomMouseCursor.icon(
      Icons.add,
      color: Colors.black,
      hotX: 15,
      hotY: 15,
    );
  }

  CustomMouseCursor getCustomCursor(SketchMode sketchMode) {
    switch (sketchMode) {
      case SketchMode.draw:
        return penCursor;
      case SketchMode.erase:
        return eraserCursor;
      case SketchMode.pan:
        return panCursor;
      default:
        return shapeCursor;
    }
  }
}
