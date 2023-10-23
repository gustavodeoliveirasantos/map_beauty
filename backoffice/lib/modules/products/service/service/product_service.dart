import 'package:backoffice/modules/products/domain/models/brand_model.dart';
import 'package:backoffice/modules/products/service/dto/brand_dto.dart';

abstract class ProductService {
  Future<List<BrandDTO>> getBrands();
}

class ProductServiceImpl implements ProductService {
  @override
  Future<List<BrandDTO>> getBrands() async {
    List<BrandDTO> list = [
      const BrandDTO(id: "1", name: "Avon", image: "avon_logo.png"),
      const BrandDTO(id: "2", name: "MAC", image: "mac_logo.png"),
      const BrandDTO(id: "3", name: "Boticario", image: "mac_logo.png"),
      const BrandDTO(id: "4", name: "Quem dice Berenice", image: "mac_logo.png"),
    ];

    return list;
  }
}
