import 'dart:typed_data';

import 'package:commons/modules/core/utils/utils.dart';
import 'package:commons/modules/products/domain/models/brand_model.dart';
import 'package:commons/modules/products/domain/use_case/brand/brand_add_use_case.dart';
import 'package:commons/modules/products/domain/use_case/brand/brand_delete_use_case.dart';
import 'package:commons/modules/products/domain/use_case/brand/brand_get_use_case.dart';
import 'package:commons/modules/products/domain/use_case/brand/brand_update_use_case.dart';
import 'package:commons/modules/products/domain/use_case/brand/brand_upload_image_use_case.dart';
import 'package:flutter/material.dart';

class BrandViewModel extends ChangeNotifier {
  late final GetBrandsUseCase _getBrandsUseCase;
  late final AddBrandUseCase _addBrandUseCase;
  late final UpdateBrandUseCase _updateBrandUseCase;
  late final UploadImageBrandUseCase _updateImageBrandUseCase;
  late final DeleteBrandUseCase _deleteBrandUseCase;

  BrandViewModel({
    required GetBrandsUseCase getBrandsUseCase,
    required AddBrandUseCase addBrandUseCase,
    required UpdateBrandUseCase updateBrandUseCase,
    required UploadImageBrandUseCase updateImageBrandUseCase,
    required DeleteBrandUseCase deleteBrandUseCase,
  })  : _deleteBrandUseCase = deleteBrandUseCase,
        _updateImageBrandUseCase = updateImageBrandUseCase,
        _updateBrandUseCase = updateBrandUseCase,
        _addBrandUseCase = addBrandUseCase,
        _getBrandsUseCase = getBrandsUseCase {
    loadBrands();
  }

  List<Brand> _brands = [];
  List<Brand> get brands => [..._brands];

  Future<void> loadBrands() async {
    if (_brands.isNotEmpty) return;

    _brands = await _getBrandsUseCase.execute();
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

  Brand? getBrandById(String id) {
    final brands = _brands.where((element) => element.id == id).toList();
    if (brands.isEmpty) return null;

    return brands.first;
  }

  Future<Brand> addBrandAndUpdateImage(String name, Uint8List imageData, String imageName) async {
    final id = Utils.uuid();
    final finalImageName = "${id}_$imageName";
    final brand = Brand(id: id, name: name, image: finalImageName);

    await _addBrandUseCase.execute(AddBrandUseCaseInput(brand: brand, imageData: imageData));
    _brands.add(brand);
    _sortBrands();

    return brand;
  }

  Future<void> updateBrandImage(Brand brand, Uint8List imageData, String imageName) async {
    final String oldImageName = brand.image;

    final finalImageName = "${brand.id}_$imageName";

    final updatedBrand = brand.copyWith(image: finalImageName);

    await updateBrand(updatedBrand, false).onError((error, stackTrace) => debugPrint("GOS deu erro no update?"));
    await _updateImageBrandUseCase.execute(UploadImageBrandUseCaseInput(brand: brand, imageData: imageData, oldImageName: oldImageName));

    notifyListeners();
  }

  Future<void> updateBrand(Brand brand, [bool shouldNotify = true]) async {
    await _updateBrandUseCase.execute(brand);
    final index = _brands.indexWhere((element) => element.id == brand.id);

    _brands.removeWhere((element) => element.id == brand.id);
    _brands.insert(index, brand);

    if (shouldNotify) {
      notifyListeners();
    }
  }

  Future<void> deleteBrand(Brand brand) async {
    await _deleteBrandUseCase.execute(brand);

    _brands.remove(brand);

    notifyListeners();
  }
}
