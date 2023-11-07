import 'package:backoffice/modules/core/presentation/components/app_bar_widget.dart';
import 'package:backoffice/modules/core/utils/utils.dart';
import 'package:backoffice/modules/products/presentation/view_model/offer_view_model.dart';
import 'package:backoffice/modules/products/service/dto/offer_dto.dart';
import 'package:backoffice/modules/products/service/service/offer_service.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class OffersPage extends StatefulWidget {
  const OffersPage({super.key});

  @override
  State<OffersPage> createState() => _OffersPageState();
}

class _OffersPageState extends State<OffersPage> {
  final viewModel = GetIt.instance<OfferViewModel>();

  void test() async {
    final service = OfferServiceImpl(database: FirebaseDatabase.instance);
    final dto = OfferDTO(
      id: Utils.uuid(),
      date: DateTime.now().add(Duration(days: -1)),
      isActive: false,
      productName: "TESTE",
      productDescription: "TESTE teste teste ",
      brandId: "1699264888402000",
      oldPrice: 200.00,
      discountPrice: 150.00,
      buyUrl: "www.google.com",
      images: ["imagem 1.png", "imagem 2.png"],
    );

    // service.addOffer(dto);
    viewModel.getOffers();

    // service.addOffer(dto);
    // // await Future.delayed(Duration(seconds: 5));
    // service.deleteOfferImage(dto, "imagem 1.png");
    // dto.images?.remove("imagem 1.png");
    // // await Future.delayed(Duration(seconds: 5));

    // service.uploadOfferImage(dto, "imagem 3.png");
    // dto.images?.add("imagem 3.png");

    // // await Future.delayed(Duration(seconds: 5));

    // service.uploadOfferImage(dto, "imagem 4.png");
    // dto.images?.add("imagem 4.png");

    // // await Future.delayed(Duration(seconds: 5));

    // service.uploadOfferImage(dto, "imagem 5.png");
    // dto.images?.add("imagem 5.png");

    // // await Future.delayed(Duration(seconds: 5));

    // service.uploadOfferImage(dto, "imagem 6.png");
    // dto.images?.add("imagem 6.png");

    // // await Future.delayed(Duration(seconds: 5));

    // service.uploadOfferImage(dto, "imagem 7.png");
    // dto.images?.add("imagem 7.png");

    // // await Future.delayed(Duration(seconds: 5));

    // service.uploadOfferImage(dto, "imagem 8.png");
    // dto.images?.add("imagem 8.png");

    // // await Future.delayed(Duration(seconds: 5));
    // service.deleteOfferImage(dto, "imagem 3.png");
    // dto.images?.remove("imagem 3.png");

    // // await Future.delayed(Duration(seconds: 5));
    // service.deleteOfferImage(dto, "imagem 7.png");
    // dto.images?.remove("imagem 7.png");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: Container(
        height: 200,
        width: 200,
        color: Colors.amber,
        child: ElevatedButton(
          onPressed: test,
          child: const Text("Add"),
        ),
      ),
    );
  }
}
