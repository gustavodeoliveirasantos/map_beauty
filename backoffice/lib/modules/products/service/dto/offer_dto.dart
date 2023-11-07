// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class OfferDTO {
  final String id;
  final DateTime date;
  final bool isActive;
  final String productName;
  final String productDescription;
  final String brandId;
  final double oldPrice;
  final double discountPrice;
  final String buyUrl;
  final List<String>? images;
  const OfferDTO({
    required this.id,
    required this.date,
    required this.isActive,
    required this.productName,
    required this.productDescription,
    required this.brandId,
    required this.oldPrice,
    required this.discountPrice,
    required this.buyUrl,
    required this.images,
  });

  OfferDTO copyWith({
    String? id,
    DateTime? date,
    bool? isActive,
    String? productName,
    String? productDescription,
    String? brandId,
    double? oldPrice,
    double? discountPrice,
    String? buyUrl,
    List<String>? images,
  }) {
    return OfferDTO(
      id: id ?? this.id,
      date: date ?? this.date,
      isActive: isActive ?? this.isActive,
      productName: productName ?? this.productName,
      productDescription: productDescription ?? this.productDescription,
      brandId: brandId ?? this.brandId,
      oldPrice: oldPrice ?? this.oldPrice,
      discountPrice: discountPrice ?? this.discountPrice,
      buyUrl: buyUrl ?? this.buyUrl,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'date': date.millisecondsSinceEpoch,
      'isActive': isActive,
      'productName': productName,
      'productDescription': productDescription,
      'brandId': brandId,
      'oldPrice': oldPrice,
      'discountPrice': discountPrice,
      'buyUrl': buyUrl,
      'images': images,
    };
  }

  factory OfferDTO.fromMap(Map<String, dynamic> map) {
    return OfferDTO(
      id: (map["id"] ?? '') as String,
      date: DateTime.fromMillisecondsSinceEpoch((map["date"] ?? 0) as int),
      isActive: (map["isActive"] ?? false) as bool,
      productName: (map["productName"] ?? '') as String,
      productDescription: (map["productDescription"] ?? '') as String,
      brandId: (map["brandId"] ?? '') as String,
      oldPrice: (map["oldPrice"] ?? 0.0) as double,
      discountPrice: (map["discountPrice"] ?? 0.0) as double,
      buyUrl: (map["buyUrl"] ?? '') as String,
      images: List<String>.from(
        ((map['images'] ?? const <String>[]) as List<String>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory OfferDTO.fromJson(String source) => OfferDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OfferDTO(id: $id, date: $date, isActive: $isActive, productName: $productName, productDescription: $productDescription, brandId: $brandId, oldPrice: $oldPrice, discountPrice: $discountPrice, buyUrl: $buyUrl, images: $images)';
  }

  @override
  bool operator ==(covariant OfferDTO other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.date == date &&
        other.isActive == isActive &&
        other.productName == productName &&
        other.productDescription == productDescription &&
        other.brandId == brandId &&
        other.oldPrice == oldPrice &&
        other.discountPrice == discountPrice &&
        other.buyUrl == buyUrl &&
        listEquals(other.images, images);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        date.hashCode ^
        isActive.hashCode ^
        productName.hashCode ^
        productDescription.hashCode ^
        brandId.hashCode ^
        oldPrice.hashCode ^
        discountPrice.hashCode ^
        buyUrl.hashCode ^
        images.hashCode;
  }
}
