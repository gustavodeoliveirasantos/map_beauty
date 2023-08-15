import 'dart:convert';
import 'package:mapbeauty/modules/make_up_search/data/models/color_type_dto.dart';

class ProductColorsDTO {
  final String id;
  final String brandColor;
  final ColorTypeDTO color;
  final String buyUrl;
  const ProductColorsDTO({
    required this.id,
    required this.brandColor,
    required this.color,
    required this.buyUrl,
  });

  ProductColorsDTO copyWith({
    String? id,
    String? brandColor,
    ColorTypeDTO? color,
    String? buyUrl,
  }) {
    return ProductColorsDTO(
      id: id ?? this.id,
      brandColor: brandColor ?? this.brandColor,
      color: color ?? this.color,
      buyUrl: buyUrl ?? this.buyUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'brandColor': brandColor,
      'color': color.toMap(),
      'buyUrl': buyUrl,
    };
  }

  factory ProductColorsDTO.fromMap(Map<String, dynamic> map) {
    return ProductColorsDTO(
      id: (map["id"] ?? '') as String,
      brandColor: (map["brandColor"] ?? '') as String,
      color: ColorTypeDTO.fromMap((map["color"] ?? Map<String, dynamic>.from({})) as Map<String, dynamic>),
      buyUrl: (map["buyUrl"] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductColorsDTO.fromJson(String source) => ProductColorsDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductColorsDTO(id: $id, brandColor: $brandColor, color: $color, buyUrl: $buyUrl)';
  }

  @override
  bool operator ==(covariant ProductColorsDTO other) {
    if (identical(this, other)) return true;

    return other.id == id && other.brandColor == brandColor && other.color == color && other.buyUrl == buyUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^ brandColor.hashCode ^ color.hashCode ^ buyUrl.hashCode;
  }
}
