import 'package:mapbeauty/modules/make_up_search/data/models/brand_dto.dart';
import 'package:mapbeauty/modules/make_up_search/data/dummy_data.dart';

abstract class ProductStore {
  Future<List<BrandDTO>> loadBrandsAndProducts();
}

class ProductStoreImpl implements ProductStore {
  @override
  Future<List<BrandDTO>> loadBrandsAndProducts() async {
    return productsDummy;
  }
}
