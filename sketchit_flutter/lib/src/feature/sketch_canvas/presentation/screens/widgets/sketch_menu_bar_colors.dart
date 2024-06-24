import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    return Row(
      children: [
        ..._colors.map(
          (c) => MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                // TODO: Implement onTap color change
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
              // TODO: Implement onTap color picker
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
  }
}
