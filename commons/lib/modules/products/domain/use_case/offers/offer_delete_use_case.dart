import 'package:commons/modules/core/use_case/use_case.dart';
import 'package:commons/modules/products/domain/models/offer_model.dart';
import 'package:commons/modules/products/domain/repository/offer_repository.dart';

abstract class DeleteOfferUseCase implements InputUseCase<void, Offer> {}

class DeleteOfferUseCaseImpl implements DeleteOfferUseCase {
  final OfferRepository _repository;

  DeleteOfferUseCaseImpl(this._repository);

  @override
  Future<void> execute(Offer input) async {
    return _repository.deleteOffer(input);
  }
}
