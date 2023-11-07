import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

enum ImageFolder { logo, product, offersProducts }

abstract class FirebaseStorageService {
  Future<String?> getImagePath(String? imageName, ImageFolder imageFolder);
  Future<void> uploadImage(Uint8List imageData, String imageName, ImageFolder imageFolder);
  Future<void> deleteImage(String imageName, ImageFolder imageFolder);
}

class FirebaseStorageServiceImpl implements FirebaseStorageService {
  final FirebaseStorage _firebaseStorage;

  final Map<String, String> _cachesUrl = {};
  FirebaseStorageServiceImpl(
    this._firebaseStorage,
  );

  /// Para funcionar no web temos que mudar o web renderer para HTML https://docs.flutter.dev/platform-integration/web/renderers ou implantar essa outra configuração
  ///https://stackoverflow.com/questions/76547630/exception-caught-by-image-resource-service-object-progressevent
  @override
  Future<String?> getImagePath(String? imageName, ImageFolder imageFolder) async {
    if (imageName == null) return null;
    try {
      final folder = _getFolder(imageFolder);
      final firebaseStorageUrl = "gs://map-beauty-f8b01.appspot.com/$folder/$imageName";

      if (_cachesUrl.containsKey(imageName)) {
        return _cachesUrl[imageName];
      }

      final gsReference = _firebaseStorage.refFromURL(firebaseStorageUrl);
      final url = await gsReference.getDownloadURL();
      _cachesUrl[imageName] = url;
      return url;
    } on FirebaseException catch (e) {
      debugPrint("Imagem não encontrada - $imageName -> ${e.message}");
      return null;
    }
  }

  @override
  Future<void> uploadImage(Uint8List imageData, String imageName, ImageFolder imageFolder) async {
    final folder = _getFolder(imageFolder);

    final storageRef = _firebaseStorage.ref();
    final mountainsRef = storageRef.child("$folder/$imageName");

    try {
      await mountainsRef.putData(imageData);
      final url = await mountainsRef.getDownloadURL();
      _cachesUrl[imageName] = url;

      debugPrint("GOS -  Subui a imagem");
    } on FirebaseException catch (e) {
      debugPrint("Não subiu a imagem - ${e.message}");

      Future.error("Erro ao fazer upload da imagem");
    }
  }

  @override
  Future<void> deleteImage(String imageName, ImageFolder imageFolder) async {
    final folder = _getFolder(imageFolder);

    final storageRef = _firebaseStorage.ref();
    final mountainsRef = storageRef.child("$folder/$imageName");
    try {
      await mountainsRef.delete();
      debugPrint("GOS -  Excluiu a Imagem");
    } on FirebaseException catch (e) {
      debugPrint("Não subiu a imagem - ${e.message}");

      Future.error("Erro ao apagar a imagem");
    } catch (ex2) {
      debugPrint("GOS - Erro ao excluir a imagem : ${ex2.toString()} ");
    }
  }

  String _getFolder(ImageFolder folder) {
    switch (folder) {
      case ImageFolder.logo:
        return "logos";
      case ImageFolder.product:
        return "products";
      case ImageFolder.offersProducts:
        return "offers_products";
    }
  }
}
