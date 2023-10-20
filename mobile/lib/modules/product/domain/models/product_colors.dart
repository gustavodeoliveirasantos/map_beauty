import 'color_type.dart';

class ProductColor {
  final int id;
  final String brandColorName;
  final ColorType colorType;
  final String buyUrl;
  final List<String>? images;

  ProductColor(this.id, this.brandColorName, this.colorType, this.buyUrl, this.images);
}
