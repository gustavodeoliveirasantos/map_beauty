import 'package:backoffice/modules/core/app_bootstrap.dart';
import 'package:backoffice/modules/core/utils/app_routes.dart';
import 'package:backoffice/modules/products/presentation/view_model/brand_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppBootstrap.initializeApp();
  String initialRoute = AppBootstrap.getInitialRoute();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<BrandViewModel>(create: (context) => GetIt.instance<BrandViewModel>()),
  ], child: MapBeautyBackoffice(initialRoute: initialRoute)));
}

class MapBeautyBackoffice extends StatelessWidget {
  String initialRoute;
  MapBeautyBackoffice({required this.initialRoute, super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: GlobalKey(),
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
