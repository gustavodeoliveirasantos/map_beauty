import 'package:commons/modules/core/use_case/use_case.dart';
import 'package:commons/modules/products/domain/models/offer_model.dart';
import 'package:commons/modules/products/domain/repository/offer_repository.dart';

abstract class AddOfferUseCase implements InputUseCase<void, Offer> {}

class AddOfferUseCaseImpl implements AddOfferUseCase {
  final OfferRepository _repository;

  AddOfferUseCaseImpl(this._repository);

  @override
  Future<void> execute(Offer input) async {
    return _repository.addOffer(input);
  }
}
