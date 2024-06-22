import 'package:flutter/material.dart';

class CanvasScreen extends StatelessWidget {
  const CanvasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              padding: const EdgeInsets.all(16),
              icon: const Icon(Icons.menu),
              onPressed: () {},
              tooltip: 'Menu',
            ),
          ),
          // TODO : Add canvas here
        ],
      ),
    );
  }
}
