import 'package:commons/modules/products/domain/models/offer_model.dart';
import 'package:flutter/material.dart';
import 'package:mapbeauty/modules/notifications/pages/notifications_page.dart';
import 'package:mapbeauty/modules/product/presentation/pages/offer_detail_widget.dart';
import 'package:mapbeauty/modules/product/presentation/pages/product_colors_comparison_result.dart';
import 'package:mapbeauty/modules/product/presentation/pages/tab_bar_page.dart';

import '../../product/presentation/pages/find_products_home_page.dart';

class AppRoutes {
  static const onboarding = 'onboarding';
  static const login = 'login';
  static const notifications = 'notifications';
  static const home = '/';
  static const products = "products";
  static const productsColorComparisonResult = "productsColorComparisonResult";
  static const colors = "colors";
  static const offersDetail = "offersDetail";

  static List<Route> generateInitialRoute(String initialRouteName) {
    List<MaterialPageRoute> routes = [];

    if (initialRouteName.contains(AppRoutes.home)) {
      routes.add(
        MaterialPageRoute(
          builder: (context) => const TabBarPage(initialIndex: 0),
        ),
      );
    }

    return routes;
  }

  static MaterialPageRoute<dynamic> onGenerateRoute(RouteSettings settings) {
    late Widget page;

    if (settings.name == AppRoutes.home) {
      // var args = (settings.arguments ?? true) as bool;
      page = TabBarPage(
        initialIndex: 0,
      );
    } else if (settings.name == AppRoutes.notifications) {
      page = const NotificationsPage();
      // }

      // else if (settings.name == AppRoutes.products) {
      //   var args = settings.arguments as ProductsPageArgs;
      //   page = ProductsPage(args: args);
      // } else if (settings.name == AppRoutes.colors) {
      //   // var product = settings.arguments as Product;
      //   // page = ColorsPage(product: product);
    } else if (settings.name == AppRoutes.productsColorComparisonResult) {
      var args = settings.arguments as ProductsColorComparisonResultArgs;
      page = ProductsColorComparisonResult(args: args);
    } else if (settings.name == AppRoutes.offersDetail) {
      var args = settings.arguments as Offer;
      page = OfferDetailPage(offer: args);
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
