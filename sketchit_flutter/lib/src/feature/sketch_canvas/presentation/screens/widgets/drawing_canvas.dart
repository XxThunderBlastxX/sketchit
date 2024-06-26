import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/service/service_locator.dart';
import '../../../../../app/utils/custom_cursor.dart';
import '../../bloc/sketch_bloc/sketch_bloc.dart';
import '../../bloc/sketch_menu_bar_bloc/sketch_menu_bar_bloc.dart';
import '../../model/sketch_stroke.dart';
import '../sketch_painter.dart';

class DrawingCanvas extends StatelessWidget {
  const DrawingCanvas({super.key});

  void _onPointerDown(
    PointerDownEvent details,
    BuildContext context,
    SketchMenuBarState menuBarState,
  ) {
    final transformedOffset = context
        .read<SketchBloc>()
        .transformationController
        .toScene(details.position);

    final sketchStroke = SketchStroke(
      color: menuBarState.sketchMode == SketchMode.erase
          ? menuBarState.eraserColor
          : menuBarState.strokeColor,
      strokeWidth: 2.0,
      offsetList: [transformedOffset],
      sketchMode: menuBarState.sketchMode,
    );
    context.read<SketchBloc>().add(StartSketch(sketchStroke));
  }

  void _onPointerMove(
    PointerMoveEvent details,
    BuildContext context,
    SketchMenuBarState menuBarState,
    SketchState state,
  ) {
    final transformedOffset = context
        .read<SketchBloc>()
        .transformationController
        .toScene(details.position);

    var sketchStroke = SketchStroke(
      color: menuBarState.sketchMode == SketchMode.erase
          ? menuBarState.eraserColor
          : menuBarState.strokeColor,
      strokeWidth: 2.0,
      offsetList: List.from(state.currentSketchStroke.offsetList)
        ..add(transformedOffset),
      sketchMode: menuBarState.sketchMode,
    );
    context.read<SketchBloc>().add(ContinueSketch(sketchStroke));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SketchMenuBarBloc, SketchMenuBarState>(
      builder: (context, menuBarState) {
        return BlocBuilder<SketchBloc, SketchState>(
          builder: (context, sketchState) {
            return RepaintBoundary(
              child: Listener(
                onPointerDown: (details) => _onPointerDown(
                  details,
                  context,
                  menuBarState,
                ),
                onPointerMove: (details) => _onPointerMove(
                  details,
                  context,
                  menuBarState,
                  sketchState,
                ),
                onPointerUp: (_) => context.read<SketchBloc>().add(EndSketch()),
                child: MouseRegion(
                  cursor: sl
                      .get<CustomCursor>()
                      .getCustomCursor(menuBarState.sketchMode),
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
                        context
                            .read<SketchBloc>()
                            .transformationController
                            .value,
                      ),
                      child: const SizedBox.expand(),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
