import 'package:commons/modules/core/use_case/use_case.dart';
import 'package:commons/modules/products/domain/models/brand_model.dart';
import 'package:commons/modules/products/domain/repository/brand_repository.dart';

abstract class GetBrandsUseCase implements UseCase<List<Brand>> {}

class GetBrandsUseCaseImpl implements GetBrandsUseCase {
  final BrandRepository _repository;

  GetBrandsUseCaseImpl(this._repository);

  @override
  Future<List<Brand>> execute() {
    return _repository.getBrands();
  }
}
