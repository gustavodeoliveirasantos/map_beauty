import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

enum ImageFolder { logo, product }

class FirebaseStorageService {
  FirebaseStorage storage = FirebaseStorage.instanceFor(bucket: "gs://map-beauty-f8b01.appspot.com");

  static Map<String, String> _cachesUrl = {};

  static Future<String?> getImagePath(String? image, ImageFolder imageFolder) async {
    if (image == null) return null;
    try {
      final folder = imageFolder == ImageFolder.logo ? "logos" : "products";
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

  static Future<String?> addNewImage(Uint8List imageData, String imageName, ImageFolder imageFolder) async {
    final folder = imageFolder == ImageFolder.logo ? "logos" : "products";

    final storageRef = FirebaseStorage.instance.ref();
    final mountainsRef = storageRef.child("$folder/$imageName");

    try {
      await mountainsRef.putData(imageData);
      return mountainsRef.getDownloadURL();
    } on FirebaseException catch (e) {
      print("Não subiu a imagem");

      Future.error("Erro ao fazer upload da imagem");
    }
    return null;
  }
}
