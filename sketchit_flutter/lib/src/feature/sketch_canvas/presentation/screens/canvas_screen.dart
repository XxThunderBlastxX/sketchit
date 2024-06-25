import 'package:flutter/material.dart' hide MenuBar;
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/theme/theme.dart';
import '../bloc/sketch_bloc/sketch_bloc.dart';
import '../bloc/sketch_menu_bar_bloc/sketch_menu_bar_bloc.dart';
import '../model/sketch_stroke.dart';
import 'sketch_painter.dart';
import 'widgets/sketch_menu_bar.dart';

class CanvasScreen extends StatelessWidget {
  const CanvasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider<SketchBloc>(
            create: (context) => SketchBloc(),
          ),
          BlocProvider<SketchMenuBarBloc>(
            create: (context) => SketchMenuBarBloc(),
          ),
        ],
        child: Stack(
          children: [
            const DrawingCanvas(),
            const SketchMenuBar()
                .animate()
                .fadeIn(duration: const Duration(milliseconds: 500))
                .moveY(begin: 25, end: 0),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Implement share functionality
                  },
                  child: Text(
                    'Share',
                    style: AppTheme.theme.textTheme.labelMedium!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
                .animate()
                .fadeIn(duration: const Duration(milliseconds: 500))
                .moveX(begin: 25, end: 0),
          ],
        ),
      ),
    );
  }
}

class DrawingCanvas extends StatelessWidget {
  const DrawingCanvas({super.key});

  void _onPointerDown(
    PointerDownEvent details,
    BuildContext context,
    SketchMenuBarBloc menuBarBloc,
  ) {
    final transformedOffset = context
        .read<SketchBloc>()
        .transformationController
        .toScene(details.position);

    final sketchStroke = SketchStroke(
      color: menuBarBloc.state.sketchMode == SketchMode.erase
          ? menuBarBloc.state.eraserColor
          : menuBarBloc.state.strokeColor,
      strokeWidth: 2.0,
      offsetList: [transformedOffset],
      sketchMode: menuBarBloc.state.sketchMode,
    );
    context.read<SketchBloc>().add(StartSketch(sketchStroke));
  }

  void _onPointerMove(
    PointerMoveEvent details,
    BuildContext context,
    SketchMenuBarBloc menuBarBloc,
    SketchState state,
  ) {
    final transformedOffset = context
        .read<SketchBloc>()
        .transformationController
        .toScene(details.position);

    var sketchStroke = SketchStroke(
      color: menuBarBloc.state.sketchMode == SketchMode.erase
          ? menuBarBloc.state.eraserColor
          : menuBarBloc.state.strokeColor,
      strokeWidth: 2.0,
      offsetList: List.from(state.currentSketchStroke.offsetList)
        ..add(transformedOffset),
      sketchMode: menuBarBloc.state.sketchMode,
    );
    context.read<SketchBloc>().add(ContinueSketch(sketchStroke));
  }

  @override
  Widget build(BuildContext context) {
    final menuBarBloc = BlocProvider.of<SketchMenuBarBloc>(context);

    return BlocBuilder<SketchBloc, SketchState>(
      builder: (context, state) {
        return RepaintBoundary(
          child: Listener(
            onPointerDown: (details) => _onPointerDown(
              details,
              context,
              menuBarBloc,
            ),
            onPointerMove: (details) => _onPointerMove(
              details,
              context,
              menuBarBloc,
              state,
            ),
            onPointerUp: (_) => context.read<SketchBloc>().add(EndSketch()),
            child: InteractiveViewer(
              minScale: 0.1,
              maxScale: 3.0,
              panEnabled: menuBarBloc.state.sketchMode == SketchMode.pan,
              transformationController:
                  context.read<SketchBloc>().transformationController,
              child: CustomPaint(
                painter: SketchPainter(
                  List.from(state.sketchStrokes)
                    ..add(state.currentSketchStroke),
                  context.read<SketchBloc>().transformationController.value,
                ),
                child: const SizedBox.expand(),
              ),
            ),
          ),
        );
      },
    );
  }
}
