import 'package:mapbeauty/modules/core/presentation/view_model/base_view_model.dart';
import 'package:mapbeauty/modules/product/domain/use_case/load_brands_use_case.dart';
import 'package:mapbeauty/modules/product/domain/use_case/load_products_by_brand_use_case.dart';
import 'package:mapbeauty/modules/product/domain/use_case/load_similar_products_use_case.dart';

import '../../domain/models/brand.dart';
import '../../domain/models/color_type.dart';
import '../../domain/models/product.dart';

class ProductViewModel extends BaseViewModel {
  late final LoadBrandsUseCase _loadBrandsUseCase;
  late final LoadProductsUseCase _loadProductsUseCase;
  late final LoadSimilarProductsUseCase _loadSimilarProductsUseCase;

  ProductViewModel({
    required LoadBrandsUseCase loadBrandsUseCase,
    required LoadProductsUseCase loadProductsUseCase,
    required LoadSimilarProductsUseCase loadSimilarProductsUseCase,
  })  : _loadBrandsUseCase = loadBrandsUseCase,
        _loadProductsUseCase = loadProductsUseCase,
        _loadSimilarProductsUseCase = loadSimilarProductsUseCase;

  Future<List<Brand>> loadBrands() async {
    return _loadBrandsUseCase.execute();
  }

  Future<List<Product>> loadProducts(int brandId) {
    return _loadProductsUseCase.execute(brandId);
  }

  Future<List<Product>> loadSimilarProductsUseCase(Product product, ColorType colorType) {
    final input = LoadSimilarProductsInput(product: product, colorType: colorType);
    return _loadSimilarProductsUseCase.execute(input);
  }
}
