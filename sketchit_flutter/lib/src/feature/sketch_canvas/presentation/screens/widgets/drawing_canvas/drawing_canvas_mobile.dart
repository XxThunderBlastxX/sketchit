import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/sketch_bloc/sketch_bloc.dart';
import '../../../bloc/sketch_menu_bar_bloc/sketch_menu_bar_bloc.dart';
import '../../../model/sketch_stroke.dart';
import '../../sketch_painter.dart';

class DrawingCanvasMobile extends StatelessWidget {
  final SketchMenuBarState menuBarState;
  final SketchState sketchState;

  const DrawingCanvasMobile({
    super.key,
    required this.menuBarState,
    required this.sketchState,
  });

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
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
    );
  }
}
