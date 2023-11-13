import 'package:flutter/material.dart';
import 'package:mapbeauty/modules/product/domain/models/product.dart';
import 'package:mapbeauty/modules/product/domain/models/product_colors.dart';

class ColorPickerWidget extends StatefulWidget {
  final Product? product;
  final Function(Product, ProductColor) onColorSelected;
  const ColorPickerWidget({
    super.key,
    required this.product,
    required this.onColorSelected,
  });

  @override
  State<ColorPickerWidget> createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  int selectedIndex = 0;

  void onColorSelected(Product product, ProductColor productColor) {
    setState(() {
      selectedIndex = widget.product?.productColors.indexOf(productColor) ?? 0;
    });
    widget.onColorSelected(product, productColor);
  }

  @override
  Widget build(BuildContext context) {
    ScrollController _controller = ScrollController();
    return SafeArea(
      child: SizedBox(
        height: 80,
        child: Scrollbar(
          scrollbarOrientation: ScrollbarOrientation.bottom,
          controller: _controller,
          child: Center(
            child: ListView.separated(
              shrinkWrap: true,
              controller: _controller,
              scrollDirection: Axis.horizontal,
              itemCount: widget.product?.productColors.length ?? 0,
              itemBuilder: (context, index) {
                final productColor = widget.product?.productColors[index];

                return GestureDetector(
                  onTap: () => onColorSelected(
                    widget.product!,
                    productColor!,
                  ),
                  onLongPress: () {
                    print("Long press");
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: productColor?.colorType.color, // HexColor.fromHex(productColor.colorType.color),
                          border: Border.all(
                            width: selectedIndex == index ? 2 : 0.3,
                            color: selectedIndex == index ? Theme.of(context).colorScheme.primary : Colors.grey,
                          ),
                        ),
                      ),
                      Text(
                        productColor?.brandColorName ?? "",
                        style: TextStyle(fontWeight: selectedIndex == index ? FontWeight.bold : FontWeight.normal),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(width: 20);
              },
            ),
          ),
        ),
      ),
    );
  }
}
