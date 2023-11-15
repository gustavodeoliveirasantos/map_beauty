import 'package:commons/modules/products/domain/models/offer_model.dart';
import 'package:flutter/material.dart';
import 'package:mapbeauty/modules/core/utils/app_routes.dart';
import 'package:mapbeauty/modules/product/presentation/components/map_beauty_logo_widget.dart';
import 'package:mapbeauty/modules/product/presentation/pages/offer_detail_widget.dart';
import 'package:mapbeauty/modules/product/presentation/components/offer_item_widget.dart';
import 'package:mapbeauty/modules/product/presentation/view_model/offer_view_model.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class OffersPage extends StatefulWidget {
  const OffersPage({super.key});

  @override
  State<OffersPage> createState() => _OffersPageState();
}

class _OffersPageState extends State<OffersPage> {
  List<Offer>? offers;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final viewModel = Provider.of<OfferViewModel>(context, listen: false);
      await viewModel.loadOffers();
      offers = viewModel.offers;
      setState(() {});
    });
  }

  void openProductPage(Offer offer) async {
    final uri = Uri.parse(offer.buyUrl);

    if (!await launchUrl(uri)) {
      throw Exception('Could not launch ${offer.buyUrl}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MapBeautyLogoWidget(),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: size.width / 2,
                  childAspectRatio: 0.5,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                ),
                itemCount: offers?.length ?? 0,
                itemBuilder: (context, index) {
                  final offer = offers?[index];
                  return OfferItemWidget(
                    offer: offer,
                    onItemTapped: (Offer offer) {
                      setState(() {
                        Navigator.of(context).pushNamed(AppRoutes.offersDetail, arguments: offer);
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
