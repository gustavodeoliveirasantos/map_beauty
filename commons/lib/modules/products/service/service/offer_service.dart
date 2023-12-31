import 'package:commons/modules/products/service/dto/offer_dto.dart';
import 'package:firebase_database/firebase_database.dart';

abstract class OfferService {
  Future<List<OfferDTO>> getOffers();
  Future<void> addOffer(OfferDTO dto);
  Future<void> updateOffer(OfferDTO dto);
  Future<void> deleteOffer(OfferDTO dto);

  Future<void> activateOffers(List<String> ids);
  Future<void> deactivateOffers(List<String> ids);
  Future<void> uploadOfferImage(OfferDTO dto, String imageName);
  Future<void> deleteOfferImage(OfferDTO dto, String imageName);
  Future<void> updateMainImage(OfferDTO dto, String imageName);
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
      Map<Object?, Object?> dataSnapshot = snapshot.value as Map<Object?, Object?>;
      final result = dataSnapshot.cast<String, dynamic>();

      for (final id in result.keys) {
        final DateTime date = DateTime.fromMillisecondsSinceEpoch((result[id]["date"] ?? 0) as int);

        final bool isActive = (result[id]["isActive"] ?? false) as bool;
        final String productName = result[id]["productName"] as String;
        final String productDescription = result[id]["productDescription"];
        final String brandId = result[id]["brandId"];
        final String brandName = result[id]["brandName"];
        final double oldPrice = (convertValuesToDouble(result[id]["oldPrice"]) ?? 0.0);
        final double discountPrice = (convertValuesToDouble(result[id]["discountPrice"]) ?? 0.0);
        final String buyUrl = result[id]["buyUrl"];
        final String? mainImage = result[id].containsKey("mainImage") ? result[id]["mainImage"] : null;
        final images = ((result[id]["images"] ?? const <String>[]) as List<dynamic>).map((e) => e as String).toList();

        final offerDTO = OfferDTO(
          id: id,
          date: date,
          isActive: isActive,
          productName: productName,
          productDescription: productDescription,
          brandId: brandId,
          brandName: brandName,
          oldPrice: oldPrice,
          discountPrice: discountPrice,
          buyUrl: buyUrl,
          mainImage: mainImage,
          images: images,
        );
        list.add(offerDTO);
      }
      return list;
    } else {
      return Future.error("Erro ao carregar os dados.");
    }
  }

  double? convertValuesToDouble(dynamic value) {
    if (value is int) {
      return value.toDouble();
    } else if (value is double) {
      return value;
    }
    return null;
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
      "brandName": dto.brandName,
      "oldPrice": dto.oldPrice,
      "discountPrice": dto.discountPrice,
      "buyUrl": dto.buyUrl,
      "mainImage": dto.mainImage,
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
      "brandName": dto.brandName,
      "oldPrice": dto.oldPrice,
      "discountPrice": dto.discountPrice,
      "buyUrl": dto.buyUrl,
      "mainImage": dto.mainImage,
      "images": dto.images,
    });
  }

  @override
  Future<void> deleteOffer(OfferDTO dto) async {
    DatabaseReference ref = database.ref("offers/${dto.id}");

    await ref.remove();
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
      valueToUpdate["offers/$id/isActive"] = isActive;
    }
    ref.update(valueToUpdate);
  }

  @override
  Future<void> uploadOfferImage(OfferDTO dto, String imageName) async {
    DatabaseReference ref = database.ref();
    final List<String> images = [];
    if (dto.images != null && dto.images!.isNotEmpty) {
      images.addAll(dto.images!);
    }

    images.add(imageName);

    Map<String, Object?> valueToUpdate = {"offers/${dto.id}/images": images};
    ref.update(valueToUpdate);
  }

  @override
  Future<void> deleteOfferImage(OfferDTO dto, String imageName) async {
    DatabaseReference ref = database.ref();
    final List<String> images = [];
    if (dto.images != null && dto.images!.isNotEmpty) {
      images.addAll(dto.images!);
    }

    images.removeWhere((element) => element == imageName);

    Map<String, Object?> valueToUpdate = {"offers/${dto.id}/images": images};
    ref.update(valueToUpdate);

    if (dto.mainImage == imageName) {
      updateMainImage(dto, null);
    }
  }

  @override
  Future<void> updateMainImage(OfferDTO dto, String? imageName) async {
    DatabaseReference ref = database.ref();

    Map<String, Object?> valueToUpdate = {"offers/${dto.id}/mainImage": imageName};
    ref.update(valueToUpdate);
  }
}
