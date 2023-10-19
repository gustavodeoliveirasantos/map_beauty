// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mapbeauty/firebase/firebase_storage_service.dart';

import 'package:mapbeauty/modules/product/domain/models/product.dart';
import 'package:mapbeauty/modules/product/domain/models/product_colors.dart';
import 'package:mapbeauty/modules/product/presentation/components/color_picker_widget.dart';
import 'package:mapbeauty/modules/product/presentation/components/firebase_storage_image_widget.dart';
import 'package:mapbeauty/modules/product/presentation/components/product_color_images_widget.dart';

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
  ProductColor? selectedProductColor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedProductColor = widget.product?.productColors[0];
    print(selectedProductColor?.images?.length);
  }

  @override
  void didUpdateWidget(covariant ColorsPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (mounted) {
      setState(() {
        selectedProductColor = widget.product?.productColors[0];
      });
    }
    print("didUpdateWidget");
  }

  onColorSelected(Product product, ProductColor productColor) {
    print(productColor.brandColorName);
    setState(() {
      selectedProductColor = productColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          final ScrollDirection direction = notification.direction;
          widget.didScroll(direction);
          print("GOS  $direction");
          return true;
        },
        child: ListView(
          children: [
            Text(
              widget.product?.brand.name ?? "",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
            ),
            Text(
              widget.product?.name ?? "",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),
            ),
            const SizedBox(height: 20),
            ProductColorImagesWidget(images: selectedProductColor?.images),
            const SizedBox(height: 20),
            ColorPickerWidget(
              product: widget.product,
              onColorSelected: onColorSelected,
            ),
            Center(
                child: ElevatedButton(
                    onPressed: () {
                      widget.onColorSelected(widget.product!, selectedProductColor!);
                    },
                    child: const Text("Continuar"))),
          ],
        ),
      ),
    );
  }
}
