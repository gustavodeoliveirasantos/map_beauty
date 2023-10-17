import 'package:mapbeauty/modules/product/services/dto/brand_dto.dart';

import '../../../core/domain/adapter.dart';
import '../models/brand.dart';

class BrandAdapter implements Adapter<Brand, BrandDTO> {
  @override
  Brand adapt(BrandDTO dto) {
    return Brand(id: dto.id, name: dto.name, imageName: dto.imageName);
  }
}
