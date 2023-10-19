// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ColorTypeDTO {
  final String id;
  final String colorName;
  const ColorTypeDTO({
    required this.id,
    required this.colorName,
  });

  ColorTypeDTO copyWith({
    String? id,
    String? colorName,
  }) {
    return ColorTypeDTO(
      id: id ?? this.id,
      colorName: colorName ?? this.colorName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'colorName': colorName,
    };
  }

  factory ColorTypeDTO.fromMap(Map<String, dynamic> map) {
    return ColorTypeDTO(
      id: (map["id"] ?? '') as String,
      colorName: (map["colorName"] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ColorTypeDTO.fromJson(String source) => ColorTypeDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ColorTypeDTO(id: $id, colorName: $colorName)';

  @override
  bool operator ==(covariant ColorTypeDTO other) {
    if (identical(this, other)) return true;

    return other.id == id && other.colorName == colorName;
  }

  @override
  int get hashCode => id.hashCode ^ colorName.hashCode;
}
