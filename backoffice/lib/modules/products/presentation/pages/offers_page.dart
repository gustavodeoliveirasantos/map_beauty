import 'package:backoffice/modules/core/presentation/components/app_bar_widget.dart';
import 'package:backoffice/modules/core/utils/utils.dart';
import 'package:backoffice/modules/products/presentation/components/offer_add_widget.dart';
import 'package:backoffice/modules/products/presentation/components/offers_list_widget.dart';
import 'package:backoffice/modules/products/presentation/components/offers_title_list_widget.dart';
import 'package:backoffice/modules/products/presentation/view_model/offer_view_model.dart';
import 'package:backoffice/modules/products/service/dto/offer_dto.dart';
import 'package:backoffice/modules/products/service/service/offer_service.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OffersPage extends StatefulWidget {
  const OffersPage({super.key});

  @override
  State<OffersPage> createState() => _OffersPageState();
}

class _OffersPageState extends State<OffersPage> {
  // final viewModel = GetIt.instance<OfferViewModel>();
  bool showAddNewOffer = false;

  void addProduct() async {
    final service = OfferServiceImpl(database: FirebaseDatabase.instance);
    final dto = OfferDTO(
      id: Utils.uuid(),
      date: DateTime.now().add(Duration(days: 0)),
      isActive: false,
      productName: "Product 11",
      productDescription: "TESTE teste teste ",
      brandId: "1699388932652000",
      brandName: "O Boticário",
      oldPrice: 200.00,
      discountPrice: 150.00,
      buyUrl: "https://www.google.com",
      images: ["imagem 1.png", "imagem 2.png"],
    );

    service.addOffer(dto);
    // viewModel.getOffers();
    // setState(() {
    //   showAddNewOffer = false;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OfferViewModel>(
      create: (_) => GetIt.instance<OfferViewModel>(),
      child: Scaffold(
        appBar: const AppBarWidget(),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () => addProduct(), //setState(() => showAddNewOffer = !showAddNewOffer),
                child: const Text("+ Novo Produto"),
              ),
              if (showAddNewOffer) OfferAddWidget(),
              Consumer<OfferViewModel>(
                builder: (context, viewModel, child) {
                  final offersMap = viewModel.offersMap;
                  final sortedKeys = offersMap.keys.toList();
                  sortedKeys.sort((a, b) => b.compareTo(a));

                  return Expanded(
                    child: ListView.separated(
                      itemCount: sortedKeys.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 60.0, bottom: 16),
                              child: RichText(
                                text: TextSpan(
                                  style: const TextStyle(fontSize: 18),
                                  children: <TextSpan>[
                                    const TextSpan(text: 'Data: ', style: TextStyle(fontWeight: FontWeight.bold)),
                                    TextSpan(text: DateFormat('dd/MM/yyyy').format(sortedKeys[index])),
                                  ],
                                ),
                              ),
                            ),
                            const OffersTitleListWidget(),
                            const Divider(height: 0.5),
                            OffersListWidget(
                              offers: offersMap[sortedKeys[index]],
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(height: 0.5);
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
