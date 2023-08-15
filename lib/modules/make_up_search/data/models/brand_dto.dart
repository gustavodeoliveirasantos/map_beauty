// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:mapbeauty/modules/make_up_search/data/models/product_dto.dart';

class BrandDTO {
  final String id;
  final String name;
  final String imageUrl;
  final List<ProductDTO> products;
  const BrandDTO({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.products,
  });

  BrandDTO copyWith({
    String? id,
    String? name,
    String? imageUrl,
    List<ProductDTO>? products,
  }) {
    return BrandDTO(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      products: products ?? this.products,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'products': products.map((x) {
        return x.toMap();
      }).toList(growable: false),
    };
  }

  factory BrandDTO.fromMap(Map<String, dynamic> map) {
    return BrandDTO(
      id: (map["id"] ?? '') as String,
      name: (map["name"] ?? '') as String,
      imageUrl: (map["imageUrl"] ?? '') as String,
      products: List<ProductDTO>.from(
        ((map['products'] ?? const <ProductDTO>[]) as List).map<ProductDTO>((x) {
          return ProductDTO.fromMap((x ?? Map<String, dynamic>.from({})) as Map<String, dynamic>);
        }),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory BrandDTO.fromJson(String source) => BrandDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BrandDTO(id: $id, name: $name, imageUrl: $imageUrl, products: $products)';
  }

  @override
  bool operator ==(covariant BrandDTO other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.imageUrl == imageUrl && listEquals(other.products, products);
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ imageUrl.hashCode ^ products.hashCode;
  }
}
