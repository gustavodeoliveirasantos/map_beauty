import 'package:backoffice/modules/core/use_case/use_case.dart';
import 'package:backoffice/modules/products/domain/models/brand_model.dart';
import 'package:backoffice/modules/products/domain/repository/brand_repository.dart';

abstract class UpdateBrandUseCase implements InputUseCase<void, Brand> {}

class UpdateBrandUseCaseImpl implements UpdateBrandUseCase {
  final ProductRepository _repository = ProductRepositoryImpl();

  @override
  Future<void> execute(Brand input) {
    return _repository.updateBrand(input);
  }
}
