import 'package:flutter/material.dart' hide MenuBar;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/sketch_bloc.dart';
import '../model/sketch_stroke.dart';
import './widgets/menu_bar.dart';
import 'sketch_painter.dart';

class CanvasScreen extends StatelessWidget {
  const CanvasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sketch It!'),
        actions: const [
          MenuBar(),
        ],
      ),
      body: BlocProvider<SketchBloc>(
        create: (context) => SketchBloc(),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                padding: const EdgeInsets.all(16),
                icon: const Icon(Icons.menu),
                onPressed: () {},
                tooltip: 'Menu',
              ),
            ),
            const DrawingCanvas()
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
        return GestureDetector(
          onPanStart: (details) {
            var sketchStroke = SketchStroke(
              color: Colors.red,
              strokeWidth: 2.0,
              offset: details.localPosition,
            );
            context.read<SketchBloc>().add(StartSketch(sketchStroke));
          },
          onPanUpdate: (details) {
            var sketchStroke = SketchStroke(
              color: Colors.red,
              strokeWidth: 2.0,
              offset: details.localPosition,
            );
            context.read<SketchBloc>().add(ContinueSketch(sketchStroke));
          },
          onPanEnd: (details) {
            context.read<SketchBloc>().add(EndSketch());
          },
          child: InteractiveViewer(
            minScale: 0.1,
            maxScale: 3.0,
            child: CustomPaint(
              painter: SketchPainter(state.sketchStrokes),
              child: const SizedBox.expand(),
            ),
          ),
        );
      },
    );
  }
}
