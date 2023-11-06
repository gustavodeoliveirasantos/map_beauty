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
    _sortBrands();

    notifyListeners();
  }

  void _sortBrands() {
    _brands.sort(
      (a, b) {
        return a.name.toLowerCase().compareTo(b.name.toLowerCase());
      },
    );
  }

  Future<Brand> addBrandAndUpdateImage(String name, Uint8List imageData, String imageName) async {
    final id = Utils.uuid();
    final finalImageName = "${id}_$imageName";
    final brand = Brand(id: id, name: name, image: imageName);

    await addBrandUseCase.execute(AddBrandUseCaseInput(brand: brand, imageData: imageData));
    _brands.add(brand);
    _sortBrands();

    return brand;
  }

  Future<void> updateBrandImage(Brand brand, Uint8List imageData, String imageName) async {
    final String oldImageName = brand.image;

    final finalImageName = "${brand.id}_$imageName";

    final updatedBrand = brand.copyWith(image: finalImageName);

    await updateBrand(updatedBrand, false).onError((error, stackTrace) => print("GOS deu erro no update?"));
    await updateImageBrandUseCase.execute(UploadImageBrandUseCaseInput(brand: brand, imageData: imageData, oldImageName: oldImageName));
    print("GOS -  Entrou aqui e vai dar Notigy");
    notifyListeners();
  }

  Future<void> updateBrand(Brand brand, [bool shouldNotify = true]) async {
    await updateBrandUseCase.execute(brand);
    final index = _brands.indexWhere((element) => element.id == brand.id);

    _brands.removeWhere((element) => element.id == brand.id);
    _brands.insert(index, brand);

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
