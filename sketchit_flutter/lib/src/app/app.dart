import 'package:flutter/material.dart';

import 'routes/routes.dart';
import 'theme/theme.dart';

class SketchitApp extends StatelessWidget {
  const SketchitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Sketch It!',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      routerDelegate: AppRouter.router.routerDelegate,
      routeInformationParser: AppRouter.router.routeInformationParser,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
    );
  }
}
