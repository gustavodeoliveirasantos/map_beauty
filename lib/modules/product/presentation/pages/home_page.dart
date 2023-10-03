import 'package:flutter/material.dart';
import 'package:mapbeauty/modules/core/utils/app_routes.dart';
import 'package:mapbeauty/modules/product/presentation/components/stepper_widget.dart';
import 'package:mapbeauty/modules/product/presentation/pages/brands_page.dart';
import 'package:mapbeauty/modules/product/presentation/pages/products_page.dart';
import 'package:mapbeauty/modules/product/presentation/view_model/product_view_model.dart';
import 'package:provider/provider.dart';

import '../../../core/presentation/components/loading_widget.dart';
import '../../../core/presentation/components/main_drawer.dart';
import '../../domain/models/brand.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController(
    initialPage: 0,
    viewportFraction: 1,
    keepPage: true,
  );
  int pageIndex = 0;

  void goToProductsPage(Brand brand) async {
    final products = await Provider.of<ProductViewModel>(context, listen: false).loadProducts(brand.id);

    if (mounted) Navigator.of(context).pushNamed(AppRoutes.products, arguments: ProductsPageArgs(brand, products));

    setState(() {
      pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
      pageIndex = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text("MAP Beauty")),
      drawer: MainDrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            StepperWidget(currentIndex: pageIndex),
            const SearchBar(hintText: "Pesquisar", leading: Icon(Icons.search)),
            const SizedBox(height: 20),
            Expanded(
                child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: pageController,
              children: [
                BrandsPage(onBrandSelected: goToProductsPage),
                BrandsPage(onBrandSelected: goToProductsPage),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
