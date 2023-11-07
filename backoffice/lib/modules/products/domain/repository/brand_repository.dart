import 'dart:typed_data';

import 'package:backoffice/modules/firebase_service/firebase_storage_service.dart';
import 'package:backoffice/modules/products/service/adapters/brand_adapter.dart';
import 'package:backoffice/modules/products/domain/models/brand_model.dart';
import 'package:backoffice/modules/products/service/service/brand_service.dart';

abstract class BrandRepository {
  Future<List<Brand>> getBrands();
  Future<void> addBrand(Brand brand);
  Future<void> updateBrand(Brand brand);
  Future<void> uploadBrandImage(Brand brand, Uint8List imageData, String? oldImageName);
  Future<void> deleteBrand(Brand brand);
}

class BrandRepositoryImpl implements BrandRepository {
  final BrandService _service;
  final FirebaseStorageService _firebaseStorageService;

  BrandRepositoryImpl(this._service, this._firebaseStorageService);

  @override
  Future<List<Brand>> getBrands() async {
    final brandsDTO = await _service.getBrands();
    List<Brand> list = [];
    for (var dto in brandsDTO) {
      list.add(BrandAdapter().adapt(dto));
    }

    return list;
  }

  @override
  Future<void> addBrand(Brand brand) {
    return _service.addBrand(BrandAdapter().adaptToDTO(brand));
  }

  @override
  Future<void> updateBrand(Brand brand) {
    return _service.updateBrand(BrandAdapter().adaptToDTO(brand));
  }

  @override
  Future<void> uploadBrandImage(Brand brand, Uint8List imageData, String? oldImageName) async {
    await _firebaseStorageService.uploadImage(imageData, brand.image, ImageFolder.logo);

    final brandDTO = BrandAdapter().adaptToDTO(brand);
    await _service.updateBrand(brandDTO);

    if (oldImageName != null && oldImageName != brand.image) {
      _deleteBrandImage(oldImageName);
    }
  }

  @override
  Future<void> deleteBrand(Brand brand) async {
    await _service.deleteBrand(brand.id);
    await _deleteBrandImage(brand.image);
  }

  Future<void> _deleteBrandImage(String imageName) {
    return _firebaseStorageService.deleteImage(imageName, ImageFolder.logo);
  }
}
