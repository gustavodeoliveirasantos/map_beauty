import 'dart:typed_data';
import 'package:backoffice/modules/core/use_case/use_case.dart';
import 'package:backoffice/modules/products/domain/models/offer_model.dart';
import 'package:backoffice/modules/products/domain/repository/offer_repository.dart';

abstract class UploadOfferImageUseCase implements InputUseCase<void, Offer> {}

class UploadOfferImageUseCaseInput {
  final Offer offer;
  final Uint8List imageData;

  UploadOfferImageUseCaseInput({required this.offer, required this.imageData});
}

class UploadOfferImageUseCaseImpl implements UploadOfferImageUseCase {
  final OfferRepository _repository;

  UploadOfferImageUseCaseImpl(this._repository);
  @override
  Future<void> execute(Offer input) async {
    return _repository.addOffer(input);
  }
}
