import 'package:mapbeauty/modules/product/domain/models/product_colors.dart';
import 'package:mapbeauty/modules/product/domain/models/product_type.dart';

import 'brand.dart';

class Product {
  final String id;
  final String name;
  final Brand brand;
  final ProductType productType;
  final List<ProductColors> productColors;

  const Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.productType,
    required this.productColors,
  });
}
