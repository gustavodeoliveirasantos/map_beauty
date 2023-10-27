import 'dart:typed_data';

import 'package:backoffice/modules/products/domain/adapters/brand_adapter.dart';
import 'package:backoffice/modules/products/domain/models/brand_model.dart';
import 'package:backoffice/modules/products/service/dto/brand_dto.dart';
import 'package:backoffice/modules/products/service/service/brand_service.dart';

abstract class BrandRepository {
  Future<List<Brand>> getBrands();
  Future<void> addBrand(Brand brand);
  Future<void> updateBrand(Brand brand);
  Future<void> uploadBrandImage(Brand brand, Uint8List imageData, String oldImageName);
  Future<void> deleteBrand(Brand brand);
}

class BrandRepositoryImpl implements BrandRepository {
  late final BrandService service;

  BrandRepositoryImpl({required this.service});

  @override
  Future<List<Brand>> getBrands() async {
    final brandsDTO = await service.getBrands();
    List<Brand> list = [];
    for (var dto in brandsDTO) {
      list.add(BrandAdapter().adapt(dto));
    }

    return list;
  }

  @override
  Future<void> addBrand(Brand brand) {
    return service.addBrand(BrandAdapter().adaptToDTO(brand));
  }

  @override
  Future<void> updateBrand(Brand brand) {
    return service.updateBrand(BrandAdapter().adaptToDTO(brand));
  }

  @override
  Future<void> uploadBrandImage(Brand brand, Uint8List imageData, String oldImageName) async {
    final brandDTO = BrandAdapter().adaptToDTO(brand);
    await service.uploadBrandImage(brandDTO, imageData);
    service.deleteOldBrandImage(oldImageName);
  }

  @override
  Future<void> deleteBrand(Brand brand) async {
    await service.deleteBrand(brand.id);
    service.deleteOldBrandImage(brand.image);
  }
}
