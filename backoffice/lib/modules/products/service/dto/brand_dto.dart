// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class BrandDTO {
  final String id;
  final String name;
  final List<String> images;

  const BrandDTO({
    required this.id,
    required this.name,
    required this.images,
  });

  BrandDTO copyWith({
    String? id,
    String? name,
    List<String>? images,
  }) {
    return BrandDTO(
      id: id ?? this.id,
      name: name ?? this.name,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'images': images,
    };
  }

  factory BrandDTO.fromMap(Map<String, dynamic> map) {
    return BrandDTO(
      id: (map["id"] ?? '') as String,
      name: (map["name"] ?? '') as String,
      images: List<String>.from(
        ((map['images'] ?? const <String>[]) as List<String>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory BrandDTO.fromJson(String source) => BrandDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'BrandDTO(id: $id, name: $name, images: $images)';

  @override
  bool operator ==(covariant BrandDTO other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && listEquals(other.images, images);
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ images.hashCode;
}
