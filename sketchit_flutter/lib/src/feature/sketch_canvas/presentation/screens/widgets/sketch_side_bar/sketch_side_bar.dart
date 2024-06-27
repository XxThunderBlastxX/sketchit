import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../../../app/theme/theme.dart';
import '../../../bloc/side_bar_bloc/side_bar_bloc.dart';
import '../../../bloc/sketch_menu_bar_bloc/sketch_menu_bar_bloc.dart';
import 'sketch_side_bar_actions_category.dart';
import 'sketch_side_bar_colors_category.dart';
import 'sketch_side_bar_credits_category.dart';
import 'sketch_side_bar_shapes_category.dart';
import 'sketch_side_bar_size_category.dart';

class SketchSideBar extends StatelessWidget {
  const SketchSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: BlocBuilder<SideBarBloc, SideBarState>(
        builder: (context, sideBarState) {
          return BlocBuilder<SketchMenuBarBloc, SketchMenuBarState>(
            builder: (context, menuBarState) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInOut,
                transform: sideBarState.isSideBarOpen
                    ? Matrix4.translationValues(3.sw, -4.sh, 0)
                    : getValueForScreenType(
                        context: context,
                        mobile: Matrix4.translationValues(-65.sw, -4.sh, 0),
                        desktop: Matrix4.translationValues(-45.sw, -4.sh, 0),
                        tablet: Matrix4.translationValues(-45.sw, -4.sh, 0),
                      ),
                width: getValueForScreenType(
                  context: context,
                  mobile: 65.sw,
                  desktop: 45.sw,
                  tablet: 45.sw,
                ),
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '🖌️Sketch It',
                      style: AppTheme.theme.textTheme.labelLarge,
                    ),
                    const Divider(),
                    SketchSideBarShapesCategory(state: menuBarState),
                    const Divider(),
                    SketchSideBarColorsCategory(),
                    const Divider(),
                    const SketchSideBarSizeCategory(),
                    const Divider(),
                    const SketchSideBarActionsCategory(),
                    const Divider(),
                    const SketchSideBarCreditsCategory(),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
