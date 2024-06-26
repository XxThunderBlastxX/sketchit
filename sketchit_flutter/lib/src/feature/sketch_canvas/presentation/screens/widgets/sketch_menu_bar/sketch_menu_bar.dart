import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../bloc/sketch_bloc/sketch_bloc.dart';
import '../../../bloc/sketch_menu_bar_bloc/sketch_menu_bar_bloc.dart';
import '../../../model/sketch_stroke.dart';
import 'sketch_menu_bar_colors.dart';

class SketchMenuBar extends StatelessWidget {
  const SketchMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SketchMenuBarBloc, SketchMenuBarState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: IntrinsicHeight(
              child: Container(
                padding: const EdgeInsets.all(8.0),
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
                    IconButton(
                      icon: const Icon(IconData(
                        59648,
                        fontFamily: 'icomoon',
                      )),
                      onPressed: () => context
                          .read<SketchMenuBarBloc>()
                          .add(const ChangeSketchMode(SketchMode.erase)),
                      tooltip: 'Eraser',
                      color: state.sketchMode == SketchMode.erase
                          ? Colors.blue
                          : Colors.black.withOpacity(0.75),
                    ),
                    IconButton(
                      icon: const Icon(Icons.pan_tool_rounded),
                      onPressed: () => context
                          .read<SketchMenuBarBloc>()
                          .add(const ChangeSketchMode(SketchMode.pan)),
                      tooltip: 'Move',
                      color: state.sketchMode == SketchMode.pan
                          ? Colors.blue
                          : Colors.black,
                    ),
                    const VerticalDivider(),
                    Visibility(
                      visible: getValueForScreenType<bool>(
                        context: context,
                        mobile: false,
                        desktop: true,
                        tablet: true,
                      ),
                      child: SketchMenuBarColors(),
                    ),
                    Visibility(
                      visible: getValueForScreenType<bool>(
                        context: context,
                        mobile: false,
                        desktop: true,
                        tablet: true,
                      ),
                      child: const VerticalDivider(),
                    ),
                    Visibility(
                      visible: getValueForScreenType<bool>(
                        context: context,
                        mobile: false,
                        desktop: true,
                      ),
                      child: Row(
                        children: [
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
                                .add(const ChangeSketchMode(
                                    SketchMode.rectangle)),
                            tooltip: 'Rectangle',
                            color: state.sketchMode == SketchMode.rectangle
                                ? Colors.blue
                                : Colors.black,
                          ),
                          IconButton(
                            icon: const Icon(Icons.hexagon_outlined),
                            onPressed: () => context
                                .read<SketchMenuBarBloc>()
                                .add(
                                    const ChangeSketchMode(SketchMode.hexagon)),
                            tooltip: 'Hexagon',
                            color: state.sketchMode == SketchMode.hexagon
                                ? Colors.blue
                                : Colors.black,
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: getValueForScreenType<bool>(
                        context: context,
                        mobile: false,
                        desktop: true,
                      ),
                      child: const VerticalDivider(),
                    ),
                    IconButton(
                      icon: const Icon(Icons.undo),
                      onPressed: () =>
                          context.read<SketchBloc>().add(UndoSketch()),
                      tooltip: 'Undo',
                    ),
                    IconButton(
                      icon: const Icon(Icons.redo),
                      onPressed: () =>
                          context.read<SketchBloc>().add(RedoSketch()),
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
          ),
        );
      },
    );
  }
}
