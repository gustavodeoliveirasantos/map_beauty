import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../make_up_search/presentation/pages/home_page.dart';

class AppRoutes {
  static const onboarding = 'onboarding';
  static const login = 'login';
  static const home = '/';

  static List<Route> generateInitialRoute(String initialRouteName) {
    List<MaterialPageRoute> routes = [];

    if (initialRouteName.contains(AppRoutes.home)) {
      routes.add(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    }

    return routes;
  }

  static MaterialPageRoute<dynamic> onGenerateRoute(RouteSettings settings) {
    late Widget page;

    if (settings.name == AppRoutes.home) {
      // var args = (settings.arguments ?? true) as bool;
      page = HomePage();
    }
    // else if (settings.name == AppRoutes.login) {
    //   page = LoginPage();
    // } else if (settings.name == AppRoutes.home) {
    //   page = RestaurantListPage();
    // } else if (settings.name == AppRoutes.restauranteDetail) {
    //   page = RestaurantDetailPage();
    // }

    return MaterialPageRoute<dynamic>(
      builder: (context) {
        return page;
      },
      settings: settings,
    );
  }
}
