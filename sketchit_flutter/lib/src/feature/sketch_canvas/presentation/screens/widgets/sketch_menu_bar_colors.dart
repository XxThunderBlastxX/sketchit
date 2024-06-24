import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../app/theme/theme.dart';

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
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Pick a color'),
                  contentPadding: const EdgeInsets.all(8.0),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: ColorPicker(
                          pickerColor: Colors.black,
                          onColorChanged: (color) {},
                          hexInputBar: true,
                          hexInputController:
                              TextEditingController(), // TODO: Add a controller to change the hex if required
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              // TODO: Implement onPressed to pick color
                              context.pop();
                            },
                            child: Text(
                              'Pick Color',
                              style:
                                  AppTheme.theme.textTheme.labelLarge!.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
  }
}
