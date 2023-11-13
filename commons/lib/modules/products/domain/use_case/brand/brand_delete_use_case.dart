import 'package:commons/modules/core/use_case/use_case.dart';
import 'package:commons/modules/products/domain/models/brand_model.dart';
import 'package:commons/modules/products/domain/repository/brand_repository.dart';

abstract class DeleteBrandUseCase implements InputUseCase<void, Brand> {}

class DeleteBrandUseCaseImpl implements DeleteBrandUseCase {
  final BrandRepository _repository;

  DeleteBrandUseCaseImpl(this._repository);

  @override
  Future<void> execute(Brand input) {
    return _repository.deleteBrand(input);
  }
}
