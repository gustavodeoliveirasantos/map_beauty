import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mapbeauty/modules/core/utils/app_routes.dart';
import 'package:mapbeauty/modules/product/domain/models/product.dart';
import 'package:mapbeauty/modules/product/domain/models/product_colors.dart';
import 'package:mapbeauty/modules/product/presentation/components/map_beauty_logo_widget.dart';
import 'package:mapbeauty/modules/product/presentation/components/stepper_widget.dart';
import 'package:mapbeauty/modules/product/presentation/pages/brands_page.dart';
import 'package:mapbeauty/modules/product/presentation/pages/colors_page.dart';
import 'package:mapbeauty/modules/product/presentation/pages/product_colors_comparison_result.dart';
import 'package:mapbeauty/modules/product/presentation/pages/products_page.dart';
import 'package:mapbeauty/modules/product/presentation/view_model/product_view_model.dart';
import 'package:provider/provider.dart';
import '../../../core/presentation/components/main_drawer.dart';
import '../../domain/models/brand.dart';

class FindProductsHomePage extends StatefulWidget {
  const FindProductsHomePage({super.key});

  @override
  State<FindProductsHomePage> createState() => _FindProductsHomePageState();
}

class _FindProductsHomePageState extends State<FindProductsHomePage> {
  //TODO: https://docs.flutter.dev/cookbook/effects/shimmer-loading
  Brand? selectedBrand;
  List<Product> products = [];
  Product? selectedProduct;

  Color? selectedColor;
  int pageIndex = 0;
  int stepsOpened = 1;
  bool isStepBarHidden = false;

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

  void onColorSelected(Product product, ProductColor productColor) {
    Navigator.of(context).pushNamed(AppRoutes.productsColorComparisonResult, arguments: ProductsColorComparisonResultArgs(product, productColor));
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

  void onPageChanged(int index) {
    setState(() {
      //   pageIndex = index;
      isStepBarHidden = false;
    });
  }

  didScroll(ScrollDirection direction) {
    // print(offset);
    if (direction == ScrollDirection.reverse) {
      setState(() => isStepBarHidden = true);
    } else if (direction == ScrollDirection.forward) {
      setState(() => isStepBarHidden = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: MapBeautyLogoWidget(),
          ),
          StepperWidget(
            currentIndex: pageIndex,
            stepsOpened: stepsOpened,
            onTap: onStepperSelected,
            isHidden: isStepBarHidden,
          ),
          //      const SearchBar(hintText: "Pesquisar", leading: Icon(Icons.search)),
          SizedBox(height: isStepBarHidden ? 0 : 20),
          Expanded(
              child: PageView(
            onPageChanged: onPageChanged,
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: [
              BrandsPage(onBrandSelected: onBrandSelected, didScroll: didScroll),
              ProductsPage(args: ProductsPageArgs(brand: selectedBrand, products: products, onProductSelected: onProductSelected, didScroll: didScroll)),
              ColorsPage(product: selectedProduct, onColorSelected: onColorSelected, didScroll: didScroll)
            ],
          ))
        ],
      ),
    );
  }
}
