import 'package:get_it/get_it.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:sketchit_client/sketchit_client.dart';

var sl = GetIt.instance;

void serviceLocator() {
  sl.registerSingleton<Client>(Client(
    'http://$localhost:8080/',
  )..connectivityMonitor = FlutterConnectivityMonitor());
}
