import 'package:backoffice/modules/products/presentation/components/firebase_storage_image_widget.dart';
import 'package:commons/modules/firebase_service/firebase_storage_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OfferImageWidget extends StatelessWidget {
  final String imageName;
  final bool isMainImage;
  final Function(String) onDeleteTapped;
  final Function(String) onUpdateMainImageTapped;
  const OfferImageWidget({super.key, required this.imageName, required this.onDeleteTapped, required this.isMainImage, required this.onUpdateMainImageTapped});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(border: Border.all(width: isMainImage ? 2 : 0.5, color: isMainImage ? Theme.of(context).colorScheme.primary : Colors.black)),
                  child: FirebaseStorageImageWidget(height: 240, width: 200, imageName: imageName, imageType: ImageFolder.offersProducts),
                ),
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
          ElevatedButton(onPressed: isMainImage ? null : () => onUpdateMainImageTapped(imageName), child: Text("Image principal")),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
