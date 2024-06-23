import 'package:flutter/material.dart' hide MenuBar;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/sketch_bloc.dart';
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

  Offset getOffset(BuildContext context, DragUpdateDetails details) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var lp = renderBox.globalToLocal(details.globalPosition);
    lp = lp.translate(0.0, -AppBar().preferredSize.height + 56.0);
    return lp;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SketchBloc, SketchState>(
      builder: (context, state) {
        return GestureDetector(
          onPanUpdate: (details) {
            final offset = getOffset(context, details);
            context.read<SketchBloc>().add(ContinueSketch(offset));
          },
          child: InteractiveViewer(
            minScale: 0.1,
            maxScale: 3.0,
            child: CustomPaint(
              painter: SketchPainter(
                state.points,
                state.color,
                state.strokeWidth,
              ),
              child: const SizedBox.expand(),
            ),
          ),
        );
      },
    );
  }
}
