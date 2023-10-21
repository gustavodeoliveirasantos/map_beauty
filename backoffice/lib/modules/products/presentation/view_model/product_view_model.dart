import 'package:backoffice/modules/products/domain/models/brand_model.dart';
import 'package:backoffice/modules/products/domain/use_case/get_brands_use_case.dart';

class ProductViewModel {
  final GetBrandsUseCase _getBrandsUseCase = GetBrandsUseCaseImpl();

  Future<List<Brand>> getBrands() {
    return _getBrandsUseCase.execute();
  }
}
