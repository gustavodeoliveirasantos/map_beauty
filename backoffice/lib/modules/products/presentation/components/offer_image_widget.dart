import 'package:backoffice/modules/products/presentation/components/firebase_storage_image_widget.dart';
import 'package:commons/modules/firebase_service/firebase_storage_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OfferImageWidget extends StatelessWidget {
  final String imageName;
  final Function(String) onDeleteTapped;
  const OfferImageWidget({super.key, required this.imageName, required this.onDeleteTapped});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FirebaseStorageImageWidget(height: 240, imageName: imageName, imageType: ImageFolder.offersProducts),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: CircleAvatar(
              radius: 14,
              child: IconButton(
                iconSize: 12,
                onPressed: () => onDeleteTapped(imageName),
                icon: const Icon(Icons.close),
                // color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
