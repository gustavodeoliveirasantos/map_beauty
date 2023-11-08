// ignore_for_file: public_member_api_docs, sort_constructors_first
class Offer {
  final String id;
  final DateTime date;
  final bool isActive;
  final String productName;
  final String productDescription;
  final String brandId;
  final String brandName;
  final double oldPrice;
  final double discountPrice;
  final String buyUrl;
  final List<String>? images;

  const Offer({
    required this.id,
    required this.date,
    required this.isActive,
    required this.productName,
    required this.productDescription,
    required this.brandId,
    required this.brandName,
    required this.oldPrice,
    required this.discountPrice,
    required this.buyUrl,
    required this.images,
  });

  Offer copyWith({
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
    return Offer(
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
      brandName: '',
    );
  }

  double get discountPercentage => ((oldPrice - discountPrice) * 100) / oldPrice;
}
