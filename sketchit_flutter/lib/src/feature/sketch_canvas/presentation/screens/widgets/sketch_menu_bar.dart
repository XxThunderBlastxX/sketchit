import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/sketch_bloc/sketch_bloc.dart';
import '../../bloc/sketch_menu_bar_bloc/sketch_menu_bar_bloc.dart';
import '../../model/sketch_stroke.dart';
import 'sketch_menu_bar_colors.dart';

class SketchMenuBar extends StatelessWidget {
  const SketchMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    final sketchBloc = BlocProvider.of<SketchBloc>(context);

    return BlocBuilder<SketchMenuBarBloc, SketchMenuBarState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              height: 50.0,
              // width: 520.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => context
                        .read<SketchMenuBarBloc>()
                        .add(const ChangeSketchMode(SketchMode.draw)),
                    tooltip: 'Pen',
                    color: state.sketchMode == SketchMode.draw
                        ? Colors.blue
                        : Colors.black,
                  ),
                  const VerticalDivider(),
                  SketchMenuBarColors(),
                  const VerticalDivider(),
                  IconButton(
                    icon: const Icon(Icons.minimize_outlined),
                    onPressed: () => context
                        .read<SketchMenuBarBloc>()
                        .add(const ChangeSketchMode(SketchMode.line)),
                    tooltip: 'Line',
                    color: state.sketchMode == SketchMode.line
                        ? Colors.blue
                        : Colors.black,
                  ),
                  IconButton(
                    icon: const Icon(Icons.circle_outlined),
                    onPressed: () => context
                        .read<SketchMenuBarBloc>()
                        .add(const ChangeSketchMode(SketchMode.circle)),
                    tooltip: 'Circle',
                    color: state.sketchMode == SketchMode.circle
                        ? Colors.blue
                        : Colors.black,
                  ),
                  IconButton(
                    icon: const Icon(Icons.rectangle_outlined),
                    onPressed: () => context
                        .read<SketchMenuBarBloc>()
                        .add(const ChangeSketchMode(SketchMode.rectangle)),
                    tooltip: 'Rectangle',
                    color: state.sketchMode == SketchMode.rectangle
                        ? Colors.blue
                        : Colors.black,
                  ),
                  IconButton(
                    icon: const Icon(Icons.hexagon_outlined),
                    onPressed: () => context
                        .read<SketchMenuBarBloc>()
                        .add(const ChangeSketchMode(SketchMode.hexagon)),
                    tooltip: 'Hexagon',
                    color: state.sketchMode == SketchMode.hexagon
                        ? Colors.blue
                        : Colors.black,
                  ),
                  const VerticalDivider(),
                  IconButton(
                    icon: const Icon(Icons.undo),
                    onPressed: () => sketchBloc.add(UndoSketch()),
                    tooltip: 'Undo',
                  ),
                  IconButton(
                    icon: const Icon(Icons.redo),
                    onPressed: () => sketchBloc.add(RedoSketch()),
                    tooltip: 'Redo',
                  ),
                  const VerticalDivider(),
                  IconButton(
                    icon: const Icon(Icons.delete_rounded),
                    onPressed: () =>
                        context.read<SketchBloc>().add(ClearSketch()),
                    tooltip: 'Clear',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
