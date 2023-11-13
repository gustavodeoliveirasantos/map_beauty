import 'package:mapbeauty/modules/product/domain/adapters/brand_adapter.dart';
import 'package:mapbeauty/modules/product/domain/adapters/product_adapter.dart';
import 'package:mapbeauty/modules/product/services/store/product_store.dart';
import 'package:mapbeauty/modules/product/domain/models/brand.dart';
import 'package:mapbeauty/modules/product/domain/models/color_type.dart';
import 'package:mapbeauty/modules/product/domain/models/product.dart';

abstract class ProductRepository {
  Future<List<Product>> loadProductsByBrand(int brandId);
  Future<List<Brand>> loadBrands();
  Future<List<Product>> loadSimilarProducts(Product product, ColorType colorType);
}

class Products {}

class ProductRepositoryImpl implements ProductRepository {
  ProductStore _store;
  ProductRepositoryImpl({required ProductStore store}) : _store = store;

  @override
  Future<List<Brand>> loadBrands() async {
    final brandsDTO = await _store.loadBrandsAndProducts();
    return brandsDTO.map((brandDTO) => BrandAdapter().adapt(brandDTO)).toList();
  }

  @override
  Future<List<Product>> loadProductsByBrand(int brandId) async {
    final brandsDTO = await _store.loadBrandsAndProducts();
    final brandDTO = brandsDTO.firstWhere((element) => element.id == brandId);
    final productsDTO = brandDTO.products;
    final brand = BrandAdapter().adapt(brandDTO);

    var list = productsDTO.map((productDTO) => ProductAdapter().adapt(ProductAdapterInput(dto: productDTO, brand: brand))).toList();

    return list;
  }

  @override
  Future<List<Product>> loadSimilarProducts(Product product, ColorType colorType) async {
    final brandsDTO = await _store.loadBrandsAndProducts();
    List<Product> list = [];
    for (final brandDTO in brandsDTO) {
      final brand = BrandAdapter().adapt(brandDTO);
      for (final productDTO in brandDTO.products) {
        for (final productColorDTO in productDTO.productColors) {
          if (colorType.id == productColorDTO.colorType.id) {
            list.add(
              ProductAdapter().adapt(ProductAdapterInput(dto: productDTO, brand: brand)),
            );
          }
        }
      }
    }

    return list;
  }
}
