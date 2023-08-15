import 'package:flutter/material.dart';

import 'modules/core/app_bootstrap.dart';
import 'modules/core/utils/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppBootstrap.initializeApp();
  String initialRoute = AppBootstrap.getInitialRoute();

  runApp(MapBeautyApp(initialRoute: initialRoute));
}

class MapBeautyApp extends StatelessWidget {
  String initialRoute;
  MapBeautyApp({required this.initialRoute, super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),
      initialRoute: initialRoute,
      onGenerateRoute: (settings) => AppRoutes.onGenerateRoute(settings),
      onGenerateInitialRoutes: (initialRoute) => AppRoutes.generateInitialRoute(initialRoute),
    );
  }
}
