import 'package:flutter/material.dart';

import 'sketch_side_bar_category.dart';

class SketchSideBarActionsCategory extends StatelessWidget {
  const SketchSideBarActionsCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return SketchSideBarCategory(
      title: 'Actions',
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.undo),
            onPressed: () {},
            tooltip: 'Undo',
          ),
          IconButton(
            icon: const Icon(Icons.redo),
            onPressed: () {},
            tooltip: 'Redo',
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {},
            tooltip: 'Clear',
          ),
          // TODO : Implement save functionality
          // IconButton(
          //   icon: const Icon(Icons.save),
          //   onPressed: () {},
          //   tooltip: 'Save',
          // ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
            tooltip: 'Share',
          ),
        ],
      ),
    );
  }
}
