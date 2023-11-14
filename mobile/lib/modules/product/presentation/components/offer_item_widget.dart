import 'package:commons/modules/firebase_service/firebase_storage_service.dart';
import 'package:commons/modules/products/domain/models/offer_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mapbeauty/modules/product/presentation/components/buy_button_widget.dart';
import 'package:mapbeauty/modules/product/presentation/components/firebase_storage_image_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class OfferItemWidget extends StatelessWidget {
  final Offer? offer;
  OfferItemWidget({super.key, required this.offer});

  NumberFormat coin = NumberFormat.currency(
    locale: 'pt_BR', // Defina a localização desejada
    symbol: 'R\$', // Símbolo da moeda
  );

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
    return SizedBox(
      height: cardHeigh,
      // width: ,
      child: Column(
        children: [
          Expanded(
            child: Card(
              semanticContainer: true,
              child: Stack(children: [
                Positioned(
                  bottom: 100,
                  right: 0,
                  left: 0,
                  top: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    child: FirebaseStorageImageWidget(
                      imageName: offer?.images.first ?? "",
                      imageFolder: ImageFolder.offersProducts,
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                      ),
                    ),
                    width: 45,
                    height: 20,
                    child: Center(
                      child: Text(
                        "${offer?.discountPercentage.toStringAsFixed(0)}%",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "asdasd asdasss dsdasd  sadasd", // offer?.productName ?? "",
                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            offer?.brandName ?? "",
                            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
                            maxLines: 1,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                coin.format(offer?.discountPrice),
                                style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              RichText(
                                  text: TextSpan(
                                children: [
                                  TextSpan(text: "De: ", style: TextStyle(fontSize: 12)),
                                  TextSpan(text: coin.format(offer?.oldPrice), style: TextStyle(decoration: TextDecoration.lineThrough, fontSize: 12)),
                                ],
                              )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
          BuyButtonWidget(onPressed: () => openProductPage(offer!)),
        ],
      ),
    );
  }
}
