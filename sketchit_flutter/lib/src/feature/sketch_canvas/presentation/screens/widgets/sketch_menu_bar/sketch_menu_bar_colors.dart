import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../bloc/sketch_menu_bar_bloc/sketch_menu_bar_bloc.dart';
import '../../color_picker_dialog_box.dart';

class SketchMenuBarColors extends StatelessWidget {
  SketchMenuBarColors({super.key});

  final List<Color> _desktopColors = [
    Colors.black,
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
  ];

  final List<Color> _tabColors = [
    Colors.black,
    Colors.red,
    Colors.green,
    Colors.blue,
  ];

  @override
  Widget build(BuildContext context) {
    final colors = getValueForScreenType<List<Color>>(
      context: context,
      mobile: [],
      tablet: _tabColors,
      desktop: _desktopColors,
    );
    return BlocBuilder<SketchMenuBarBloc, SketchMenuBarState>(
      builder: (context, state) {
        return Row(
          children: [
            ...colors.map(
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
                onTap: () => showColorPickerDialogBox(state, context),
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
