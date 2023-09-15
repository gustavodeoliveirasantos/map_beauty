// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:mapbeauty/modules/product/services/dto/product_colors_dto.dart';
import 'package:mapbeauty/modules/product/services/dto/product_type_dto.dart';

import 'brand_dto.dart';

class ProductDTO {
  final String id;
  final String name;
  final ProductTypeDTO productType;
  final String? imageUrl;
  final String pageUrl;
  final List<ProductColorsDTO> productColors;
  const ProductDTO({
    required this.id,
    required this.name,
    required this.productType,
    this.imageUrl,
    required this.pageUrl,
    required this.productColors,
  });

  ProductDTO copyWith({
    String? id,
    String? name,
    ProductTypeDTO? productType,
    String? imageUrl,
    String? pageUrl,
    List<ProductColorsDTO>? productColors,
  }) {
    return ProductDTO(
      id: id ?? this.id,
      name: name ?? this.name,
      productType: productType ?? this.productType,
      imageUrl: imageUrl ?? this.imageUrl,
      pageUrl: pageUrl ?? this.pageUrl,
      productColors: productColors ?? this.productColors,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'productType': productType.toMap(),
      'imageUrl': imageUrl,
      'pageUrl': pageUrl,
      'productColors': productColors.map((x) {
        return x.toMap();
      }).toList(growable: false),
    };
  }

  factory ProductDTO.fromMap(Map<String, dynamic> map) {
    return ProductDTO(
      id: (map["id"] ?? '') as String,
      name: (map["name"] ?? '') as String,
      productType: ProductTypeDTO.fromMap((map["productType"] ?? Map<String, dynamic>.from({})) as Map<String, dynamic>),
      imageUrl: map['imageUrl'] != null ? map["imageUrl"] ?? '' as String : null,
      pageUrl: (map["pageUrl"] ?? '') as String,
      productColors: List<ProductColorsDTO>.from(
        ((map['productColors'] ?? const <ProductColorsDTO>[]) as List).map<ProductColorsDTO>((x) {
          return ProductColorsDTO.fromMap((x ?? Map<String, dynamic>.from({})) as Map<String, dynamic>);
        }),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductDTO.fromJson(String source) => ProductDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductDTO(id: $id, name: $name, productType: $productType, imageUrl: $imageUrl, pageUrl: $pageUrl, productColors: $productColors)';
  }

  @override
  bool operator ==(covariant ProductDTO other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.productType == productType && other.imageUrl == imageUrl && other.pageUrl == pageUrl && listEquals(other.productColors, productColors);
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ productType.hashCode ^ imageUrl.hashCode ^ pageUrl.hashCode ^ productColors.hashCode;
  }
}
