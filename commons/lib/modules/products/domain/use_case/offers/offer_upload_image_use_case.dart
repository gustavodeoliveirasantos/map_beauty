import 'dart:typed_data';

import 'package:commons/modules/core/use_case/use_case.dart';
import 'package:commons/modules/products/domain/models/offer_model.dart';
import 'package:commons/modules/products/domain/repository/offer_repository.dart';

abstract class UploadOfferImageUseCase implements InputUseCase<void, UploadOfferImageUseCaseInput> {}

class UploadOfferImageUseCaseInput {
  final Offer offer;
  final String imageName;
  final Uint8List imageData;

  UploadOfferImageUseCaseInput({required this.offer, required this.imageName, required this.imageData});
}

class UploadOfferImageUseCaseImpl implements UploadOfferImageUseCase {
  final OfferRepository _repository;

  UploadOfferImageUseCaseImpl(this._repository);
  @override
  Future<void> execute(UploadOfferImageUseCaseInput input) async {
    return _repository.uploadOfferImage(input.offer, input.imageName, input.imageData);
  }
}
