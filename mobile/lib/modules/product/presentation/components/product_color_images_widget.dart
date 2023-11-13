import 'package:commons/modules/firebase_service/firebase_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:mapbeauty/modules/product/presentation/components/firebase_storage_image_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductColorImagesWidget extends StatefulWidget {
  final List<String>? images;
  const ProductColorImagesWidget({super.key, required this.images});

  @override
  State<ProductColorImagesWidget> createState() => _ProductColorImagesWidgetState();
}

class _ProductColorImagesWidgetState extends State<ProductColorImagesWidget> {
  PageController pageController = PageController(initialPage: 0, viewportFraction: 1, keepPage: true);

  @override
  void didUpdateWidget(covariant ProductColorImagesWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    pageController.jumpToPage(0);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              //   color: Colors.black,
              border: Border.all(width: 0.3),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
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
          SmoothPageIndicator(
              controller: pageController,
              count: widget.images?.length ?? 0,
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
      ),
    );
  }
}
