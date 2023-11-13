// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mapbeauty/modules/product/domain/models/color_type.dart';
import 'package:mapbeauty/modules/product/domain/repository/product_repository.dart';

import '../../../core/use_case/use_case.dart';
import '../models/product.dart';

class LoadSimilarProductsInput {
  final Product product;
  final ColorType colorType;
  const LoadSimilarProductsInput({
    required this.product,
    required this.colorType,
  });
}

abstract class LoadSimilarProductsUseCase implements InputUseCase<List<Product>, LoadSimilarProductsInput> {
  @override
  Future<List<Product>> execute(LoadSimilarProductsInput input);
}

class LoadSimilarProductsUseCaseImpl implements LoadSimilarProductsUseCase {
  final ProductRepository _repository;
  LoadSimilarProductsUseCaseImpl({required ProductRepository repository}) : _repository = repository;

  @override
  Future<List<Product>> execute(LoadSimilarProductsInput input) {
    return _repository.loadSimilarProducts(input.product, input.colorType);
  }
}
