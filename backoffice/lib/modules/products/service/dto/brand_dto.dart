// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class BrandDTO {
  final String id;
  final String name;
  final String? image;

  const BrandDTO({
    required this.id,
    required this.name,
    required this.image,
  });

  BrandDTO copyWith({
    String? id,
    String? name,
    String? image,
  }) {
    return BrandDTO(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
    };
  }

  factory BrandDTO.fromMap(Map<String, dynamic> map) {
    return BrandDTO(
      id: (map["id"] ?? '') as String,
      name: (map["name"] ?? '') as String,
      image: (map["image"] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BrandDTO.fromJson(String source) => BrandDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'BrandDTO(id: $id, name: $name, image: $image)';

  @override
  bool operator ==(covariant BrandDTO other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.image == image;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ image.hashCode;
}
