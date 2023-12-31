import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mapbeauty/modules/core/utils/extensions.dart';
import 'package:mapbeauty/modules/product/presentation/view_model/offer_view_model.dart';
import 'package:provider/provider.dart';
import 'package:mapbeauty/modules/product/presentation/view_model/product_view_model.dart';

import 'modules/core/app_bootstrap.dart';
import 'modules/core/utils/app_routes.dart';

GlobalKey<NavigatorState>? globalKey = GlobalKey();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppBootstrap.initializeApp();

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
        ChangeNotifierProvider(create: (context) => GetIt.instance<ProductViewModel>()),
        ChangeNotifierProvider(create: (context) => GetIt.instance<OfferViewModel>()),
      ],
      child: MaterialApp(
        navigatorKey: globalKey,
        title: 'Map Beauty',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          //   textTheme: GoogleFonts.bellezaTextTheme(),
          colorScheme: ColorScheme.fromSeed(seedColor: HexColor("#C143A6")).copyWith(primary: HexColor("#C143A6")),
          useMaterial3: true,
        ),
        initialRoute: initialRoute,
        onGenerateRoute: (settings) => AppRoutes.onGenerateRoute(settings),
        onGenerateInitialRoutes: (initialRoute) => AppRoutes.generateInitialRoute(initialRoute),
      ),
    );
  }
}
