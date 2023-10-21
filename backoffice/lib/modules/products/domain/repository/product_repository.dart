import 'package:backoffice/modules/products/domain/adapters/brand_adapter.dart';
import 'package:backoffice/modules/products/domain/models/brand_model.dart';
import 'package:backoffice/modules/products/service/service/product_service.dart';

abstract class ProductRepository {
  Future<List<Brand>> getBrands();
  Future<void> addBrand(Brand brand);
  Future<void> update(Brand brand);
  Future<void> delete(int brandId);
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
    // TODO: implement addBrand
    throw UnimplementedError();
  }

  @override
  Future<void> delete(int brandId) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<void> update(Brand brand) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
