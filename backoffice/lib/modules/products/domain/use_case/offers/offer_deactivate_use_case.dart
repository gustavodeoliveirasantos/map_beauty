import 'package:backoffice/modules/core/use_case/use_case.dart';
import 'package:backoffice/modules/products/domain/models/offer_model.dart';
import 'package:backoffice/modules/products/domain/repository/offer_repository.dart';

abstract class DeactivateOffersUseCase implements InputUseCase<void, List<String>> {}

class DeactivateOffersUseCaseImpl implements DeactivateOffersUseCase {
  final OfferRepository _repository;

  DeactivateOffersUseCaseImpl(this._repository);

  @override
  Future<void> execute(List<String> input) async {
    return _repository.deactivateOffers(input);
  }
}
