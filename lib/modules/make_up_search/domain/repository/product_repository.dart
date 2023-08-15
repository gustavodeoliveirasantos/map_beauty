import 'package:mapbeauty/modules/make_up_search/data/models/brand_dto.dart';
import 'package:mapbeauty/modules/make_up_search/data/models/product_dto.dart';
import 'package:mapbeauty/modules/make_up_search/data/dummy_data.dart';
import 'package:mapbeauty/modules/make_up_search/data/store/product_store.dart';
import 'package:mapbeauty/modules/make_up_search/domain/models/brand.dart';
import 'package:mapbeauty/modules/make_up_search/domain/models/color_type.dart';
import 'package:mapbeauty/modules/make_up_search/domain/models/product.dart';
import 'package:mapbeauty/modules/make_up_search/domain/models/product_colors.dart';
import 'package:mapbeauty/modules/make_up_search/domain/models/product_type.dart';

abstract class ProductRepository {
  Future<List<Product>> loadProductsByBrand(String brandId);
  Future<List<Brand>> loadBrands();
  Future<List<Product>> loadSimilarProducts(Product product, ColorType colorType);
}

class Products {}

class ProductRepositoryImpl implements ProductRepository {
  ProductStore _store = ProductStoreImpl();

  @override
  Future<List<Brand>> loadBrands() async {
    final brands = await _store.loadBrandsAndProducts();
    List<Brand> list = [];

    return brands.map((brand) => Brand(id: brand.id, name: brand.name, imageUrl: brand.imageUrl)).toList();
  }

  @override
  Future<List<Product>> loadProductsByBrand(String brandId) async {
    final brandsDTO = await _store.loadBrandsAndProducts();
    final brandDTO = brandsDTO.firstWhere((element) => element.id == brandId);
    final productsDTO = brandDTO.products;
    final brand = Brand(id: brandDTO.id, name: brandDTO.name, imageUrl: brandDTO.imageUrl);

    var list = productsDTO
        .map((productDTO) => _convertProductFromDTO(
              productDTO,
              brand,
            ))
        .toList();

    return list;
  }

  @override
  Future<List<Product>> loadSimilarProducts(Product product, ColorType colorType) async {
    final brandsDTO = await _store.loadBrandsAndProducts();
    List<Product> list = [];
    for (final brandDTO in brandsDTO) {
      final brand = _converBrandFromDTO(brandDTO);
      for (final productDTO in brandDTO.products) {
        for (final productColorDTO in productDTO.productColors) {
          if (colorType.id == productColorDTO.id) {
            list.add(_convertProductFromDTO(productDTO, brand));
          }
        }
      }
    }

    return list;
  }

  Brand _converBrandFromDTO(BrandDTO brandDTO) {
    return Brand(id: brandDTO.id, name: brandDTO.name, imageUrl: brandDTO.imageUrl);
  }

  Product _convertProductFromDTO(ProductDTO productDTO, Brand brand) {
    return Product(
      id: productDTO.id,
      name: productDTO.name,
      brand: brand,
      productType: ProductType(id: productDTO.productType.id, type: productDTO.productType.type),
      productColors: productDTO.productColors.map((e) {
        return ProductColors(
          e.id,
          e.brandColor,
          ColorType(id: e.color.id, color: e.color.color, hexCode: e.color.hexCode),
          e.buyUrl,
        );
      }).toList(),
    );
  }
}
