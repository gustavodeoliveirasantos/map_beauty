import 'dart:typed_data';

import 'package:backoffice/modules/products/domain/adapters/brand_adapter.dart';
import 'package:backoffice/modules/products/domain/models/brand_model.dart';
import 'package:backoffice/modules/products/service/dto/brand_dto.dart';
import 'package:backoffice/modules/products/service/service/brand_service.dart';

abstract class ProductRepository {
  Future<List<Brand>> getBrands();
  Future<void> addBrand(Brand brand);
  Future<void> updateBrand(Brand brand);
  Future<String?> uploadBrandImage(Brand brand, Uint8List imageData);
  Future<void> deleteBrand(String brandId);
}

class ProductRepositoryImpl implements ProductRepository {
  ProductService _service = ProductServiceImpl();

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
  Future<String?> uploadBrandImage(Brand brand, Uint8List imageData) {
    final brandDTO = BrandAdapter().adaptToDTO(brand);
    return _service.uploadBrandImage(brandDTO, imageData);
  }

  @override
  Future<void> deleteBrand(String brandId) {
    return _service.deleteBrand(brandId);
  }
}
