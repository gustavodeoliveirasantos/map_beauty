import 'package:commons/modules/core/use_case/use_case.dart';
import 'package:commons/modules/products/domain/models/offer_model.dart';
import 'package:commons/modules/products/domain/repository/offer_repository.dart';

abstract class UpdateMainImageUseCase implements InputUseCase<void, UpdateMainImageUseCaseInput> {}

class UpdateMainImageUseCaseInput {
  final Offer offer;
  final String imageName;

  UpdateMainImageUseCaseInput({required this.offer, required this.imageName});
}

class UpdateMainImageUseCaseImpl implements UpdateMainImageUseCase {
  final OfferRepository _repository;

  UpdateMainImageUseCaseImpl(this._repository);
  @override
  Future<void> execute(UpdateMainImageUseCaseInput input) async {
    return _repository.updateMainImage(input.offer, input.imageName);
  }
}
