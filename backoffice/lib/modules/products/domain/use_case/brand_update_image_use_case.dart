import 'dart:typed_data';

import 'package:backoffice/modules/core/use_case/use_case.dart';
import 'package:backoffice/modules/products/domain/models/brand_model.dart';
import 'package:backoffice/modules/products/domain/repository/brand_repository.dart';

class UpdateImageBrandUseCaseInput {
  final Brand brand;
  final Uint8List imageData;

  UpdateImageBrandUseCaseInput({required this.brand, required this.imageData});
}

abstract class UpdateImageBrandUseCase implements InputUseCase<String?, UpdateImageBrandUseCaseInput> {}

class UpdateImageBrandUseCaseImpl implements UpdateImageBrandUseCase {
  final ProductRepository _repository = ProductRepositoryImpl();

  @override
  Future<String?> execute(UpdateImageBrandUseCaseInput input) {
    return _repository.uploadBrandImage(input.brand, input.imageData);
  }
}
