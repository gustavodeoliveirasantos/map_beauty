import 'package:commons/modules/products/domain/models/offer_model.dart';
import 'package:flutter/material.dart';
import 'package:mapbeauty/modules/product/presentation/components/discount_icon.widget.dart';
import 'package:mapbeauty/modules/product/presentation/components/map_beauty_logo_widget.dart';
import 'package:mapbeauty/modules/product/presentation/components/offer_product_info_widget.dart';
import 'package:mapbeauty/modules/product/presentation/components/product_images_carousel_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class OfferDetailPage extends StatelessWidget {
  final Offer offer;
  const OfferDetailPage({super.key, required this.offer});

  void openProductPage(Offer offer) async {
    final uri = Uri.parse(offer.buyUrl);

    if (!await launchUrl(uri)) {
      throw Exception('Could not launch ${offer.buyUrl}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bottomSafeAreaPadding = MediaQuery.of(context).padding.bottom;
    return Scaffold(
      body: SafeArea(
        //   bottom: false,
        child: Container(
          //   color: Colors.amber,
          child: Stack(
            children: [
              ListView(
                children: [
                  ProductImagesCarouselWidget(images: offer.images, height: size.width, width: size.width, hasBorder: false),
                  Divider(height: 40, thickness: 0.5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: OfferProductInfoWidget(offer: offer, isBig: true),
                  ),
                  SizedBox(
                    height: 60 + bottomSafeAreaPadding,
                  )
                ],
              ),
              Positioned(
                top: 12,
                left: 12,
                child: CircleAvatar(
                  radius: 18,
                  child: IconButton(
                      iconSize: 18,
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(
                        Icons.close,
                      )),
                ),
              ),
              Positioned(
                  top: size.width,
                  right: 12,
                  child: DiscountIconWidget(
                    discount: offer.discountPercentage,
                    height: 30,
                    width: 60,
                    fontSize: 14,
                  )),
              Positioned(
                bottom: 0,
                right: 50,
                left: 50,
                child: SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    //   style: TextButton.styleFrom(shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.zero))),
                    onPressed: () => openProductPage(offer),
                    child: Text(
                      "Comprar",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
