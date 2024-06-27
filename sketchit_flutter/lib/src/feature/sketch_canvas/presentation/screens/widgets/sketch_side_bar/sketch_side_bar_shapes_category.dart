import 'package:flutter/material.dart';

import 'sketch_side_bar_category.dart';

class SketchSideBarShapesCategory extends StatelessWidget {
  const SketchSideBarShapesCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return SketchSideBarCategory(
      title: 'Shapes',
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(IconData(
              59648,
              fontFamily: 'icomoon',
            )),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.minimize_rounded),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.circle_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.rectangle_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.hexagon_outlined),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
