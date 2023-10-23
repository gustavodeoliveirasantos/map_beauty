import 'package:firebase_storage/firebase_storage.dart';

enum ImageType { logo, product }

class FirebaseStorageService {
  FirebaseStorage storage = FirebaseStorage.instanceFor(bucket: "gs://map-beauty-f8b01.appspot.com");

  static Map<String, String> _cachesUrl = {};

  static Future<String?> getImagePath(String? image, ImageType type) async {
    if (image == null) return null;
    try {
      final folder = type == ImageType.logo ? "logos" : "products";
      final firebaseStorageUrl = "gs://map-beauty-f8b01.appspot.com/$folder/$image";

      if (_cachesUrl.containsKey(image)) {
        return _cachesUrl[image];
      }

      final gsReference = FirebaseStorage.instance.refFromURL(firebaseStorageUrl);
      final url = await gsReference.getDownloadURL();
      _cachesUrl[image] = url;

      return url;
    } on FirebaseException catch (e) {
      print("Imagem não encontrada - $image");
      return null;
    }
  }
}
