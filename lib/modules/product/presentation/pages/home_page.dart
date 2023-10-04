import 'package:flutter/material.dart';
import 'package:mapbeauty/modules/core/utils/app_routes.dart';
import 'package:mapbeauty/modules/product/domain/models/color_type.dart';
import 'package:mapbeauty/modules/product/domain/models/product.dart';
import 'package:mapbeauty/modules/product/presentation/components/stepper_widget.dart';
import 'package:mapbeauty/modules/product/presentation/pages/brands_page.dart';
import 'package:mapbeauty/modules/product/presentation/pages/colors_page.dart';
import 'package:mapbeauty/modules/product/presentation/pages/product_colors_comparison_result.dart';
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
  Brand? selectedBrand;
  List<Product> products = [];
  Product? selectedProduct;
  Color? selectedColor;
  int pageIndex = 0;
  int stepsOpened = 1;

  PageController pageController = PageController(
    initialPage: 0,
    viewportFraction: 1,
    //  keepPage: true,
  );

  void onBrandSelected(Brand brand) async {
    selectedBrand = brand;
    products = await Provider.of<ProductViewModel>(context, listen: false).loadProducts(brand.id);

    // if (mounted) Navigator.of(context).pushNamed(AppRoutes.products, arguments: ProductsPageArgs(brand, products));

    setState(() {
      pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.decelerate);
      stepsOpened = 2;
      goToPage(1);
    });
  }

  void onProductSelected(Product? product) {
    // Navigator.of(context).pushNamed(AppRoutes.colors, arguments: product);
    selectedProduct = product;
    selectedColor = null;
    stepsOpened = 3;
    goToPage(2);
  }

  void onColorSelected(Product product, ColorType colorType) {
    Navigator.of(context).pushNamed(AppRoutes.productsColorComparisonResult, arguments: ProductsColorComparisonResultArgs(product, colorType));
  }

  void goToPage(int index) {
    print("index $index");
    print("pageIndex $pageIndex");

    final dif = pageIndex - index;

    if (dif == 2 || dif == -2) {
      pageController.jumpToPage(index);
    } else if (pageIndex > index) {
      pageController.previousPage(duration: const Duration(milliseconds: 400), curve: Curves.decelerate);
    } else if (pageIndex < index) {
      pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.decelerate);
    }
    if (pageIndex != index) {
      pageIndex = index;
      setState(() {});
    }
  }

  onStepperSelected(int index) {
    goToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: const Text("MAP Beauty")),
      drawer: MainDrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            StepperWidget(
              currentIndex: pageIndex,
              stepsOpened: stepsOpened,
              onTap: onStepperSelected,
            ),
            //      const SearchBar(hintText: "Pesquisar", leading: Icon(Icons.search)),
            const SizedBox(height: 20),
            Expanded(
                child: PageView(
              //  physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              children: [
                BrandsPage(onBrandSelected: onBrandSelected),
                ProductsPage(args: ProductsPageArgs(products: products, onProductSelected: onProductSelected)),
                ColorsPage(product: selectedProduct, onColorSelected: onColorSelected)
              ],
            ))
          ],
        ),
      ),
    );
  }
}
