import 'package:backoffice/modules/products/domain/models/offer_model.dart';
import 'package:backoffice/modules/products/presentation/components/table_separator_widget.dart';
import 'package:backoffice/modules/products/presentation/view_model/brand_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class OffersListWidget extends StatelessWidget {
  final List<Offer>? offers;
  final Function(Offer) onOfferSelected;
  final Function(Offer) onActivateOrDeactivateTapped;
  final Function(Offer) onDeleteTapped;
  const OffersListWidget({
    super.key,
    required this.offers,
    required this.onOfferSelected,
    required this.onActivateOrDeactivateTapped,
    required this.onDeleteTapped,
  });

  void openUrl(String url) async {
    String finalUrl = url;
    if (!url.contains("https://")) {
      finalUrl = "https://$url";
    }

    final Uri _uri = Uri.parse(finalUrl);
    if (!await launchUrl(_uri)) {
      throw Exception('Could not launch $_uri');
    }
  }

  @override
  Widget build(BuildContext context) {
    final double rowHeight = 70;
    final double size = (offers?.length ?? 0) * rowHeight;
    final brands = Provider.of<BrandViewModel>(context, listen: false).brands;
    NumberFormat formatoMoeda = NumberFormat.currency(
      locale: 'pt_BR', // Defina a localização desejada
      symbol: 'R\$ ', // Símbolo da moeda
    );

    return SizedBox(
      height: size,
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(), //TODO: Remover Scrol aqui
        itemCount: offers?.length ?? 0,
        itemBuilder: (context, index) {
          final offer = offers?[index];

          // Formate o número como uma string de moeda
          String oldPrice = formatoMoeda.format(offer?.oldPrice ?? 0);
          String discountPrice = formatoMoeda.format(offer?.discountPrice ?? 0);
          String url = offer?.buyUrl ?? "";

          return InkWell(
            onTap: () {},
            child: SizedBox(
              height: rowHeight,
              child: Row(
                children: [
                  SizedBox(width: 200, child: Text(offer?.productName ?? "")),
                  TableSeparatorWidget(height: rowHeight),
                  SizedBox(width: 120, child: Text(offer?.brandName ?? "")),
                  TableSeparatorWidget(height: rowHeight),
                  SizedBox(width: 80, child: Text(oldPrice)),
                  TableSeparatorWidget(height: rowHeight),
                  SizedBox(width: 80, child: Text(discountPrice)),
                  TableSeparatorWidget(height: rowHeight),
                  SizedBox(width: 70, child: Center(child: Text("${offer?.images?.length ?? 0}"))),
                  TableSeparatorWidget(height: rowHeight),
                  SizedBox(
                    width: 60,
                    child: TextButton(
                      onPressed: () => openUrl(url),
                      child: Text("Link"),
                    ),
                  ),
                  TableSeparatorWidget(height: rowHeight),
                  SizedBox(
                    width: 100,
                    child: TextButton(
                      onPressed: () => onActivateOrDeactivateTapped(offer!),
                      child: Text((offer?.isActive ?? false) ? "Desativar" : "Ativar"),
                    ),
                  ),
                  SizedBox(
                    width: 80,
                    child: TextButton(
                      onPressed: () => onDeleteTapped(offer!),
                      child: Text("Excluir"),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(height: 0.5);
        },
      ),
    );
  }
}
