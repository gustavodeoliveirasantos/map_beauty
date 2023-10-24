import 'package:backoffice/modules/core/use_case/use_case.dart';
import 'package:backoffice/modules/products/domain/models/brand_model.dart';
import 'package:backoffice/modules/products/domain/repository/brand_repository.dart';

abstract class AddBrandUseCase implements InputUseCase<void, Brand> {}

class AddBrandUseCaseImpl implements AddBrandUseCase {
  final ProductRepository _repository = ProductRepositoryImpl();

  @override
  Future<void> execute(Brand input) {
    return _repository.addBrand(input);
  }
}
