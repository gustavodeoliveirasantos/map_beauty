import 'dart:typed_data';

import 'package:commons/modules/core/use_case/use_case.dart';
import 'package:commons/modules/products/domain/models/brand_model.dart';
import 'package:commons/modules/products/domain/repository/brand_repository.dart';

abstract class AddBrandUseCase implements InputUseCase<void, AddBrandUseCaseInput> {}

class AddBrandUseCaseInput {
  final Brand brand;
  final Uint8List imageData;

  AddBrandUseCaseInput({required this.brand, required this.imageData});
}

class AddBrandUseCaseImpl implements AddBrandUseCase {
  final BrandRepository _repository;

  AddBrandUseCaseImpl(this._repository);

  @override
  Future<void> execute(AddBrandUseCaseInput input) async {
    await _repository.uploadBrandImage(input.brand, input.imageData, null);
    return _repository.addBrand(input.brand);
  }
}
