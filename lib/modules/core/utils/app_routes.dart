import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mapbeauty/modules/notifications/pages/notifications_page.dart';
import 'package:mapbeauty/modules/product/presentation/pages/products_page.dart';

import '../../product/domain/models/product.dart';
import '../../product/presentation/pages/home_page.dart';

class AppRoutes {
  static const onboarding = 'onboarding';
  static const login = 'login';
  static const notifications = 'notifications';
  static const home = '/';
  static const productsPage = "products";

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
    } else if (settings.name == AppRoutes.notifications) {
      page = NotificationsPage();
    } else if (settings.name == AppRoutes.productsPage) {
      var args = settings.arguments as List<Product>;
      page = ProductsPage(products: args);
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
