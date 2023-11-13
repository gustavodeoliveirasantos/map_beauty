import 'package:backoffice/modules/core/use_case/use_case.dart';
import 'package:backoffice/modules/products/domain/models/offer_model.dart';
import 'package:backoffice/modules/products/domain/repository/offer_repository.dart';

abstract class AddOfferUseCase implements InputUseCase<void, Offer> {}

class AddOfferUseCaseImpl implements AddOfferUseCase {
  final OfferRepository _repository;

  AddOfferUseCaseImpl(this._repository);

  @override
  Future<void> execute(Offer input) async {
    throw Exception("lalal");
    return _repository.addOffer(input);
  }
}
