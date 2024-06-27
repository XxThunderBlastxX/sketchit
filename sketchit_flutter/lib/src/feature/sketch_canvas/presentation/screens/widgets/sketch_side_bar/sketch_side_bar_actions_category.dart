import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/sketch_bloc/sketch_bloc.dart';
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
            tooltip: 'Undo',
            onPressed: () => context.read<SketchBloc>().add(UndoSketch()),
          ),
          IconButton(
            icon: const Icon(Icons.redo),
            tooltip: 'Redo',
            onPressed: () => context.read<SketchBloc>().add(RedoSketch()),
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            tooltip: 'Clear',
            onPressed: () => context.read<SketchBloc>().add(ClearSketch()),
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
