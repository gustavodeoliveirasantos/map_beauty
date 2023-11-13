import 'package:mapbeauty/modules/product/domain/repository/product_repository.dart';

import '../../../core/use_case/use_case.dart';
import '../models/brand.dart';

abstract class LoadBrandsUseCase implements UseCase<List<Brand>> {
  @override
  Future<List<Brand>> execute();
}

class LoadBrandsUseCaseImpl implements LoadBrandsUseCase {
  final ProductRepository _repository;

  LoadBrandsUseCaseImpl({required ProductRepository repository}) : _repository = repository;

  @override
  Future<List<Brand>> execute() {
    return _repository.loadBrands();
  }
}
