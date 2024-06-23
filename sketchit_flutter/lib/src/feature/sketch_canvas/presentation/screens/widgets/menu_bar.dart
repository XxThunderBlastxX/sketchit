import 'package:flutter/material.dart';

class MenuBar extends StatelessWidget {
  const MenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.color_lens),
          onPressed: () {},
          // onPressed: () async {
          //   Color? color = await showDialog(
          //     context: context,
          //     builder: (context) => ColorPickerDialog(),
          //   );
          //   if (color != null) {
          //     context.read<DrawingBloc>().add(ChangeColor(color));
          //   }
          // },
        ),
        IconButton(
          icon: Icon(Icons.brush),
          onPressed: () {},
          // onPressed: () async {
          //   double? strokeWidth = await showDialog(
          //     context: context,
          //     builder: (context) => StrokeWidthDialog(),
          //   );
          //   if (strokeWidth != null) {
          //     context.read<DrawingBloc>().add(ChangeStrokeWidth(strokeWidth));
          //   }
          // },
        ),
      ],
    );
  }
}

// class ColorPickerDialog extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text('Pick a color'),
//       content: SingleChildScrollView(
//         child: BlockPicker(
//           pickerColor: Colors.black,
//           onColorChanged: (color) {
//             Navigator.of(context).pop(color);
//           },
//         ),
//       ),
//     );
//   }
// }
//
// class StrokeWidthDialog extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     double strokeWidth = 2.0;
//
//     return AlertDialog(
//       title: Text('Select Stroke Width'),
//       content: Slider(
//         value: strokeWidth,
//         min: 1.0,
//         max: 10.0,
//         onChanged: (value) {
//           strokeWidth = value;
//         },
//       ),
//       actions: [
//         TextButton(
//           onPressed: () {
//             Navigator.of(context).pop(strokeWidth);
//           },
//           child: Text('OK'),
//         ),
//       ],
//     );
//   }
// }
