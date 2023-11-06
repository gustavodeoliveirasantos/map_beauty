import 'dart:typed_data';
import 'package:backoffice/modules/offers/domain/models/offer.dart';
import 'package:backoffice/modules/offers/service/adapters/offer_adapter.dart';
import 'package:backoffice/modules/offers/service/service/offer_service.dart';
import 'package:backoffice/modules/products/service/adapters/brand_adapter.dart';

abstract class OfferRepository {
  Future<List<Offer>> getOffers();
  Future<void> addOffer(Offer offer);
  Future<void> updateOffer(Offer offer);
  Future<void> deleteOffer(Offer offer);

  Future<void> activateOffers(List<String> ids);
  Future<void> deactivateOffers(List<String> ids);
  Future<void> uploadOfferImage(Offer dto, String imageName, Uint8List imageData);
  Future<void> deleteImage(String imageName);
}

class OfferRepositoryImp implements OfferRepository {
  final OfferService _service;

  OfferRepositoryImp(this._service);

  @override
  Future<List<Offer>> getOffers() async {
    final brandsDTO = await _service.getOffers();
    List<Offer> list = [];
    for (var dto in brandsDTO) {
      list.add(OfferAdapter().adapt(dto));
    }

    return list;
  }

  @override
  Future<void> addOffer(Offer offer) {
    return _service.addOffer(OfferAdapter().adaptToDTO(offer));
  }

  @override
  Future<void> updateOffer(Offer offer) {
    return _service.updateOffer(OfferAdapter().adaptToDTO(offer));
  }

  @override
  Future<void> deleteOffer(Offer offer) {
    return _service.deleteOffer(OfferAdapter().adaptToDTO(offer));
  }

  @override
  Future<void> activateOffers(List<String> ids) {
    return _service.activateOffers(ids);
  }

  @override
  Future<void> deactivateOffers(List<String> ids) {
    return _service.activateOffers(ids);
  }

  @override
  Future<void> uploadOfferImage(Offer dto, String imageName, Uint8List imageData) {
    // TODO: implement uploadOfferImage
    throw UnimplementedError();
  }

  @override
  Future<void> deleteImage(String imageName) {
    // TODO: implement deleteImage
    throw UnimplementedError();
  }
}
