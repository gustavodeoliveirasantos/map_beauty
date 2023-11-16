import 'package:commons/modules/firebase_service/firebase_storage_service.dart';
import 'package:commons/modules/products/domain/models/offer_model.dart';
import 'package:flutter/material.dart';
import 'package:mapbeauty/modules/product/presentation/components/discount_badge_.widget.dart';
import 'package:mapbeauty/modules/product/presentation/components/firebase_storage_image_widget.dart';
import 'package:mapbeauty/modules/product/presentation/components/offer_product_info_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class OfferItemWidget extends StatelessWidget {
  final Offer offer;
  final Function(Offer offer) onItemTapped;
  OfferItemWidget({super.key, required this.offer, required this.onItemTapped});

  void openProductPage(Offer offer) async {
    final uri = Uri.parse(offer.buyUrl);

    if (!await launchUrl(uri)) {
      throw Exception('Could not launch ${offer.buyUrl}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cardHeigh = size.width * 1.1;

    return Hero(
      tag: offer.id,
      child: Container(
        height: cardHeigh,
        // width: ,
        child: Column(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => onItemTapped(offer!),
                child: Card(
                  semanticContainer: true,
                  child: Stack(children: [
                    Positioned(
                      bottom: 130,
                      right: 0,
                      left: 0,
                      top: 0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        child: FirebaseStorageImageWidget(
                          imageName: offer.images.isEmpty ? "" : offer.images.first,
                          imageFolder: ImageFolder.offersProducts,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 16,
                      right: 0,
                      child: DiscountBadgeWidget(
                        discount: offer.discountPercentage ?? 0,
                        height: 20,
                        width: 45,
                        fontSize: 12,
                      ),
                    ),
                    Positioned(
                      bottom: 30,
                      right: 0,
                      left: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.only(bottomRight: const Radius.circular(12.0), bottomLeft: const Radius.circular(12.0)),
                        ),
                        clipBehavior: Clip.antiAlias,
                        height: 100,
                        child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: OfferProductInfoWidget(
                              isBig: false,
                              offer: offer,
                            )),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () => openProductPage(offer!),
                        child: SizedBox(
                          height: 30,
                          child: Center(
                            child: Text(
                              "Comprar",
                              style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    )
                  ]),
                ),
              ),
            ),

            //  BuyButtonWidget(onPressed: () => openProductPage(offer!)),
          ],
        ),
      ),
    );
  }
}
