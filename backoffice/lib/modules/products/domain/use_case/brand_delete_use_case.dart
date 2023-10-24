import 'package:backoffice/modules/core/use_case/use_case.dart';
import 'package:backoffice/modules/products/domain/models/brand_model.dart';
import 'package:backoffice/modules/products/domain/repository/brand_repository.dart';

abstract class DeleteBrandUseCase implements InputUseCase<void, Brand> {}

class DeleteBrandUseCaseImpl implements DeleteBrandUseCase {
  final ProductRepository _repository = ProductRepositoryImpl();

  @override
  Future<void> execute(Brand input) {
    return _repository.deleteBrand(input.id);
  }
}
