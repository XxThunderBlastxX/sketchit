import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:sketchit_client/sketchit_client.dart';

import '../utils/custom_cursor.dart';

var sl = GetIt.instance;

Future<void> serviceLocator() async {
  sl.registerSingleton<Client>(Client(
    'http://$localhost:8080/',
  )..connectivityMonitor = FlutterConnectivityMonitor());

  kIsWeb ? await _initSystemCursor() : () {};
}

Future<void> _initSystemCursor() async {
  final customCursor = CustomCursor();
  await customCursor.init();
  sl.registerSingleton<CustomCursor>(customCursor);
}
