import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../feature/sketch_canvas/presentation/screens/sketch_canvas_screen.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        path: "/",
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const CanvasScreen(),
        ),
      )
    ],
  );
}
