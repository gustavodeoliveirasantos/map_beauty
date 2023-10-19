// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:mapbeauty/modules/product/services/dto/color_type_dto.dart';

class ProductColorDTO {
  final String id;
  final String brandColorName;
  final ColorTypeDTO colorType;
  final String buyUrl;
  final List<String>? images;
  const ProductColorDTO({
    required this.id,
    required this.brandColorName,
    required this.colorType,
    required this.buyUrl,
    required this.images,
  });

  ProductColorDTO copyWith({
    String? id,
    String? brandColorName,
    ColorTypeDTO? colorType,
    String? buyUrl,
    List<String>? images,
  }) {
    return ProductColorDTO(
      id: id ?? this.id,
      brandColorName: brandColorName ?? this.brandColorName,
      colorType: colorType ?? this.colorType,
      buyUrl: buyUrl ?? this.buyUrl,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'brandColorName': brandColorName,
      'colorType': colorType.toMap(),
      'buyUrl': buyUrl,
      'images': images,
    };
  }

  factory ProductColorDTO.fromMap(Map<String, dynamic> map) {
    return ProductColorDTO(
      id: (map["id"] ?? '') as String,
      brandColorName: (map["brandColorName"] ?? '') as String,
      colorType: ColorTypeDTO.fromMap((map["colorType"] ?? Map<String, dynamic>.from({})) as Map<String, dynamic>),
      buyUrl: (map["buyUrl"] ?? '') as String,
      images: map['images'] != null
          ? List<String>.from(
              ((map['images']) as List<String>),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductColorDTO.fromJson(String source) => ProductColorDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductColorDTO(id: $id, brandColorName: $brandColorName, colorType: $colorType, buyUrl: $buyUrl, images: $images)';
  }

  @override
  bool operator ==(covariant ProductColorDTO other) {
    if (identical(this, other)) return true;

    return other.id == id && other.brandColorName == brandColorName && other.colorType == colorType && other.buyUrl == buyUrl && listEquals(other.images, images);
  }

  @override
  int get hashCode {
    return id.hashCode ^ brandColorName.hashCode ^ colorType.hashCode ^ buyUrl.hashCode ^ images.hashCode;
  }
}
