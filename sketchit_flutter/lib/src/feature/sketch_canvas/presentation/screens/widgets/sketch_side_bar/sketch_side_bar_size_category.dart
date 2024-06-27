import 'package:flutter/material.dart';
import 'package:sketchit_flutter/src/app/theme/theme.dart';

import 'sketch_side_bar_category.dart';

class SketchSideBarSizeCategory extends StatelessWidget {
  const SketchSideBarSizeCategory({super.key});

  @override
  Widget build(BuildContext context) {
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
              Slider(
                value: 0.5,
                onChanged: (value) {},
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
              Slider(
                value: 0.5,
                onChanged: (value) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
