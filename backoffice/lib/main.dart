import 'package:backoffice/modules/core/app_bootstrap.dart';
import 'package:backoffice/modules/core/utils/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppBootstrap.initializeApp();
  String initialRoute = AppBootstrap.getInitialRoute();

  runApp(MapBeautyBackoffice(initialRoute: initialRoute));
}

class MapBeautyBackoffice extends StatelessWidget {
  String initialRoute;
  MapBeautyBackoffice({required this.initialRoute, super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Map Beauty',
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
