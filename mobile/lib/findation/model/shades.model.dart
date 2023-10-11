// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ShadeModel {
  final int id;
  final int product_id;
  final String name;
  final String search;
  const ShadeModel({
    required this.id,
    required this.product_id,
    required this.name,
    required this.search,
  });

  ShadeModel copyWith({
    int? id,
    int? product_id,
    String? name,
    String? search,
  }) {
    return ShadeModel(
      id: id ?? this.id,
      product_id: product_id ?? this.product_id,
      name: name ?? this.name,
      search: search ?? this.search,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'product_id': product_id,
      'name': name,
      'search': search,
    };
  }

  factory ShadeModel.fromMap(Map<String, dynamic> map) {
    return ShadeModel(
      id: (map["id"] ?? 0) as int,
      product_id: (map["product_id"] ?? 0) as int,
      name: (map["name"] ?? '') as String,
      search: (map["search"] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ShadeModel.fromJson(String source) => ShadeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ShadesModel(id: $id, product_id: $product_id, name: $name, search: $search)';
  }

  @override
  bool operator ==(covariant ShadeModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.product_id == product_id && other.name == name && other.search == search;
  }

  @override
  int get hashCode {
    return id.hashCode ^ product_id.hashCode ^ name.hashCode ^ search.hashCode;
  }
}
