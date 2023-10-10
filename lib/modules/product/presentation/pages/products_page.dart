// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mapbeauty/modules/core/utils/app_routes.dart';

import 'package:mapbeauty/modules/product/domain/models/product.dart';

import '../../domain/models/brand.dart';

class ProductsPageArgs {
  final Brand? brand;
  final List<Product>? products;
  final Function(Product?) onProductSelected;
  ProductsPageArgs({
    required this.brand,
    required this.products,
    required this.onProductSelected,
  });
}

class ProductsPage extends StatefulWidget {
  final ProductsPageArgs args;

  const ProductsPage({super.key, required this.args});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.args.brand?.name ?? "",
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 10),
        Expanded(
            child: GridView.builder(
          itemCount: widget.args.products?.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 0.75,
            mainAxisSpacing: 10,
            crossAxisSpacing: 20,
          ),
          itemBuilder: (context, index) {
            final product = widget.args.products?[index];

            return GestureDetector(
              onTap: () => widget.args.onProductSelected(product),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      //   color: Colors.black,
                      border: Border.all(width: 0.3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: product?.imageUrl == null
                          ? Container(
                              //    height: 80,
                              color: Colors.amber,
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Image.asset(
                                product?.imageUrl! ?? "",
                                fit: BoxFit.cover,
                                //  height: double.infinity,
                                //   width: double.infinity,
                              ),
                            ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "${product?.productType.type ?? ""}: ${product?.name ?? ""}",
                        maxLines: 2,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ))
      ],
    );
  }
}
