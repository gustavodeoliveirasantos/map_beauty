import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mapbeauty/modules/product/presentation/view_model/product_view_model.dart';

import 'modules/core/app_bootstrap.dart';
import 'modules/core/utils/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppBootstrap.initializeApp();
  String initialRoute = AppBootstrap.getInitialRoute();

  runApp(DevicePreview(
    enabled: !kReleaseMode && kIsWeb,
    tools: const [
      ...DevicePreview.defaultTools,
      // const CustomPlugin(),
    ],
    builder: (context) {
      return MapBeautyApp(initialRoute: initialRoute);
    },
  ));

  // runApp(MapBeautyApp(initialRoute: initialRoute));
}

class MapBeautyApp extends StatelessWidget {
  String initialRoute;
  MapBeautyApp({required this.initialRoute, super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductViewModel()),
      ],
      child: MaterialApp(
        title: 'Map Beauty',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          //   textTheme: GoogleFonts.bellezaTextTheme(),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
          useMaterial3: true,
        ),
        initialRoute: initialRoute,
        onGenerateRoute: (settings) => AppRoutes.onGenerateRoute(settings),
        onGenerateInitialRoutes: (initialRoute) => AppRoutes.generateInitialRoute(initialRoute),
      ),
    );
  }
}
