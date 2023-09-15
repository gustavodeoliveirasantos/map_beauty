// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ColorTypeDTO {
  final String id;
  final String colorName;
  final String hexCode;
  const ColorTypeDTO({
    required this.id,
    required this.colorName,
    required this.hexCode,
  });

  ColorTypeDTO copyWith({
    String? id,
    String? color,
    String? hexCode,
  }) {
    return ColorTypeDTO(
      id: id ?? this.id,
      colorName: color ?? this.colorName,
      hexCode: hexCode ?? this.hexCode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'color': colorName,
      'hexCode': hexCode,
    };
  }

  factory ColorTypeDTO.fromMap(Map<String, dynamic> map) {
    return ColorTypeDTO(
      id: (map["id"] ?? '') as String,
      colorName: (map["color"] ?? '') as String,
      hexCode: (map["hexCode"] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ColorTypeDTO.fromJson(String source) => ColorTypeDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ColorDTO(id: $id, color: $colorName, hexCode: $hexCode)';

  @override
  bool operator ==(covariant ColorTypeDTO other) {
    if (identical(this, other)) return true;

    return other.id == id && other.colorName == colorName && other.hexCode == hexCode;
  }

  @override
  int get hashCode => id.hashCode ^ colorName.hashCode ^ hexCode.hashCode;
}
