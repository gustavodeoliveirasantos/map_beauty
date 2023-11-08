import 'package:backoffice/modules/products/domain/models/offer_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OfferDetailWidget extends StatelessWidget {
  final Function() onCloseTapped;
  final Offer? offer;
  const OfferDetailWidget({
    required this.onCloseTapped,
    this.offer,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height,
      width: screenSize.width,
      color: Colors.black26,
      child: Center(
        child: Stack(
          children: [
            Container(
              color: Colors.white,
              height: screenSize.height / 1.5,
              width: screenSize.width / 1.5,
            ),
            Positioned(
                top: 16,
                right: 16,
                child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: onCloseTapped,
                )),
          ],
        ),
      ),
    );
  }
}
