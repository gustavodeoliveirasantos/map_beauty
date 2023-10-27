import 'package:backoffice/modules/core/use_case/use_case.dart';
import 'package:backoffice/modules/products/domain/models/brand_model.dart';
import 'package:backoffice/modules/products/domain/repository/brand_repository.dart';

abstract class GetBrandsUseCase implements UseCase<List<Brand>> {}

class GetBrandsUseCaseImpl implements GetBrandsUseCase {
  final BrandRepository repository;

  GetBrandsUseCaseImpl({required this.repository});

  @override
  Future<List<Brand>> execute() {
    return repository.getBrands();
  }
}
