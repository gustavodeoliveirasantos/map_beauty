import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

enum ImageFolder { logo, product }

class FirebaseStorageService {
  FirebaseStorage storage = FirebaseStorage.instanceFor(bucket: "gs://map-beauty-f8b01.appspot.com");

  static Map<String, String> _cachesUrl = {};

  /// Para funcionar no web temos que mudar o web renderer para HTML https://docs.flutter.dev/platform-integration/web/renderers ou implantar essa outra configuração
  ///https://stackoverflow.com/questions/76547630/exception-caught-by-image-resource-service-object-progressevent
  static Future<String?> getImagePath(String? imageName, ImageFolder imageFolder) async {
    if (imageName == null) return null;
    try {
      final folder = imageFolder == ImageFolder.logo ? "logos" : "products";
      final firebaseStorageUrl = "gs://map-beauty-f8b01.appspot.com/$folder/$imageName";

      if (_cachesUrl.containsKey(imageName)) {
        return _cachesUrl[imageName];
      }

      final gsReference = FirebaseStorage.instance.refFromURL(firebaseStorageUrl);
      final url = await gsReference.getDownloadURL();
      _cachesUrl[imageName] = url;

      return url;
    } on FirebaseException catch (e) {
      print("Imagem não encontrada - $imageName");
      return null;
    }
  }

  static Future<void> addNewImage(Uint8List imageData, String imageName, ImageFolder imageFolder) async {
    final folder = imageFolder == ImageFolder.logo ? "logos" : "products";

    final storageRef = FirebaseStorage.instance.ref();
    final mountainsRef = storageRef.child("$folder/$imageName");

    try {
      await mountainsRef.putData(imageData);
      final url = await mountainsRef.getDownloadURL();
      _cachesUrl[imageName] = url;

      print("GOS -  Subui a imagem");
    } on FirebaseException catch (e) {
      print("Não subiu a imagem");

      Future.error("Erro ao fazer upload da imagem");
    }
  }

  static Future<void> deleteImage(String imageName, ImageFolder imageFolder) async {
    final folder = imageFolder == ImageFolder.logo ? "logos" : "products";

    final storageRef = FirebaseStorage.instance.ref();
    final mountainsRef = storageRef.child("$folder/$imageName");
    try {
      await mountainsRef.delete();
      print("GOS -  Excluiru a Imagem");
    } on FirebaseException catch (e) {
      print("Não subiu a imagem");

      Future.error("Erro ao apagar a imagem");
    } catch (ex2) {
      print("GOS - O erro é : ");
    }
  }
}
