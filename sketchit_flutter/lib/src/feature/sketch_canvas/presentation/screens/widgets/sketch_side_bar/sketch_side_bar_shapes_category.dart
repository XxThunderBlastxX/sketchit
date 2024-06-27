import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../app/theme/theme.dart';
import '../../../bloc/sketch_menu_bar_bloc/sketch_menu_bar_bloc.dart';
import '../../../model/sketch_stroke.dart';
import 'sketch_side_bar_category.dart';

class SketchSideBarShapesCategory extends StatelessWidget {
  final SketchMenuBarState state;

  const SketchSideBarShapesCategory({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return SketchSideBarCategory(
      title: 'Shapes',
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.edit),
            color: state.sketchMode == SketchMode.draw
                ? AppTheme.primaryColor
                : Colors.black,
            onPressed: () => context
                .read<SketchMenuBarBloc>()
                .add(const ChangeSketchMode(SketchMode.draw)),
          ),
          IconButton(
            icon: const Icon(IconData(
              59648,
              fontFamily: 'icomoon',
            )),
            color: state.sketchMode == SketchMode.erase
                ? AppTheme.primaryColor
                : Colors.black.withOpacity(0.75),
            onPressed: () => context
                .read<SketchMenuBarBloc>()
                .add(const ChangeSketchMode(SketchMode.erase)),
          ),
          IconButton(
            icon: const Icon(Icons.minimize_rounded),
            color: state.sketchMode == SketchMode.line
                ? AppTheme.primaryColor
                : Colors.black,
            onPressed: () => context
                .read<SketchMenuBarBloc>()
                .add(const ChangeSketchMode(SketchMode.line)),
          ),
          IconButton(
            icon: const Icon(Icons.circle_outlined),
            color: state.sketchMode == SketchMode.circle
                ? AppTheme.primaryColor
                : Colors.black,
            onPressed: () => context
                .read<SketchMenuBarBloc>()
                .add(const ChangeSketchMode(SketchMode.circle)),
          ),
          IconButton(
            icon: const Icon(Icons.rectangle_outlined),
            color: state.sketchMode == SketchMode.rectangle
                ? AppTheme.primaryColor
                : Colors.black,
            onPressed: () => context
                .read<SketchMenuBarBloc>()
                .add(const ChangeSketchMode(SketchMode.rectangle)),
          ),
          IconButton(
            icon: const Icon(Icons.hexagon_outlined),
            color: state.sketchMode == SketchMode.hexagon
                ? AppTheme.primaryColor
                : Colors.black,
            onPressed: () => context
                .read<SketchMenuBarBloc>()
                .add(const ChangeSketchMode(SketchMode.hexagon)),
          ),
        ],
      ),
    );
  }
}
