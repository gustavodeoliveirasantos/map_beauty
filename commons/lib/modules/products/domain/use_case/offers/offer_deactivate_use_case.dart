import 'package:commons/modules/core/use_case/use_case.dart';
import 'package:commons/modules/products/domain/repository/offer_repository.dart';

abstract class DeactivateOffersUseCase implements InputUseCase<void, List<String>> {}

class DeactivateOffersUseCaseImpl implements DeactivateOffersUseCase {
  final OfferRepository _repository;

  DeactivateOffersUseCaseImpl(this._repository);

  @override
  Future<void> execute(List<String> input) async {
    return _repository.deactivateOffers(input);
  }
}
