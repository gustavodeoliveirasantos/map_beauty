// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ColorTypeDTO {
  final String id;
  final String color;
  final String hexCode;
  const ColorTypeDTO({
    required this.id,
    required this.color,
    required this.hexCode,
  });

  ColorTypeDTO copyWith({
    String? id,
    String? color,
    String? hexCode,
  }) {
    return ColorTypeDTO(
      id: id ?? this.id,
      color: color ?? this.color,
      hexCode: hexCode ?? this.hexCode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'color': color,
      'hexCode': hexCode,
    };
  }

  factory ColorTypeDTO.fromMap(Map<String, dynamic> map) {
    return ColorTypeDTO(
      id: (map["id"] ?? '') as String,
      color: (map["color"] ?? '') as String,
      hexCode: (map["hexCode"] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ColorTypeDTO.fromJson(String source) => ColorTypeDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ColorDTO(id: $id, color: $color, hexCode: $hexCode)';

  @override
  bool operator ==(covariant ColorTypeDTO other) {
    if (identical(this, other)) return true;

    return other.id == id && other.color == color && other.hexCode == hexCode;
  }

  @override
  int get hashCode => id.hashCode ^ color.hashCode ^ hexCode.hashCode;
}
