import 'package:backoffice/modules/core/use_case/use_case.dart';
import 'package:backoffice/modules/products/domain/models/offer_model.dart';
import 'package:backoffice/modules/products/domain/repository/offer_repository.dart';

abstract class GetOffersImageUseCase implements UseCase<List<Offer>> {}

class GetOffersImageUseCaseImpl implements GetOffersImageUseCase {
  final OfferRepository _repository;

  GetOffersImageUseCaseImpl(this._repository);

  @override
  Future<List<Offer>> execute() {
    return _repository.getOffers();
  }
}
