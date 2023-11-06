import 'package:backoffice/modules/core/domain/adapter.dart';
import 'package:backoffice/modules/offers/domain/models/offer.dart';
import 'package:backoffice/modules/offers/service/dto/offer_dto.dart';

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
      images: dto.images,
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
      images: value.images,
    );
  }
}
