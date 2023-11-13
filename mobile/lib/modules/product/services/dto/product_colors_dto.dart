// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:mapbeauty/modules/product/services/dto/color_type_dto.dart';

class ProductColorDTO {
  final int id;
  final String brandColorName;
  final ColorTypeDTO colorType;
  final String buyUrl;
  final String colorHex;
  final List<String>? images;
  const ProductColorDTO({
    required this.id,
    required this.brandColorName,
    required this.colorType,
    required this.buyUrl,
    required this.colorHex,
    required this.images,
  });

  ProductColorDTO copyWith({
    int? id,
    String? brandColorName,
    ColorTypeDTO? colorType,
    String? buyUrl,
    String? colorHex,
    List<String>? images,
  }) {
    return ProductColorDTO(
      id: id ?? this.id,
      brandColorName: brandColorName ?? this.brandColorName,
      colorType: colorType ?? this.colorType,
      buyUrl: buyUrl ?? this.buyUrl,
      colorHex: colorHex ?? this.colorHex,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'brandColorName': brandColorName,
      'colorType': colorType.toMap(),
      'buyUrl': buyUrl,
      'colorHex': colorHex,
      'images': images,
    };
  }

  factory ProductColorDTO.fromMap(Map<String, dynamic> map) {
    return ProductColorDTO(
      id: (map["id"] ?? 0) as int,
      brandColorName: (map["brandColorName"] ?? '') as String,
      colorType: ColorTypeDTO.fromMap((map["colorType"] ?? Map<String, dynamic>.from({})) as Map<String, dynamic>),
      buyUrl: (map["buyUrl"] ?? '') as String,
      colorHex: (map["colorHex"] ?? '') as String,
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
    return 'ProductColorDTO(id: $id, brandColorName: $brandColorName, colorType: $colorType, buyUrl: $buyUrl, colorHex: $colorHex, images: $images)';
  }

  @override
  bool operator ==(covariant ProductColorDTO other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.id == id && other.brandColorName == brandColorName && other.colorType == colorType && other.buyUrl == buyUrl && other.colorHex == colorHex && listEquals(other.images, images);
  }

  @override
  int get hashCode {
    return id.hashCode ^ brandColorName.hashCode ^ colorType.hashCode ^ buyUrl.hashCode ^ colorHex.hashCode ^ images.hashCode;
  }
}
