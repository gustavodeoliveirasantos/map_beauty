import 'dart:typed_data';

import 'package:backoffice/modules/core/presentation/view_model/base_view_model.dart';
import 'package:backoffice/modules/core/utils/utils.dart';
import 'package:backoffice/modules/products/domain/models/brand_model.dart';
import 'package:backoffice/modules/products/domain/use_case/brand_add_use_case.dart';
import 'package:backoffice/modules/products/domain/use_case/brand_delete_use_case.dart';
import 'package:backoffice/modules/products/domain/use_case/brand_get_use_case.dart';
import 'package:backoffice/modules/products/domain/use_case/brand_upload_image_use_case.dart';
import 'package:backoffice/modules/products/domain/use_case/brand_update_use_case.dart';
import 'package:flutter/material.dart';

class BrandViewModel extends ChangeNotifier {
  late final GetBrandsUseCase getBrandsUseCase;
  late final AddBrandUseCase addBrandUseCase;
  late final UpdateBrandUseCase updateBrandUseCase;
  late final UploadImageBrandUseCase updateImageBrandUseCase;
  late final DeleteBrandUseCase deleteBrandUseCase;

  BrandViewModel({
    required this.getBrandsUseCase,
    required this.addBrandUseCase,
    required this.updateBrandUseCase,
    required this.updateImageBrandUseCase,
    required this.deleteBrandUseCase,
  });

  List<Brand> _brands = [];
  List<Brand> get brands => [..._brands];

  Future<void> loadBrands() async {
    _brands = await getBrandsUseCase.execute();

    notifyListeners();
  }

  Future<void> uploadImageToFirebaseStorage(Brand brand, Uint8List imageData) async {
    //TODO: Como atualizar a imagem no setState
    //Achar a melhor soluçnao para fazer upload das imagens
    // return await updateImageBrandUseCase.execute(UploadImageBrandUseCaseInput(brand: brand, imageData: imageData));
  }

  Future<Brand> addBrandAndUpdateImage(String name, Uint8List imageData, String imageName) async {
    final id = Utils.uuid();
    final finalImageName = "${id}_$imageName";
    final brand = Brand(id: id, name: name, image: imageName);
    await _addBrand(brand).then((value) {
      // updateImageBrandUseCase.execute(UploadImageBrandUseCaseInput(brand: brand, imageData: imageData));
    });
    return brand;
  }

  Future<void> updateBrandImage(Brand brand, Uint8List imageData, String imageName) async {
    final String oldImageName = brand.image ?? "";

    final finalImageName = "${brand.id}_$imageName";
    await updateBrand(brand, null, finalImageName, false).onError((error, stackTrace) => print("GOS deu erro no update?"));
    await updateImageBrandUseCase.execute(UploadImageBrandUseCaseInput(brand: brand, imageData: imageData, oldImageName: oldImageName));
    print("GOS -  Entrou aqui e vai dar Notigy");
    notifyListeners();
  }

  Future<void> _addBrand(Brand brand) async {
    await addBrandUseCase.execute(brand);
    _brands.add(brand);

    notifyListeners();
  }

  Future<void> updateBrand(Brand brand, String? newName, String? newImageName, [bool shouldNotify = true]) async {
    brand.name = newName ?? brand.name;
    brand.image = newImageName ?? brand.image;
    await updateBrandUseCase.execute(brand);
    if (shouldNotify) {
      notifyListeners();
    }
  }

  Future<void> deleteBrand(Brand brand) async {
    await deleteBrandUseCase.execute(brand);

    _brands.remove(brand);
    notifyListeners();
  }
}
