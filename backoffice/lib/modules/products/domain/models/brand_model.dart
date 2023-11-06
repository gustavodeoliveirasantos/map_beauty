// ignore_for_file: public_member_api_docs, sort_constructors_first
class Brand {
  final String id;
  final String name;
  final String image;

  Brand({required this.id, required this.name, required this.image});

  Brand copyWith({
    String? id,
    String? name,
    String? image,
  }) {
    return Brand(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }
}
