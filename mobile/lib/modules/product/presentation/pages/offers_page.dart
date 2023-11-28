import 'package:commons/modules/products/domain/models/offer_model.dart';
import 'package:flutter/material.dart';
import 'package:mapbeauty/modules/core/presentation/components/loading_widget.dart';
import 'package:mapbeauty/modules/core/utils/app_routes.dart';
import 'package:mapbeauty/modules/product/presentation/components/map_beauty_logo_widget.dart';
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
  bool showOffersNotLoadedMessage = false;
  late final OfferViewModel _viewModel;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      _viewModel = Provider.of<OfferViewModel>(context, listen: false);
      setState(() {
        _isLoading = true;
      });

      await _viewModel.loadOffers();
      setState(() {
        offers = _viewModel.offers;
        _isLoading = false;
      });
    });
  }

  void openProductPage(Offer offer) async {
    final uri = Uri.parse(offer.buyUrl);

    if (!await launchUrl(uri)) {
      throw Exception('Could not launch ${offer.buyUrl}');
    }
  }

  Future<void> _pullRefresh() async {
    setState(() => _isLoading = true);

    await _viewModel.loadOffers();
    offers = _viewModel.offers;
    if (offers == null) {
      showOffersNotLoadedMessage = true;
      setState(() => _isLoading = false);
      return;
    } else {
      setState(() {
        showOffersNotLoadedMessage = offers!.isEmpty;
        _isLoading = false;
      });
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
            if (showOffersNotLoadedMessage)
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.warning,
                        color: Theme.of(context).colorScheme.primary,
                        size: 40,
                      ),
                      SizedBox(height: 20),
                      Text(
                        "As promoções ainda não foram carregadas. Se o problema persistir, tente novamente mais tarde.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      SizedBox(height: 20),
                      if (_isLoading) LoadingWidget(size: Size(20, 20)),
                      if (!_isLoading) ElevatedButton(onPressed: () => _pullRefresh(), child: Text("Tentar novamente")),
                    ],
                  ),
                ),
              ),
            if (!showOffersNotLoadedMessage)
              Expanded(
                child: RefreshIndicator(
                  onRefresh: _pullRefresh,
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
                      if (offer == null) return null;
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
              ),
          ],
        ),
      ),
    );
  }
}
