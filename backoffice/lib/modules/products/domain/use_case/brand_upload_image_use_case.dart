import 'dart:typed_data';

import 'package:backoffice/modules/core/use_case/use_case.dart';
import 'package:backoffice/modules/products/domain/models/brand_model.dart';
import 'package:backoffice/modules/products/domain/repository/brand_repository.dart';

class UploadImageBrandUseCaseInput {
  final Brand brand;
  final Uint8List imageData;
  final String oldImageName;

  UploadImageBrandUseCaseInput({required this.brand, required this.imageData, required this.oldImageName});
}

abstract class UploadImageBrandUseCase implements InputUseCase<void, UploadImageBrandUseCaseInput> {}

class UploadImageBrandUseCaseImpl implements UploadImageBrandUseCase {
  final BrandRepository repository;

  UploadImageBrandUseCaseImpl({required this.repository});

  @override
  Future<void> execute(UploadImageBrandUseCaseInput input) async {
    return await repository.uploadBrandImage(input.brand, input.imageData, input.oldImageName);
  }
}
