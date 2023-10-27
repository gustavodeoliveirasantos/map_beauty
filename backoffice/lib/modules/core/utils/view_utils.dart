import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ViewUtils {
  static Future<Map<String, dynamic>?> getImageDataFromimagePicker() async {
    final imagePicker = ImagePicker();

    final XFile? pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage == null) {
      return null;
    } else {
      Uint8List imageData = await pickedImage.readAsBytes();
      return {"imageData": imageData, "imageName": pickedImage.name};

      // String fileName = path.basename(tmpFile.path);

      //  final imageURL = await vm.uploadImageToFirebaseStorage(imageData, pickedImage.name);
      //    print(imageURL);
    }
  }

  static Future<void> showConfirmAlert({
    required BuildContext context,
    required String title,
    required String description,
    String? confirmButtonText,
    String? cancelButtonText,
    void Function()? onConfirm,
    void Function()? onCancel,
  }) {
    var actions = [
      if (cancelButtonText != null)
        TextButton(
          onPressed: () {
            Navigator.pop(context, 'Cancel');
            onCancel?.call();
          },
          child: Text(
            cancelButtonText,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey),
          ),
        ),
      TextButton(
        onPressed: () {
          Navigator.pop(context);
          onConfirm?.call();
        },
        child: Text(
          confirmButtonText ?? 'Ok',
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    ];

    return showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text(title),
            content: Text(description),
            actions: actions,
          );
        });
  }
}
