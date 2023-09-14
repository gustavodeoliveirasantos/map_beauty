import 'package:flutter/material.dart';
import 'package:mapbeauty/modules/product/domain/models/product.dart';

class ProductsPage extends StatefulWidget {
  final List<Product> products;
  const ProductsPage({super.key, required this.products});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
