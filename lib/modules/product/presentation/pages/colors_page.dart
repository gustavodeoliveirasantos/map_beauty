// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mapbeauty/modules/core/utils/app_routes.dart';

import 'package:mapbeauty/modules/product/domain/models/product.dart';
import 'package:mapbeauty/modules/product/presentation/pages/product_colors_comparison_result.dart';

import '../../domain/models/color_type.dart';

class ColorsPage extends StatefulWidget {
  final Product product;
  const ColorsPage({super.key, required this.product});

  @override
  State<ColorsPage> createState() => _ColorsPageState();
}

class _ColorsPageState extends State<ColorsPage> {
  void goToProductColorComparisonResult(ColorType colorType) {
    Navigator.of(context).pushNamed(AppRoutes.productsColorComparisonResult, arguments: ProductsColorComparisonResultArgs(widget.product, colorType));
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
            const Text("3. Selecione a Cor"),
            // const SearchBar(hintText: "Pesquisar", leading: Icon(Icons.search)),
            const SizedBox(height: 20),
            Expanded(
                child: GridView.builder(
              itemCount: widget.product.productColors.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: size.width / 3,
                mainAxisExtent: size.width / 3,
                childAspectRatio: 0.9,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                final productColor = widget.product.productColors[index];

                return GestureDetector(
                  onTap: () => goToProductColorComparisonResult(productColor.colorType),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: productColor.colorType.color, // HexColor.fromHex(productColor.colorType.color),
                          border: Border.all(),
                        ),
                      ),
                      Text(productColor.brandColorName),
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
