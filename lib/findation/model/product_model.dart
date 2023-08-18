// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductModel {
  final int id;
  final String micro_image_url;
  final String thumb_image_url;
  final String name;
  final String search;
  final int brand_id;
  const ProductModel({
    required this.id,
    required this.micro_image_url,
    required this.thumb_image_url,
    required this.name,
    required this.search,
    required this.brand_id,
  });

  ProductModel copyWith({
    int? id,
    String? micro_image_url,
    String? thumb_image_url,
    String? name,
    String? search,
    int? brand_id,
  }) {
    return ProductModel(
      id: id ?? this.id,
      micro_image_url: micro_image_url ?? this.micro_image_url,
      thumb_image_url: thumb_image_url ?? this.thumb_image_url,
      name: name ?? this.name,
      search: search ?? this.search,
      brand_id: brand_id ?? this.brand_id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'micro_image_url': micro_image_url,
      'thumb_image_url': thumb_image_url,
      'name': name,
      'search': search,
      'brand_id': brand_id,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: (map["id"] ?? 0) as int,
      micro_image_url: (map["micro_image_url"] ?? '') as String,
      thumb_image_url: (map["thumb_image_url"] ?? '') as String,
      name: (map["name"] ?? '') as String,
      search: (map["search"] ?? '') as String,
      brand_id: (map["brand_id"] ?? 0) as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(id: $id, micro_image_url: $micro_image_url, thumb_image_url: $thumb_image_url, name: $name, search: $search, brand_id: $brand_id)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.micro_image_url == micro_image_url && other.thumb_image_url == thumb_image_url && other.name == name && other.search == search && other.brand_id == brand_id;
  }

  @override
  int get hashCode {
    return id.hashCode ^ micro_image_url.hashCode ^ thumb_image_url.hashCode ^ name.hashCode ^ search.hashCode ^ brand_id.hashCode;
  }
}
