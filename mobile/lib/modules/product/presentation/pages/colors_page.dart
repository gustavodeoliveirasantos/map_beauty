// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mapbeauty/modules/core/utils/app_routes.dart';
import 'package:mapbeauty/modules/product/domain/models/brand.dart';

import 'package:mapbeauty/modules/product/domain/models/product.dart';
import 'package:mapbeauty/modules/product/domain/models/product_colors.dart';
import 'package:mapbeauty/modules/product/presentation/pages/product_colors_comparison_result.dart';

import '../../domain/models/color_type.dart';

class ColorsPage extends StatefulWidget {
  // final Brand? brand;
  final Product? product;
  final Function(Product, ProductColor) onColorSelected;
  final Function(ScrollDirection direction) didScroll;
  const ColorsPage({
    super.key,
    required this.product,
    required this.onColorSelected,
    required this.didScroll,
  });

  @override
  State<ColorsPage> createState() => _ColorsPageState();
}

class _ColorsPageState extends State<ColorsPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.product?.brand.name ?? "",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          Text(
            widget.product?.name ?? "",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.black),
          ),
          // const SearchBar(hintText: "Pesquisar", leading: Icon(Icons.search)),
          const SizedBox(height: 20),
          Expanded(
              child: NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              widget.didScroll(direction);
              return true;
            },
            child: GridView.builder(
              itemCount: widget.product?.productColors.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: size.width / 3,
                mainAxisExtent: size.width / 3,
                childAspectRatio: 0.9,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                final productColor = widget.product?.productColors[index];

                return GestureDetector(
                  onTap: () => widget.onColorSelected(
                    widget.product!,
                    productColor!,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: productColor?.colorType.color ?? Colors.white, // HexColor.fromHex(productColor.colorType.color),
                          border: Border.all(width: 0.3),
                        ),
                      ),
                      Text(productColor?.brandColorName ?? ""),
                    ],
                  ),
                );
              },
            ),
          ))
        ],
      ),
    );
  }
}
