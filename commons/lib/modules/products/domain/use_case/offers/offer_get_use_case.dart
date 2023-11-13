import 'package:commons/modules/core/use_case/use_case.dart';
import 'package:commons/modules/products/domain/models/offer_model.dart';
import 'package:commons/modules/products/domain/repository/offer_repository.dart';

abstract class GetOffersUseCase implements UseCase<List<Offer>> {}

class GetOffersUseCaseImpl implements GetOffersUseCase {
  final OfferRepository _repository;

  GetOffersUseCaseImpl(this._repository);

  @override
  Future<List<Offer>> execute() {
    return _repository.getOffers();
  }
}
