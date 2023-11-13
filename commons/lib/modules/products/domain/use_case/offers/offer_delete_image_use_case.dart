import 'package:commons/modules/core/use_case/use_case.dart';
import 'package:commons/modules/products/domain/models/offer_model.dart';
import 'package:commons/modules/products/domain/repository/offer_repository.dart';

class DeleteOfferImageInput {
  final String imageName;
  final Offer offer;

  DeleteOfferImageInput({required this.imageName, required this.offer});
}

abstract class DeleteOfferImageUseCase implements InputUseCase<void, DeleteOfferImageInput> {}

class DeleteOfferImageUseCaseImpl implements DeleteOfferImageUseCase {
  final OfferRepository _repository;

  DeleteOfferImageUseCaseImpl(this._repository);

  @override
  Future<void> execute(DeleteOfferImageInput input) async {
    return _repository.deleteImage(input.offer, input.imageName);
  }
}
