// ignore_for_file: public_member_api_docs, sort_constructors_first

class OfferDTO {
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
  final String? mainImage;
  final List<String>? images;
  const OfferDTO({
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
    required this.mainImage,
    required this.images,
  });

  OfferDTO copyWith({
    String? id,
    DateTime? date,
    bool? isActive,
    String? productName,
    String? productDescription,
    String? brandId,
    String? brandName,
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
      brandName: brandName ?? this.brandName,
      oldPrice: oldPrice ?? this.oldPrice,
      discountPrice: discountPrice ?? this.discountPrice,
      buyUrl: buyUrl ?? this.buyUrl,
      images: images ?? this.images,
      mainImage: '',
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
      'brandName': brandName,
      'oldPrice': oldPrice,
      'discountPrice': discountPrice,
      'buyUrl': buyUrl,
      'images': images,
    };
  }

  @override
  String toString() {
    return 'OfferDTO(id: $id, date: $date, isActive: $isActive, productName: $productName, productDescription: $productDescription, brandId: $brandId, brandName: $brandName, oldPrice: $oldPrice, discountPrice: $discountPrice, buyUrl: $buyUrl, images: $images)';
  }
}
