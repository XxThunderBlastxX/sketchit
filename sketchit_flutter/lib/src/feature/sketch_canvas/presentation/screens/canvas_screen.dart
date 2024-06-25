import 'package:flutter/material.dart' hide MenuBar;
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/theme/theme.dart';
import '../bloc/sketch_bloc/sketch_bloc.dart';
import '../bloc/sketch_menu_bar_bloc/sketch_menu_bar_bloc.dart';
import 'widgets/drawing_canvas.dart';
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
