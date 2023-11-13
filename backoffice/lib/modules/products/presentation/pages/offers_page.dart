import 'package:backoffice/modules/core/presentation/components/app_bar_widget.dart';
import 'package:backoffice/modules/core/utils/view_utils.dart';
import 'package:backoffice/modules/products/domain/models/offer_model.dart';
import 'package:backoffice/modules/products/presentation/components/offer_detail_widget.dart';
import 'package:backoffice/modules/products/presentation/components/offers_list_widget.dart';
import 'package:backoffice/modules/products/presentation/components/offers_title_list_widget.dart';
import 'package:backoffice/modules/products/presentation/view_model/offer_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OffersPage extends StatefulWidget {
  const OffersPage({super.key});

  @override
  State<OffersPage> createState() => _OffersPageState();
}

class _OffersPageState extends State<OffersPage> {
  late OfferViewModel _viewModel;
  bool showOfferDetailModal = false;
  Offer? selectedOffer;

  @override
  void initState() {
    super.initState();
    _viewModel = Provider.of<OfferViewModel>(context, listen: false);
  }

  void onOfferSelected(Offer offer) {
    selectedOffer = offer;
    showOfferDetail();
  }

  void showOfferDetail() {
    setState(() => showOfferDetailModal = true);
  }

  void closeOfferDetail() {
    selectedOffer = null;
    setState(() => showOfferDetailModal = false);
  }

  void activateOrDeactivateOffer(Offer offer, DateTime dateKey) {
    ViewUtils.showConfirmAlert(
        context: context,
        title: "Atenção",
        description: "Tem certeza que disso?",
        confirmButtonText: "Sim",
        cancelButtonText: "Não",
        onConfirm: () {
          final updatedOffer = offer.copyWith(isActive: !offer.isActive);
          if (offer.isActive) {
            _viewModel.deactivateOffer(dateKey, updatedOffer).onError((error, stackTrace) => print("LELELELE entrou aqui tbm"));
          } else {
            _viewModel.activateOffer(dateKey, updatedOffer).onError((error, stackTrace) => print("LELELELE entrou aqui tbm"));
          }
        });
  }

  void activateAllOffers(DateTime dateKey) {
    ViewUtils.showConfirmAlert(
        context: context,
        title: "Atenção",
        description: "Tem certeza que disso?",
        confirmButtonText: "Sim",
        cancelButtonText: "Não",
        onConfirm: () {
          _viewModel.activateOffersByDate(dateKey);
        });
  }

  void deactivateAllOffers(DateTime dateKey) {
    ViewUtils.showConfirmAlert(
        context: context,
        title: "Atenção",
        description: "Tem certeza que disso?",
        confirmButtonText: "Sim",
        cancelButtonText: "Não",
        onConfirm: () {
          _viewModel.deactivateOffersByDate(dateKey);
        });
  }

  void deleteAllOffers(DateTime dateKey) {
    ViewUtils.showConfirmAlert(
        context: context,
        title: "Atenção",
        description: "Tem certeza que disso que deseja excluir todas as ofertas desse dia?",
        confirmButtonText: "Sim",
        cancelButtonText: "Não",
        onConfirm: () {
          _viewModel.deleteOffersByDate(dateKey);
        });
  }

  void deleteOffer(Offer offer, DateTime dateKey) {
    ViewUtils.showConfirmAlert(
      context: context,
      title: "Atenção",
      description: "Tem certeza que deseja excluir?",
      confirmButtonText: "Sim",
      cancelButtonText: "Não",
      onConfirm: () => _viewModel.deleteOffer(offer, dateKey),
    );
  }

  void addProduct() async {
    setState(() {
      showOfferDetailModal = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: showOfferDetail, //setState(() => showAddNewOffer = !showAddNewOffer),
                child: const Text("+ Novo Produto"),
              ),
              const SizedBox(height: 20),
              Consumer<OfferViewModel>(
                builder: (context, viewModel, child) {
                  final offersMap = viewModel.offersMap;
                  final sortedKeys = offersMap.keys.toList();
                  sortedKeys.sort((a, b) => b.compareTo(a));

                  return Expanded(
                    child: ListView.separated(
                      itemCount: sortedKeys.length,
                      itemBuilder: (context, index) {
                        final dateKey = sortedKeys[index];

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 60.0),
                              child: OffersTitleListWidget(
                                date: DateFormat('dd/MM/yyyy').format(dateKey),
                                totalOfProducts: "${offersMap[dateKey]?.length ?? 0}",
                                onActivateAllTapped: () => activateAllOffers(dateKey),
                                onDeactvateAllTapped: () => deactivateAllOffers(dateKey),
                                onDeleteAllTapped: () => deleteAllOffers(dateKey),
                              ),
                            ),
                            const Divider(height: 0.5),
                            OffersListWidget(
                              offers: offersMap[sortedKeys[index]],
                              onOfferSelected: onOfferSelected,
                              onDeleteTapped: (offer) => deleteOffer(offer, dateKey),
                              onActivateOrDeactivateTapped: (offer) => activateOrDeactivateOffer(offer, dateKey),
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
        if (showOfferDetailModal)
          OfferDetailWidget(
            offer: selectedOffer,
            onCloseTapped: closeOfferDetail,
          ),
      ]),
    );
  }
}
