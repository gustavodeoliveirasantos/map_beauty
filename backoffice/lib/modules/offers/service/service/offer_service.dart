import 'dart:typed_data';

import 'package:backoffice/modules/firebase/firebase_storage_service.dart';
import 'package:backoffice/modules/offers/service/dto/offer_dto.dart';
import 'package:firebase_database/firebase_database.dart';

abstract class OfferService {
  Future<List<OfferDTO>> getOffers();
  Future<void> addOffer(OfferDTO dto);
  Future<void> updateOffer(OfferDTO dto);
  Future<void> deleteOffer(OfferDTO dto);

  Future<void> activateOffers(List<String> ids);
  Future<void> deactivateOffers(List<String> ids);
  Future<void> uploadOfferImage(OfferDTO dto, String imageName, Uint8List imageData);
  Future<void> deleteImage(String imageName);
}

class OfferServiceImpl implements OfferService {
  late final FirebaseDatabase database;

  OfferServiceImpl({required this.database});

  @override
  Future<List<OfferDTO>> getOffers() async {
    final ref = database.ref();
    final snapshot = await ref.child('offers').get();

    List<OfferDTO> list = [];
    if (snapshot.exists) {
      final result = snapshot.value as Map<String, dynamic>;
      for (final id in result.keys) {
        final DateTime date = DateTime.fromMillisecondsSinceEpoch((result[id]["date"] ?? 0) as int);

        final bool isActive = (result[id]["isActive"] ?? false) as bool;
        final String productName = result[id]["productName"] as String;
        final String productDescription = result[id]["productDescription"];
        final String brandId = result[id]["brandId"];
        final images = ((result[id]["images"] ?? const <String>[]) as List<dynamic>).map((e) => e as String).toList();

        final offerDTO = OfferDTO(
          id: id,
          date: date,
          isActive: isActive,
          productName: productName,
          productDescription: productDescription,
          brandId: brandId,
          images: images,
        );
        list.add(offerDTO);
      }
      return list;
    } else {
      return Future.error("Erro ao carregar os dados.");
    }
  }

  @override
  Future<void> addOffer(OfferDTO dto) async {
    DatabaseReference ref = database.ref("offers/${dto.id}");

    await ref.set({
      "date": dto.date.millisecondsSinceEpoch,
      "isActive": dto.isActive,
      "productName": dto.productName,
      "productDescription": dto.productDescription,
      "brandId": dto.brandId,
      "images": dto.images,
    });
  }

  @override
  Future<void> updateOffer(OfferDTO dto) async {
    DatabaseReference ref = database.ref("offers/${dto.id}");

    await ref.update({
      "date": dto.date.millisecondsSinceEpoch,
      "isActive": dto.isActive,
      "productName": dto.productName,
      "productDescription": dto.productDescription,
      "brandId": dto.brandId,
      "images": dto.images,
    });
  }

  @override
  Future<void> deleteOffer(OfferDTO dto) async {
    DatabaseReference ref = database.ref("offers/${dto.id}");

    await ref.remove();
    for (var image in dto.images) {
      deleteImage(image);
    }
  }

  @override
  Future<void> activateOffers(List<String> ids) async {
    await _activateOrDesativateOrders(ids, true);
  }

  @override
  Future<void> deactivateOffers(List<String> ids) async {
    await _activateOrDesativateOrders(ids, false);
  }

  Future<void> _activateOrDesativateOrders(List<String> ids, bool isActive) async {
    DatabaseReference ref = database.ref();
    Map<String, Object?> valueToUpdate = {};

    for (var id in ids) {
      valueToUpdate["offers/${id}/isActive"] = isActive;
    }
    ref.update(valueToUpdate);
  }

  @override
  Future<void> uploadOfferImage(OfferDTO dto, String imageName, Uint8List imageData) async {
    await FirebaseStorageService.addNewImage(imageData, imageName, ImageFolder.logo);
    // updateBrand(brandDTO);
  }

  @override
  Future<void> deleteImage(String imageName) {
    return FirebaseStorageService.deleteImage(imageName, ImageFolder.offersProducts);
  }
}
