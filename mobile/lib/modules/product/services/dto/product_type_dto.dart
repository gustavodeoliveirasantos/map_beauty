// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductTypeDTO {
  final int id;
  final String type;
  const ProductTypeDTO({
    required this.id,
    required this.type,
  });

  ProductTypeDTO copyWith({
    int? id,
    String? type,
  }) {
    return ProductTypeDTO(
      id: id ?? this.id,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'type': type,
    };
  }

  factory ProductTypeDTO.fromMap(Map<String, dynamic> map) {
    return ProductTypeDTO(
      id: (map["id"] ?? 0) as int,
      type: (map["type"] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductTypeDTO.fromJson(String source) => ProductTypeDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ProductTypeDTO(id: $id, type: $type)';

  @override
  bool operator ==(covariant ProductTypeDTO other) {
    if (identical(this, other)) return true;

    return other.id == id && other.type == type;
  }

  @override
  int get hashCode => id.hashCode ^ type.hashCode;
}
