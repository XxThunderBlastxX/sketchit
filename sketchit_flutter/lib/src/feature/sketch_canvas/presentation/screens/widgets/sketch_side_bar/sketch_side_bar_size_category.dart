import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../../../app/theme/theme.dart';
import '../../../bloc/sketch_menu_bar_bloc/sketch_menu_bar_bloc.dart';
import 'sketch_side_bar_category.dart';

class SketchSideBarSizeCategory extends StatelessWidget {
  const SketchSideBarSizeCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SketchMenuBarBloc, SketchMenuBarState>(
      builder: (context, state) {
        return SketchSideBarCategory(
          title: 'Size',
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pen Size',
                    style: AppTheme.theme.textTheme.labelSmall,
                  ),
                  SizedBox(
                    width: getValueForScreenType(
                      context: context,
                      desktop: 30.sw,
                      tablet: 28.sw,
                      mobile: 40.sw,
                    ),
                    child: Slider(
                      value: state.strokeSize,
                      min: 3,
                      max: 20,
                      onChanged: (size) => context
                          .read<SketchMenuBarBloc>()
                          .add(ChangeStrokeSize(size)),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Eraser Size',
                    style: AppTheme.theme.textTheme.labelSmall,
                  ),
                  SizedBox(
                    width: getValueForScreenType(
                      context: context,
                      desktop: 30.sw,
                      tablet: 28.sw,
                      mobile: 40.sw,
                    ),
                    child: Slider(
                      value: state.eraserSize,
                      min: 5,
                      max: 30,
                      onChanged: (size) => context
                          .read<SketchMenuBarBloc>()
                          .add(ChangeEraserSize(size)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
