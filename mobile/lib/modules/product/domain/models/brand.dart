// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mapbeauty/modules/product/domain/models/product.dart';

class Brand {
  final int id;
  final String name;
  final String? imageName;
  const Brand({
    required this.id,
    required this.name,
    required this.imageName,
  });
}
