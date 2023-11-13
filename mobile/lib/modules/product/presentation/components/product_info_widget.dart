import 'package:commons/modules/firebase_service/firebase_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:mapbeauty/modules/product/domain/models/product.dart';
import 'package:mapbeauty/modules/product/domain/models/product_colors.dart';
import 'package:mapbeauty/modules/product/presentation/components/firebase_storage_image_widget.dart';

class ProductInfoWidget extends StatelessWidget {
  final Product product;
  final ProductColor productColor;
  final bool isProductInfoHidden;
  const ProductInfoWidget({
    super.key,
    required this.isProductInfoHidden,
    required this.product,
    required this.productColor,
  });

  @override
  Widget build(BuildContext context) {
    const animationDuration = Duration(milliseconds: 300);
    return AnimatedSize(
      duration: animationDuration,
      child: AnimatedOpacity(
        duration: animationDuration,
        opacity: isProductInfoHidden ? 0 : 1,
        child: SizedBox(
          height: isProductInfoHidden ? 0 : 110,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.brand.name,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
                    ),
                    Text(
                      product.name,
                      maxLines: 2,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w200, color: Colors.black),
                    ),
                    Row(
                      children: [
                        const Text(
                          "Cor: ",
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
                        ),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: productColor.colorType.color, // HexColor.fromHex(productColor.colorType.color),
                            border: Border.all(width: 0.3),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          productColor.brandColorName,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w200, color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: FirebaseStorageImageWidget(
                    imageName: product.imageUrl,
                    imageFolder: ImageFolder.product,
                    height: 100,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
