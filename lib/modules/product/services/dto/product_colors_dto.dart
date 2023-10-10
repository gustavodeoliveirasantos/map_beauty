import 'dart:convert';
import 'package:mapbeauty/modules/product/services/dto/color_type_dto.dart';

class ProductColorDTO {
  final String id;
  final String brandColorName;
  final ColorTypeDTO colorType;
  final String buyUrl;
  const ProductColorDTO({
    required this.id,
    required this.brandColorName,
    required this.colorType,
    required this.buyUrl,
  });

  ProductColorDTO copyWith({
    String? id,
    String? brandColor,
    ColorTypeDTO? color,
    String? buyUrl,
  }) {
    return ProductColorDTO(
      id: id ?? this.id,
      brandColorName: brandColor ?? brandColorName,
      colorType: color ?? colorType,
      buyUrl: buyUrl ?? this.buyUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'brandColor': brandColorName,
      'color': colorType.toMap(),
      'buyUrl': buyUrl,
    };
  }

  factory ProductColorDTO.fromMap(Map<String, dynamic> map) {
    return ProductColorDTO(
      id: (map["id"] ?? '') as String,
      brandColorName: (map["brandColor"] ?? '') as String,
      colorType: ColorTypeDTO.fromMap((map["color"] ?? Map<String, dynamic>.from({})) as Map<String, dynamic>),
      buyUrl: (map["buyUrl"] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductColorDTO.fromJson(String source) => ProductColorDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductColorsDTO(id: $id, brandColor: $brandColorName, color: $colorType, buyUrl: $buyUrl)';
  }

  @override
  bool operator ==(covariant ProductColorDTO other) {
    if (identical(this, other)) return true;

    return other.id == id && other.brandColorName == brandColorName && other.colorType == colorType && other.buyUrl == buyUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^ brandColorName.hashCode ^ colorType.hashCode ^ buyUrl.hashCode;
  }
}
