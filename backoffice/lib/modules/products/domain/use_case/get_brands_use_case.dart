import 'package:backoffice/modules/core/use_case/use_case.dart';
import 'package:backoffice/modules/products/domain/models/brand_model.dart';
import 'package:backoffice/modules/products/domain/repository/product_repository.dart';

abstract class GetBrandsUseCase implements UseCase<List<Brand>> {}

class GetBrandsUseCaseImpl implements GetBrandsUseCase {
  final ProductRepository _repository = ProductRepositoryImpl();

  @override
  Future<List<Brand>> execute() {
    return _repository.getBrands();
  }
}
