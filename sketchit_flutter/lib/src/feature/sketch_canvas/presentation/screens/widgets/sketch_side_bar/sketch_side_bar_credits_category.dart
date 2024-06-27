import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../../app/theme/theme.dart';

class SketchSideBarCreditsCategory extends StatelessWidget {
  const SketchSideBarCreditsCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              text: 'Made with ',
              style: AppTheme.theme.textTheme.labelMedium,
              children: [
                const WidgetSpan(
                  child: Icon(
                    Icons.favorite_outlined,
                    color: Colors.red,
                    size: 22.0,
                  ),
                ),
                const TextSpan(text: ' by '),
                TextSpan(
                  text: 'Koustav Mondal',
                  style: AppTheme.theme.textTheme.labelMedium!.copyWith(
                    color: Colors.purple,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Star ',
              style: AppTheme.theme.textTheme.labelMedium,
              children: [
                WidgetSpan(
                  child: Icon(
                    Icons.star_rounded,
                    color: Colors.yellow[600],
                    size: 22.0,
                  ),
                ),
                const TextSpan(text: ' on '),
                TextSpan(
                  text: 'GitHub',
                  style: AppTheme.theme.textTheme.labelMedium!.copyWith(
                    color: Colors.purple,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
