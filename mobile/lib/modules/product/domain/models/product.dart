// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:mapbeauty/modules/product/domain/models/product_colors.dart';
import 'package:mapbeauty/modules/product/domain/models/product_type.dart';

import 'brand.dart';

class Product {
  final String id;
  final String name;
  final Brand brand;
  final String? imageUrl;
  final String pageUrl;
  final ProductType productType;

  final List<ProductColor> productColors;

  const Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.imageUrl,
    required this.productType,
    required this.pageUrl,
    required this.productColors,
  });

  String getBrandColorNameFor({required ProductColor selectedColor}) {
    print(123);
    return productColors.firstWhere((element) => element.colorType.id == selectedColor.colorType.id).brandColorName;
  }
}
