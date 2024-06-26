import 'package:flutter/material.dart' hide MenuBar;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../bloc/sketch_bloc/sketch_bloc.dart';
import '../bloc/sketch_menu_bar_bloc/sketch_menu_bar_bloc.dart';
import 'sketch_canvas_desktop_screen.dart';
import 'sketch_canvas_mobile_screen.dart';
import 'sketch_canvas_tab_screen.dart';

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
        child: ScreenTypeLayout.builder(
          desktop: (context) => const SketchCanvasDesktopScreen(),
          tablet: (context) => const SketchCanvasTabScreen(),
          mobile: (context) => const SketchCanvasMobileScreen(),
        ),
      ),
    );
  }
}
