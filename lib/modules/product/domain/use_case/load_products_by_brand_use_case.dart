import 'package:mapbeauty/modules/product/domain/repository/product_repository.dart';
import '../../../core/use_case/use_case.dart';
import '../models/product.dart';

abstract class LoadProductsUseCase implements InputUseCase<List<Product>, String> {
  @override
  Future<List<Product>> execute(String input);
}

class LoadProductsUseCaseImpl implements LoadProductsUseCase {
  final ProductRepository _repository = ProductRepositoryImpl();

  @override
  Future<List<Product>> execute(String input) {
    return _repository.loadProductsByBrand(input);
  }
}
