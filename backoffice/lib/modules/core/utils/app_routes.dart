import 'package:backoffice/modules/offers/presentation/pages/offers_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const login = 'login';
  static const home = '/';
  static const offers = 'offers';

  static List<Route> generateInitialRoute(String initialRouteName) {
    List<MaterialPageRoute> routes = [];

    // if (initialRouteName.contains(AppRoutes.home)) {
    //   routes.add(
    //     MaterialPageRoute(
    //       builder: (context) => const HomePage(),
    //     ),
    //   );
    // }

    return routes;
  }

  static MaterialPageRoute<dynamic> onGenerateRoute(RouteSettings settings) {
    late Widget page;

    if (settings.name == AppRoutes.home) {
      // var args = (settings.arguments ?? true) as bool;
      page = OffersPage();
    }
    // else if (settings.name == AppRoutes.notifications) {
    //   page = const NotificationsPage();

    // } else if (settings.name == AppRoutes.productsColorComparisonResult) {
    //   var args = settings.arguments as ProductsColorComparisonResultArgs;
    //   page = ProductsColorComparisonResult(args: args);
    // }

    return MaterialPageRoute<dynamic>(
      builder: (context) {
        return page;
      },
      settings: settings,
    );
  }
}
