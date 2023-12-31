import 'package:commons/modules/core/use_case/use_case.dart';
import 'package:commons/modules/products/domain/models/brand_model.dart';
import 'package:commons/modules/products/domain/repository/brand_repository.dart';

abstract class UpdateBrandUseCase implements InputUseCase<void, Brand> {}

class UpdateBrandUseCaseImpl implements UpdateBrandUseCase {
  final BrandRepository _repository;

  UpdateBrandUseCaseImpl(this._repository);

  @override
  Future<void> execute(Brand input) {
    return _repository.updateBrand(input);
  }
}
