import 'package:commons/modules/core/domain/adapter.dart';
import 'package:commons/modules/products/domain/models/offer_model.dart';
import 'package:commons/modules/products/service/dto/offer_dto.dart';

class OfferAdapter extends Adapter<Offer, OfferDTO> {
  @override
  Offer adapt(OfferDTO dto) {
    return Offer(
      id: dto.id,
      date: dto.date,
      isActive: dto.isActive,
      productName: dto.productName,
      productDescription: dto.productDescription,
      brandId: dto.brandId,
      oldPrice: dto.oldPrice,
      discountPrice: dto.discountPrice,
      buyUrl: dto.buyUrl,
      images: dto.images ?? [],
      brandName: dto.brandName,
    );
  }

  @override
  OfferDTO adaptToDTO(Offer value) {
    return OfferDTO(
      id: value.id,
      date: value.date,
      isActive: value.isActive,
      productName: value.productName,
      productDescription: value.productDescription,
      brandId: value.brandId,
      oldPrice: value.oldPrice,
      discountPrice: value.discountPrice,
      buyUrl: value.buyUrl,
      images: value.images,
      brandName: value.brandName,
    );
  }
}
