import 'package:backoffice/modules/core/use_case/use_case.dart';
import 'package:backoffice/modules/products/domain/models/offer_model.dart';
import 'package:backoffice/modules/products/domain/repository/offer_repository.dart';

abstract class UpdateOfferUseCase implements InputUseCase<void, Offer> {}

class UpdateOfferUseCaseImpl implements UpdateOfferUseCase {
  final OfferRepository _repository;

  UpdateOfferUseCaseImpl(this._repository);

  @override
  Future<void> execute(Offer input) async {
    return _repository.updateOffer(input);
  }
}
