import 'dart:typed_data';

import 'package:backoffice/modules/core/utils/utils.dart';
import 'package:backoffice/modules/products/domain/models/brand_model.dart';
import 'package:backoffice/modules/products/domain/use_case/get_brands_use_case.dart';
import 'package:backoffice/modules/products/service/dto/brand_dto.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProductViewModel {
  final GetBrandsUseCase _getBrandsUseCase = GetBrandsUseCaseImpl();

  Future<List<Brand>> getBrands() {
    return _getBrandsUseCase.execute();
  }

  Future<String?> uploadImageToFirebaseStorage(Uint8List imageData, String imageName) async {
    final storageRef = FirebaseStorage.instance.ref();
    final mountainsRef = storageRef.child("logos/$imageName");

    try {
      await mountainsRef.putData(imageData);
      updateBrand(imageName);
      return mountainsRef.getDownloadURL();
    } on FirebaseException catch (e) {
      print("N˜AO SUBIU");
      print(e);
    }
    return null;
  }

  Future<void> saveBrand() async {
    FirebaseDatabase database = FirebaseDatabase.instance;

    final uuid = Utils.uuid();
    DatabaseReference ref = FirebaseDatabase.instance.ref("brands/$uuid");

    await ref.set({
      "name": "Avon 2",
      "image": "avon_logo.png",
    });

    print("datos salvos");
  }

  Future<void> updateBrand(String image) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("brands/1698087970976000");
    print(image);
// Only update the name, leave the age and address!
    await ref.update({
      "image": image,
    });
  }

  Future<void> getBrands2() async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('brands').get();
    if (snapshot.exists) {
      print(snapshot.value);
    } else {
      print('No data available.');
    }
  }
}
