// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mapbeauty/modules/core/utils/app_routes.dart';

import 'package:mapbeauty/modules/product/domain/models/product.dart';

import '../../domain/models/brand.dart';

class ProductsPageArgs {
  final Brand brand;
  final List<Product> products;

  ProductsPageArgs(this.brand, this.products);
}

class ProductsPage extends StatefulWidget {
  final ProductsPageArgs args;

  const ProductsPage({super.key, required this.args});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  void goToColorsPage(Product product) {
    Navigator.of(context).pushNamed(AppRoutes.colors, arguments: product);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text("MAP Beauty")),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const Text("2. Selecione o Produto"),
            const SearchBar(hintText: "Pesquisar", leading: Icon(Icons.search)),
            const SizedBox(height: 20),
            Expanded(
                child: GridView.builder(
              itemCount: widget.args.products.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: size.width / 3,
                childAspectRatio: 0.9,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                final product = widget.args.products[index];

                return GestureDetector(
                  onTap: () => goToColorsPage(product),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          //   color: Colors.black,
                          border: Border.all(),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: product.imageUrl == null
                              ? Container(
                                  height: 80,
                                  color: Colors.amber,
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: Image.asset(
                                    product.imageUrl!,
                                    fit: BoxFit.cover,
                                    height: double.infinity,
                                    width: double.infinity,
                                  ),
                                ),
                        ),
                      ),
                      Text(product.name),
                    ],
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
