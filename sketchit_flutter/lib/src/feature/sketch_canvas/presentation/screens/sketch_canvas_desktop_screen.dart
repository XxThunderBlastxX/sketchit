import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../app/theme/theme.dart';
import 'widgets/drawing_canvas/drawing_canvas.dart';
import 'widgets/sketch_menu_bar/sketch_menu_bar.dart';

class SketchCanvasDesktopScreen extends StatelessWidget {
  const SketchCanvasDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}
