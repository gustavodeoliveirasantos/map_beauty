import 'package:commons/modules/core/domain/adapter.dart';
import 'package:commons/modules/products/domain/models/brand_model.dart';
import 'package:commons/modules/products/service/dto/brand_dto.dart';

class BrandAdapter extends Adapter<Brand, BrandDTO> {
  @override
  Brand adapt(BrandDTO dto) {
    return Brand(id: dto.id, name: dto.name, image: dto.image ?? "");
  }

  @override
  BrandDTO adaptToDTO(Brand value) {
    return BrandDTO(id: value.id, name: value.name, image: value.image);
  }
}
