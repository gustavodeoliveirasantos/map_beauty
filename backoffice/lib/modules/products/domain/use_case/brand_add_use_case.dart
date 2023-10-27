import 'package:backoffice/modules/core/use_case/use_case.dart';
import 'package:backoffice/modules/products/domain/models/brand_model.dart';
import 'package:backoffice/modules/products/domain/repository/brand_repository.dart';

abstract class AddBrandUseCase implements InputUseCase<void, Brand> {}

class AddBrandUseCaseImpl implements AddBrandUseCase {
  final BrandRepository repository;

  AddBrandUseCaseImpl({required this.repository});

  @override
  Future<void> execute(Brand input) {
    return repository.addBrand(input);
  }
}
