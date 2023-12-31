import 'package:commons/modules/products/service/dto/brand_dto.dart';
import 'package:firebase_database/firebase_database.dart';

abstract class BrandService {
  Future<List<BrandDTO>> getBrands();
  Future<void> addBrand(BrandDTO brandDTO);
  Future<void> updateBrand(BrandDTO brandDTO);
  Future<void> deleteBrand(String brandId);
}

class BrandServiceImpl implements BrandService {
  late final FirebaseDatabase database;

  BrandServiceImpl({required this.database});

  @override
  Future<List<BrandDTO>> getBrands() async {
    final ref = database.ref();
    final snapshot = await ref.child('brands').get();

    List<BrandDTO> list = [];

    if (snapshot.exists) {
      final result = snapshot.value as Map<String, dynamic>;
      for (final id in result.keys) {
        final String name = result[id]["name"];
        final String? image = result[id]["image"];
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
    DatabaseReference ref = database.ref("brands/${brandDTO.id}");

    await ref.set({
      "name": brandDTO.name,
      "image": brandDTO.image,
    });
  }

  @override
  Future<void> updateBrand(BrandDTO brandDTO) async {
    DatabaseReference ref = database.ref("brands/${brandDTO.id}");

    await ref.update({
      "name": brandDTO.name,
      "image": brandDTO.image,
    });
  }

  @override
  Future<void> deleteBrand(String brandId) async {
    DatabaseReference ref = database.ref("brands/$brandId");
    await ref.remove();
  }
}
