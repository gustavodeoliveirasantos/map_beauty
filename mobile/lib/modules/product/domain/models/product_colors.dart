import 'color_type.dart';

class ProductColor {
  final String id;
  final String brandColorName;
  final ColorType colorType;
  final String buyUrl;
  final String? imageName;

  ProductColor(this.id, this.brandColorName, this.colorType, this.buyUrl, this.imageName);
}
