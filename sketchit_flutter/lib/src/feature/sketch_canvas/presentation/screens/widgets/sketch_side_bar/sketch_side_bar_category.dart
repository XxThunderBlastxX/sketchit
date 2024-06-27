import 'package:flutter/material.dart';

import '../../../../../../app/theme/theme.dart';

class SketchSideBarCategory extends StatelessWidget {
  final String title;
  final Widget content;

  const SketchSideBarCategory({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTheme.theme.textTheme.labelMedium,
        ),
        content,
      ],
    );
  }
}
