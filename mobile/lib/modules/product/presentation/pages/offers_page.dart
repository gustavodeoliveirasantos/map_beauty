import 'package:commons/modules/products/domain/models/offer_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mapbeauty/modules/product/presentation/view_model/offer_view_model.dart';
import 'package:mapbeauty/modules/product/presentation/view_model/product_view_model.dart';

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
      final viewModel = GetIt.instance<OfferViewModel>();
      await viewModel.loadOffers();
      offers = viewModel.offers;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: offers?.length,
      itemBuilder: (context, index) {
        final offer = offers?[index];
        return Text(offer?.productName ?? "");
      },
    );
  }
}
