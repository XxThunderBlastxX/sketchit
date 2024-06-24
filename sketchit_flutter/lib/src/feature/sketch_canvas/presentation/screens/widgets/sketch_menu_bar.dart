import 'package:flutter/material.dart';

import 'sketch_menu_bar_colors.dart';

class SketchMenuBar extends StatelessWidget {
  const SketchMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          height: 50.0,
          // width: 520.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {},
                tooltip: 'Pen',
              ),
              const VerticalDivider(),
              SketchMenuBarColors(),
              const VerticalDivider(),
              IconButton(
                icon: const Icon(Icons.minimize_outlined),
                onPressed: () {},
                tooltip: 'Line',
              ),
              IconButton(
                icon: const Icon(Icons.circle_outlined),
                onPressed: () {},
                tooltip: 'Circle',
              ),
              IconButton(
                icon: const Icon(Icons.rectangle_outlined),
                onPressed: () {},
                tooltip: 'Rectangle',
              ),
              IconButton(
                icon: const Icon(Icons.hexagon_outlined),
                onPressed: () {},
                tooltip: 'Hexagon',
              ),
              const VerticalDivider(),
              IconButton(
                icon: const Icon(Icons.redo),
                onPressed: () {},
                tooltip: 'Redo',
              ),
              IconButton(
                icon: const Icon(Icons.undo),
                onPressed: () {},
                tooltip: 'Undo',
              ),
              const VerticalDivider(),
              IconButton(
                icon: const Icon(Icons.delete_rounded),
                onPressed: () {},
                tooltip: 'Clear',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
