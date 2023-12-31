import 'dart:typed_data';

import 'package:commons/modules/firebase_service/firebase_storage_service.dart';
import 'package:commons/modules/products/domain/models/offer_model.dart';
import 'package:commons/modules/products/service/adapters/offer_adapter.dart';
import 'package:commons/modules/products/service/service/offer_service.dart';

abstract class OfferRepository {
  Future<List<Offer>> getOffers();
  Future<void> addOffer(Offer offer);
  Future<void> updateOffer(Offer offer);
  Future<void> deleteOffer(Offer offer);

  Future<void> activateOffers(List<String> ids);
  Future<void> deactivateOffers(List<String> ids);
  Future<void> uploadOfferImage(Offer offer, String imageName, Uint8List imageData);
  Future<void> deleteImage(Offer offer, String imageName);
  Future<void> updateMainImage(Offer offer, String imageName);
}

class OfferRepositoryImpl implements OfferRepository {
  final OfferService _service;
  late final FirebaseStorageService _firebaseStorageService;

  OfferRepositoryImpl(this._service, this._firebaseStorageService);

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
    if (offer.images != null) {
      for (var image in offer.images!) {
        deleteImage(offer, image);
      }
    }

    return _service.deleteOffer(OfferAdapter().adaptToDTO(offer));
  }

  @override
  Future<void> activateOffers(List<String> ids) {
    return _service.activateOffers(ids);
  }

  @override
  Future<void> deactivateOffers(List<String> ids) {
    return _service.deactivateOffers(ids);
  }

  @override
  Future<void> uploadOfferImage(Offer offer, String imageName, Uint8List imageData) async {
    final dto = OfferAdapter().adaptToDTO(offer);
    await _service.uploadOfferImage(dto, imageName);

    await _firebaseStorageService.uploadImage(imageData, imageName, ImageFolder.offersProducts);
  }

  @override
  Future<void> deleteImage(Offer offer, String imageName) async {
    final dto = OfferAdapter().adaptToDTO(offer);
    await _service.deleteOfferImage(dto, imageName);

    return _firebaseStorageService.deleteImage(imageName, ImageFolder.offersProducts);
  }

  @override
  Future<void> updateMainImage(Offer offer, String imageName) {
    final dto = OfferAdapter().adaptToDTO(offer);
    return _service.updateMainImage(dto, imageName);
  }
}
