import 'package:flutter/material.dart' hide MenuBar;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/theme/theme.dart';
import '../bloc/sketch_bloc.dart';
import '../model/sketch_stroke.dart';
import 'sketch_painter.dart';
import 'widgets/sketch_menu_bar.dart';

class CanvasScreen extends StatelessWidget {
  const CanvasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<SketchBloc>(
        create: (context) => SketchBloc(),
        child: Stack(
          children: [
            const DrawingCanvas(),
            const SketchMenuBar(),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Share',
                    style: AppTheme.theme.textTheme.labelMedium!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawingCanvas extends StatelessWidget {
  const DrawingCanvas({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SketchBloc, SketchState>(
      builder: (context, state) {
        return RepaintBoundary(
          child: Listener(
            onPointerDown: (details) {
              var sketchStroke = SketchStroke(
                color: Colors.red,
                strokeWidth: 2.0,
                offset: details.localPosition,
              );
              context.read<SketchBloc>().add(StartSketch(sketchStroke));
            },
            onPointerMove: (details) {
              var sketchStroke = SketchStroke(
                color: Colors.red,
                strokeWidth: 2.0,
                offset: details.localPosition,
              );
              context.read<SketchBloc>().add(ContinueSketch(sketchStroke));
            },
            onPointerUp: (details) =>
                context.read<SketchBloc>().add(EndSketch()),
            child: InteractiveViewer(
              minScale: 0.1,
              maxScale: 3.0,
              child: CustomPaint(
                painter: SketchPainter(state.sketchStrokes),
                child: const SizedBox.expand(),
              ),
            ),
          ),
        );
      },
    );
  }
}
