import 'dart:typed_data';
import 'package:backoffice/modules/firebase/firebase_storage_service.dart';
import 'package:backoffice/modules/products/service/dto/brand_dto.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class ProductService {
  Future<List<BrandDTO>> getBrands();
  Future<void> addBrand(BrandDTO brandDTO);
  Future<void> updateBrand(BrandDTO brandDTO);
  Future<String?> uploadBrandImage(BrandDTO brandDTO, Uint8List imageData);
  Future<void> deleteBrand(String brandId);
}

class ProductServiceImpl implements ProductService {
  @override
  Future<List<BrandDTO>> getBrands() async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('brands').get();

    List<BrandDTO> list = [];

    if (snapshot.exists) {
      print(snapshot.value);
      final result = snapshot.value as Map<String, dynamic>;
      for (final id in result.keys) {
        final String name = result[id]["name"];
        final String image = result[id]["image"];
        final brandDTO = BrandDTO(id: id, name: name, image: image);
        list.add(brandDTO);
      }
      return list;
    } else {
      return Future.error("Erro ao carregar os dados.");
    }
  }

  @override
  Future<void> addBrand(BrandDTO brandDTO) async {
    FirebaseDatabase database = FirebaseDatabase.instance;

    // final uuid = Utils.uuid();
    DatabaseReference ref = FirebaseDatabase.instance.ref("brands/${brandDTO.id}");

    await ref.set({
      "name": brandDTO.name,
      "image": brandDTO.image,
    });
  }

  @override
  Future<void> updateBrand(BrandDTO brandDTO) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("brands/${brandDTO.id}");

    await ref.update({
      "name": brandDTO.name,
      "image": brandDTO.image,
    });
  }

  Future<String?> uploadBrandImage(BrandDTO brandDTO, Uint8List imageData) async {
    if (brandDTO.image == null) {
      return Future.error("Sem nome da imagem");
    }

    final downloadUrl = await FirebaseStorageService.addNewImage(imageData, brandDTO.image!, ImageFolder.logo);
    updateBrand(brandDTO);

    return downloadUrl;
  }

  @override
  Future<void> deleteBrand(String brandId) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("brands/$brandId");
    await ref.remove();
  }
}
