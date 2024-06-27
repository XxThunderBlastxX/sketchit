import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'sketch_side_bar_category.dart';

class SketchSideBarColorsCategory extends StatelessWidget {
  SketchSideBarColorsCategory({super.key});

  final _colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.teal,
    Colors.brown,
    Colors.grey,
    Colors.black,
    Colors.indigo,
    Colors.lime,
    Colors.teal,
    Colors.purpleAccent,
  ];

  @override
  Widget build(BuildContext context) {
    return SketchSideBarCategory(
      title: 'Colors',
      content: GridView.count(
        crossAxisCount: 8,
        crossAxisSpacing: 6.0,
        mainAxisSpacing: 6.0,
        shrinkWrap: true,
        children: [
          ..._colors.map(
            (c) => MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  // TODO: Implement color change
                },
                child: Container(
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
                // TODO : Implement color picker
              },
              child: SvgPicture.asset(
                'assets/svgs/color_wheel.svg',
              ),
            ),
          )
        ],
      ),
    );
  }
}
