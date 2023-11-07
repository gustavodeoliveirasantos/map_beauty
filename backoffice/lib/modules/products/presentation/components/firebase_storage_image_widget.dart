import 'package:backoffice/modules/firebase_service/firebase_storage_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class FirebaseStorageImageWidget extends StatefulWidget {
  final String? imageName;
  final double? height;
  final double? width;
  final ImageFolder imageType;
  const FirebaseStorageImageWidget({super.key, required this.imageName, this.height, this.width, required this.imageType});

  @override
  State<FirebaseStorageImageWidget> createState() => _FirebaseStorageImageWidgetState();
}

class _FirebaseStorageImageWidgetState extends State<FirebaseStorageImageWidget> with AutomaticKeepAliveClientMixin {
  String? imageUrl;

  @override
  void initState() {
    super.initState();
    getImage();
  }

  @override
  void didUpdateWidget(covariant FirebaseStorageImageWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (mounted) getImage();
    debugPrint("FirebaseStorageImageWidget - didUpdateWidget");
  }

  void getImage() async {
    final firebaseStorageService = GetIt.instance<FirebaseStorageService>();

    imageUrl = await firebaseStorageService.getImagePath(widget.imageName, widget.imageType);
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return imageUrl == null
        ? SizedBox(
            height: widget.height,
            width: widget.width,
            child: const Icon(Icons.photo),
          )
        : CachedNetworkImage(
            imageUrl: imageUrl!,
            //TODO: https://www.youtube.com/watch?v=zEdw_1B7JHY&t=1s
            fit: BoxFit.cover,
            height: widget.height,
            width: widget.width,
            //  imageUrl: imageUrl!,
            //    placeholder: (context, url) => const Icon(Icons.photo),
            //   errorWidget: (context, url, error) => const Icon(Icons.error),
          );
  }

  @override
  bool get wantKeepAlive => true;
}
