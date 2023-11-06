// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:backoffice/modules/products/domain/models/brand_model.dart';

class Offer {
  final String id;
  final DateTime date;
  final bool isActive;
  final String productName;
  final String productDescription;
  final String brandId;
  final List<String> images;

  const Offer({
    required this.id,
    required this.date,
    required this.isActive,
    required this.productName,
    required this.productDescription,
    required this.brandId,
    required this.images,
  });

  Offer copyWith({
    String? id,
    DateTime? date,
    bool? isActive,
    String? productName,
    String? productDescription,
    String? brandId,
    List<String>? images,
  }) {
    return Offer(
      id: id ?? this.id,
      date: date ?? this.date,
      isActive: isActive ?? this.isActive,
      productName: productName ?? this.productName,
      productDescription: productDescription ?? this.productDescription,
      brandId: brandId ?? this.brandId,
      images: images ?? this.images,
    );
  }
}
