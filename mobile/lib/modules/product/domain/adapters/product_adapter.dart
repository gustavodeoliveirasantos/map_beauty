// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:mapbeauty/modules/core/domain/adapter.dart';
import 'package:mapbeauty/modules/core/utils/extensions.dart';
import 'package:mapbeauty/modules/product/domain/models/product_type.dart';

import '../../services/dto/product_dto.dart';
import '../models/brand.dart';
import '../models/color_type.dart';
import '../models/product.dart';
import '../models/product_colors.dart';

class ProductAdapterInput {
  final ProductDTO dto;
  final Brand brand;
  const ProductAdapterInput({
    required this.dto,
    required this.brand,
  });
}

class ProductAdapter implements Adapter<Product, ProductAdapterInput> {
  @override
  Product adapt(ProductAdapterInput input) {
    return Product(
      id: input.dto.id,
      name: input.dto.name,
      brand: input.brand,
      imageUrl: input.dto.imageName,
      pageUrl: input.dto.pageUrl,
      productType: ProductType(id: input.dto.productType.id, type: input.dto.productType.type),
      productColors: input.dto.productColors.map((e) {
        return ProductColor(e.id, e.brandColorName, ColorType(id: e.colorType.id, colorName: e.colorType.colorName, color: HexColor(e.colorType.hexCode)), e.buyUrl, e.imageName);
      }).toList(),
    );
  }
}
