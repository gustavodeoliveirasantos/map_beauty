import 'package:commons/modules/firebase_service/firebase_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:mapbeauty/modules/product/presentation/components/firebase_storage_image_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductImagesCarouselWidget extends StatefulWidget {
  final List<String> images;
  final double height;
  final double width;
  final bool hasBorder;
  const ProductImagesCarouselWidget({super.key, required this.images, required this.height, required this.width, required this.hasBorder});

  @override
  State<ProductImagesCarouselWidget> createState() => _ProductImagesCarouselWidgetState();
}

class _ProductImagesCarouselWidgetState extends State<ProductImagesCarouselWidget> {
  PageController pageController = PageController(initialPage: 0, viewportFraction: 1, keepPage: true);

  @override
  void didUpdateWidget(covariant ProductImagesCarouselWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    pageController.jumpToPage(0);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: widget.height,
          width: widget.width,
          decoration: widget.hasBorder
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  //   color: Colors.black,
                  border: Border.all(width: 0.3),
                )
              : null,
          child: ClipRRect(
            borderRadius: widget.hasBorder ? BorderRadius.circular(12.0) : BorderRadius.circular(0),
            child: NotificationListener(
              onNotification: (_) => true,
              child: PageView.builder(
                controller: pageController,
                itemCount: widget.images?.length,
                itemBuilder: (context, index) {
                  final imageName = widget.images?[index];
                  return Center(
                    child: FirebaseStorageImageWidget(
                      imageFolder: ImageFolder.product,
                      imageName: imageName,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        if (widget.images.isNotEmpty)
          SmoothPageIndicator(
              controller: pageController,
              count: widget.images.length,
              effect: ScrollingDotsEffect(
                dotColor: Theme.of(context).colorScheme.secondary,
                activeDotColor: Theme.of(context).colorScheme.primary,
                activeStrokeWidth: 2.6,
                activeDotScale: 1.3,
                maxVisibleDots: 5,
                radius: 3,
                spacing: 6,
                dotHeight: 6,
                dotWidth: 6,
              )),
      ],
    );
  }
}
