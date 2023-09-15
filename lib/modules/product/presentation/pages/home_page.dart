import 'package:flutter/material.dart';
import 'package:mapbeauty/modules/core/utils/app_routes.dart';
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
  List<Brand>? brands;

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadBrands();
    });

    super.initState();
  }

  void loadBrands() async {
    Future.delayed(Duration(seconds: 3));
    brands = await Provider.of<ProductViewModel>(context, listen: false).loadBrands();
    setState(() {});
  }

  void goToProductsPage(Brand brand) async {
    final products = await Provider.of<ProductViewModel>(context, listen: false).loadProducts(brand.id);

    if (mounted) Navigator.of(context).pushNamed(AppRoutes.products, arguments: ProductsPageArgs(brand, products));
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
            Text("1. Selecione a Marca"),
            const SearchBar(hintText: "Pesquisar", leading: Icon(Icons.search)),
            const SizedBox(height: 20),
            Expanded(
                child: GridView.builder(
              itemCount: brands?.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: size.width / 3,
                childAspectRatio: 1,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                final brand = brands?[index];
                if (brand == null) {
                  return Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.black12),
                  );
                }
                return GestureDetector(
                  onTap: () => goToProductsPage(brand),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      //   color: Colors.black,
                      border: Border.all(),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.asset(
                          brand.imageUrl,
                          fit: BoxFit.cover,
                          height: double.infinity,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
