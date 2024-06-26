import 'package:custom_mouse_cursor/custom_mouse_cursor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../../../app/service/service_locator.dart';
import '../../../../../../app/utils/custom_cursor.dart';
import '../../../bloc/sketch_bloc/sketch_bloc.dart';
import '../../../bloc/sketch_menu_bar_bloc/sketch_menu_bar_bloc.dart';
import '../../../model/sketch_stroke.dart';
import '../../sketch_painter.dart';

class DrawingCanvasTab extends StatelessWidget {
  final SketchMenuBarState menuBarState;
  final SketchState sketchState;

  const DrawingCanvasTab({
    super.key,
    required this.menuBarState,
    required this.sketchState,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: getValueForScreenType<CustomMouseCursor>(
        context: context,
        desktop:
            sl.get<CustomCursor>().getCustomCursor(menuBarState.sketchMode),
        mobile: sl.get<CustomCursor>().getCustomCursor(menuBarState.sketchMode),
      ),
      child: InteractiveViewer(
        minScale: 0.1,
        maxScale: 3.0,
        panEnabled: menuBarState.sketchMode == SketchMode.pan,
        transformationController:
            context.read<SketchBloc>().transformationController,
        child: CustomPaint(
          painter: SketchPainter(
            List.from(sketchState.sketchStrokes)
              ..add(sketchState.currentSketchStroke),
            context.read<SketchBloc>().transformationController.value,
          ),
          child: const SizedBox.expand(),
        ),
      ),
    );
  }
}
