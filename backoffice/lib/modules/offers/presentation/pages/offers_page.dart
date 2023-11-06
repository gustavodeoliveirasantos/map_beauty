import 'package:backoffice/modules/core/presentation/components/app_bar_widget.dart';
import 'package:backoffice/modules/core/utils/utils.dart';
import 'package:backoffice/modules/offers/service/dto/offer_dto.dart';
import 'package:backoffice/modules/offers/service/service/offer_service.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OffersPage extends StatefulWidget {
  const OffersPage({super.key});

  @override
  State<OffersPage> createState() => _OffersPageState();
}

class _OffersPageState extends State<OffersPage> {
  void test() async {
    final service = OfferServiceImpl(database: FirebaseDatabase.instance);
    final dto = OfferDTO(
      id: Utils.uuid(),
      date: DateTime.now(),
      isActive: false,
      productName: "TESTE",
      productDescription: "TESTE teste teste ",
      brandId: "1699264888402000",
      images: ["imagem 1.png", "imagem 2.png"],
    );

    // service.addOffer(dto);
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
