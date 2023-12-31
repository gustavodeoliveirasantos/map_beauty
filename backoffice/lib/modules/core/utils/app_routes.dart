import 'package:backoffice/modules/authentication/presentation/pages/login_page.dart';
import 'package:backoffice/modules/core/presentation/pages/home_page.dart';
import 'package:backoffice/modules/products/presentation/pages/brands_page.dart';
import 'package:backoffice/modules/products/presentation/pages/offers_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const login = 'login';
  static const home = '/';
  static const offers = 'offers';
  static const brands = 'brands';

  static List<Route> generateInitialRoute(String initialRouteName) {
    List<MaterialPageRoute> routes = [];

    if (initialRouteName.contains(AppRoutes.home)) {
      routes.add(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } else if (initialRouteName.contains(AppRoutes.login)) {
      routes.add(
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
    } else if (initialRouteName.contains(AppRoutes.brands)) {
      routes.add(
        MaterialPageRoute(
          builder: (context) => const BrandsPage(),
        ),
      );
    } else if (initialRouteName.contains(AppRoutes.offers)) {
      routes.add(
        MaterialPageRoute(
          builder: (context) => const OffersPage(),
        ),
      );
    }

    return routes;
  }

  static MaterialPageRoute<dynamic> onGenerateRoute(RouteSettings settings) {
    late Widget page;

    if (settings.name == AppRoutes.home) {
      page = const HomePage();
    } else if (settings.name == AppRoutes.login) {
      page = const LoginPage();
    } else if (settings.name == AppRoutes.offers) {
      page = const OffersPage();
    } else if (settings.name == AppRoutes.brands) {
      page = const BrandsPage();
    }

    return MaterialPageRoute<dynamic>(
      builder: (context) {
        return page;
      },
      settings: settings,
    );
  }
}
