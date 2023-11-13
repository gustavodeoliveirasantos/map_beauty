// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:mapbeauty/modules/product/services/dto/product_dto.dart';

class BrandDTO {
  final int id;
  final String name;
  final String? imageName;
  final List<ProductDTO> products;
  const BrandDTO({
    required this.id,
    required this.name,
    required this.imageName,
    required this.products,
  });

  BrandDTO copyWith({
    int? id,
    String? name,
    String? imageName,
    List<ProductDTO>? products,
  }) {
    return BrandDTO(
      id: id ?? this.id,
      name: name ?? this.name,
      imageName: imageName ?? this.imageName,
      products: products ?? this.products,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'imageName': imageName,
      'products': products.map((x) {
        return x.toMap();
      }).toList(growable: false),
    };
  }

  factory BrandDTO.fromMap(Map<String, dynamic> map) {
    return BrandDTO(
      id: (map["id"] ?? 0) as int,
      name: (map["name"] ?? '') as String,
      imageName: map['imageName'] != null ? map["imageName"] ?? '' : null,
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
    return 'BrandDTO(id: $id, name: $name, imageName: $imageName, products: $products)';
  }

  @override
  bool operator ==(covariant BrandDTO other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.id == id && other.name == name && other.imageName == imageName && listEquals(other.products, products);
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ imageName.hashCode ^ products.hashCode;
  }
}
