// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:mapbeauty/modules/product/services/dto/color_type_dto.dart';

class ProductColorDTO {
  final String id;
  final String brandColorName;
  final ColorTypeDTO colorType;
  final String buyUrl;
  final String? imageName;
  const ProductColorDTO({
    required this.id,
    required this.brandColorName,
    required this.colorType,
    required this.buyUrl,
    this.imageName,
  });

  ProductColorDTO copyWith({
    String? id,
    String? brandColorName,
    ColorTypeDTO? colorType,
    String? buyUrl,
    String? imageUrl,
  }) {
    return ProductColorDTO(
      id: id ?? this.id,
      brandColorName: brandColorName ?? this.brandColorName,
      colorType: colorType ?? this.colorType,
      buyUrl: buyUrl ?? this.buyUrl,
      imageName: imageUrl ?? this.imageName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'brandColorName': brandColorName,
      'colorType': colorType.toMap(),
      'buyUrl': buyUrl,
      'imageUrl': imageName,
    };
  }

  factory ProductColorDTO.fromMap(Map<String, dynamic> map) {
    return ProductColorDTO(
      id: (map["id"] ?? '') as String,
      brandColorName: (map["brandColorName"] ?? '') as String,
      colorType: ColorTypeDTO.fromMap((map["colorType"] ?? Map<String, dynamic>.from({})) as Map<String, dynamic>),
      buyUrl: (map["buyUrl"] ?? '') as String,
      imageName: map['imageUrl'] != null ? map["imageUrl"] ?? '' as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductColorDTO.fromJson(String source) => ProductColorDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductColorDTO(id: $id, brandColorName: $brandColorName, colorType: $colorType, buyUrl: $buyUrl, imageUrl: $imageName)';
  }

  @override
  bool operator ==(covariant ProductColorDTO other) {
    if (identical(this, other)) return true;

    return other.id == id && other.brandColorName == brandColorName && other.colorType == colorType && other.buyUrl == buyUrl && other.imageName == imageName;
  }

  @override
  int get hashCode {
    return id.hashCode ^ brandColorName.hashCode ^ colorType.hashCode ^ buyUrl.hashCode ^ imageName.hashCode;
  }
}
