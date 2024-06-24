import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../app/theme/theme.dart';
import '../../bloc/sketch_menu_bar_bloc/sketch_menu_bar_bloc.dart';

class SketchMenuBarColors extends StatelessWidget {
  SketchMenuBarColors({super.key});

  final List<Color> _colors = [
    Colors.black,
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SketchMenuBarBloc, SketchMenuBarState>(
      builder: (context, state) {
        return Row(
          children: [
            ..._colors.map(
              (c) => MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    context.read<SketchMenuBarBloc>().add(ChangeColor(c));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 8.0),
                    height: 26.0,
                    width: 26.0,
                    decoration: BoxDecoration(
                      color: c,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  Color pickedColor = state.color;
                  final menuBarBloc = context.read<SketchMenuBarBloc>();
                  showDialog(
                    context: context,
                    useRootNavigator: false,
                    builder: (context) => BlocProvider.value(
                      value: menuBarBloc,
                      child: BlocBuilder<SketchMenuBarBloc, SketchMenuBarState>(
                        builder: (context, state) {
                          return AlertDialog(
                            title: const Text('Pick a color'),
                            contentPadding: const EdgeInsets.all(8.0),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: ColorPicker(
                                    pickerColor: pickedColor,
                                    onColorChanged: (color) =>
                                        pickedColor = color,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        context
                                            .read<SketchMenuBarBloc>()
                                            .add(ChangeColor(pickedColor));
                                        // TODO: Implement a better way to close the dialog
                                        Future.delayed(
                                          const Duration(milliseconds: 5),
                                          () => context.pop(),
                                        );
                                      },
                                      child: Text(
                                        'Pick Color',
                                        style: AppTheme
                                            .theme.textTheme.labelLarge!
                                            .copyWith(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
                child: SvgPicture.asset(
                  'assets/svgs/color_wheel.svg',
                  height: 26.0,
                  width: 26.0,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
