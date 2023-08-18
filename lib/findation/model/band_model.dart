// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BrandModel {
  final int id;
  final String name;
  final String search;
  const BrandModel({
    required this.id,
    required this.name,
    required this.search,
  });

  BrandModel copyWith({
    int? id,
    String? name,
    String? search,
  }) {
    return BrandModel(
      id: id ?? this.id,
      name: name ?? this.name,
      search: search ?? this.search,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'search': search,
    };
  }

  factory BrandModel.fromMap(Map<String, dynamic> map) {
    return BrandModel(
      id: (map["id"] ?? 0) as int,
      name: (map["name"] ?? '') as String,
      search: (map["search"] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BrandModel.fromJson(String source) {
    final a = BrandModel.fromMap(json.decode(source) as Map<String, dynamic>);
    return a;
  }

  @override
  String toString() => 'BrandModel(id: $id, name: $name, search: $search)';

  @override
  bool operator ==(covariant BrandModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.search == search;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ search.hashCode;
}
