import 'package:mapbeauty/modules/product/services/dto/brand_dto.dart';
import 'package:mapbeauty/modules/product/services/dummy_data.dart';

abstract class ProductStore {
  Future<List<BrandDTO>> loadBrandsAndProducts();
}

class ProductStoreImpl implements ProductStore {
  @override
  Future<List<BrandDTO>> loadBrandsAndProducts() async {
    return productsDummy;
  }
}
