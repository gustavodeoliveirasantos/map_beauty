import 'package:flutter/material.dart';
import 'package:mapbeauty/modules/product/presentation/view_model/product_view_model.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../domain/models/color_type.dart';
import '../../domain/models/product.dart';

class ProductsColorComparisonResultArgs {
  final Product product;
  final ColorType colorType;

  ProductsColorComparisonResultArgs(this.product, this.colorType);
}

class ProductsColorComparisonResult extends StatefulWidget {
  final ProductsColorComparisonResultArgs args;

  const ProductsColorComparisonResult({super.key, required this.args});

  @override
  State<ProductsColorComparisonResult> createState() => _ProductsColorComparisonResultState();
}

class _ProductsColorComparisonResultState extends State<ProductsColorComparisonResult> {
  bool isLoading = false;
  List<Product> products = [];
  // final StoreViewModel _viewModel = StoreViewModel();

  @override
  void initState() {
    final viewModel = Provider.of<ProductViewModel>(context, listen: false);
    isLoading = true;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      products = await viewModel.loadSimilarProductsUseCase(widget.args.product, widget.args.colorType);
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  void openProductPage(Product product) async {
    final uri = Uri.parse(product.pageUrl);

    if (!await launchUrl(uri)) {
      throw Exception('Could not launch ${product.pageUrl}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("resultados")),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                strokeWidth: 3.0,
              ),
            )
          : ListView.separated(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    //   tileColor: Colors.amber,
                    leading: Container(
                      color: Colors.blue,
                      height: 80,
                      width: 80,
                      child: const Text("Imagem aqui"),
                    ),
                    title: Text(product.name),
                    subtitle: Text("${product.brand.name}"),
                    trailing: TextButton(
                      child: const Text("Comprar"),
                      onPressed: () => openProductPage(product),
                    ),
                    //   onTap: () => openProductPage(product),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(height: 0.5),
                );
              },
            ),
    );
  }
}
