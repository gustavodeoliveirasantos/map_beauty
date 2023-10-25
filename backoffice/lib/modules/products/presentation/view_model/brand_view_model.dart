import 'dart:typed_data';

import 'package:backoffice/modules/core/presentation/view_model/base_view_model.dart';
import 'package:backoffice/modules/core/utils/utils.dart';
import 'package:backoffice/modules/products/domain/models/brand_model.dart';
import 'package:backoffice/modules/products/domain/use_case/brand_add_use_case.dart';
import 'package:backoffice/modules/products/domain/use_case/brand_delete_use_case.dart';
import 'package:backoffice/modules/products/domain/use_case/brand_get_use_case.dart';
import 'package:backoffice/modules/products/domain/use_case/brand_update_image_use_case.dart';
import 'package:backoffice/modules/products/domain/use_case/brand_update_use_case.dart';
import 'package:flutter/material.dart';

class BrandViewModel extends ChangeNotifier {
  late final GetBrandsUseCase _getBrandsUseCase = GetBrandsUseCaseImpl();
  late final AddBrandUseCase _addBrandUseCase = AddBrandUseCaseImpl();
  late final UpdateBrandUseCase _updateBrandUseCase = UpdateBrandUseCaseImpl();
  late final UpdateImageBrandUseCase _updateImageBrandUseCase = UpdateImageBrandUseCaseImpl();
  late final DeleteBrandUseCase _deleteBrandUseCase = DeleteBrandUseCaseImpl();

  // late List<Brand> _brands;

  List<Brand> _brands = [];
  List<Brand> get brands => [..._brands];

  Future<void> loadBrands() async {
    _brands = await _getBrandsUseCase.execute();

    notifyListeners();
  }

  Future<String?> uploadImageToFirebaseStorage(Brand brand, Uint8List imageData) async {
    //TODO: Como atualizar a imagem no setState
    return _updateImageBrandUseCase.execute(UpdateImageBrandUseCaseInput(brand: brand, imageData: imageData));
  }

  Future<Brand> addBrandAndUpdateImage(String name, Uint8List imageData, String imageName) async {
    //TODO: Ao adicionar atualizar a lista de Brands... usar provider aqui...A lista de brands vai ser usada em outros lados tbm...
    final brand = Brand(id: Utils.uuid(), name: name, image: imageName);
    await _addBrand(brand).then((value) {
      _updateImageBrandUseCase.execute(UpdateImageBrandUseCaseInput(brand: brand, imageData: imageData));
    });
    return brand;
  }

  Future<void> _addBrand(Brand brand) async {
    return _addBrandUseCase.execute(brand);
  }

  Future<void> updateBrand(Brand brand) async {
    await _updateBrandUseCase.execute(brand);
    notifyListeners();
  }

  Future<void> deleteBrand(Brand brand) async {
    await _deleteBrandUseCase.execute(brand);

    _brands.remove(brand);
    notifyListeners();
  }
}
