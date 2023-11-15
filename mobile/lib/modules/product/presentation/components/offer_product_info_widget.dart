import 'package:commons/modules/products/domain/models/offer_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OfferProductInfoWidget extends StatelessWidget {
  final Offer? offer;
  final bool isBig;

  OfferProductInfoWidget({super.key, required this.offer, required this.isBig});

  NumberFormat coin = NumberFormat.currency(
    locale: 'pt_BR', // Defina a localização desejada
    symbol: 'R\$', // Símbolo da moeda
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          offer?.productName ?? "",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: isBig ? 18 : 14),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          offer?.brandName ?? "",
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: isBig ? 18 : 14),
          maxLines: 1,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              coin.format(offer?.discountPrice),
              style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: isBig ? 20 : 16, fontWeight: FontWeight.bold),
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(color: isBig ? Colors.grey : Colors.white),
                children: [
                  TextSpan(text: "De: ", style: TextStyle(fontSize: isBig ? 16 : 12)),
                  TextSpan(text: coin.format(offer?.oldPrice), style: TextStyle(decoration: TextDecoration.lineThrough, fontSize: isBig ? 16 : 12)),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        if (isBig)
          Text(
            offer?.productDescription ?? "",
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
            //   maxLines: 1,
          ),
      ],
    );
  }
}
