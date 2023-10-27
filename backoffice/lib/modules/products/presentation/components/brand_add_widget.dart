import 'dart:typed_data';

import 'package:backoffice/modules/core/utils/view_utils.dart';
import 'package:backoffice/modules/products/domain/models/brand_model.dart';
import 'package:backoffice/modules/products/presentation/view_model/brand_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrandAddWidget extends StatefulWidget {
  final Function(Brand) onBrandAdded;
  const BrandAddWidget({super.key, required this.onBrandAdded});

  @override
  State<BrandAddWidget> createState() => _BrandAddWidgetState();
}

class _BrandAddWidgetState extends State<BrandAddWidget> {
  //TODO Jogar para o
  String? imageName;
  Uint8List? imageData;
  final _controller = TextEditingController();

  openImagePicker() async {
    //TODO: Se a brand for null significa que to fazendo isso do Adicionar ...
    final result = await ViewUtils.getImageDataFromimagePicker();

    imageName = result?["imageName"];
    imageData = result?["imageData"];
    setState(() {});
  }

  void addBrand() async {
    if (_controller.text.isEmpty || imageData == null || imageName == null) {
      ViewUtils.showConfirmAlert(context: context, title: "Ops", description: "Tem que adicionar o nome e a imagem.");
      return;
    }

    final viewModel = Provider.of<BrandViewModel>(context, listen: false);

    viewModel.addBrandAndUpdateImage(_controller.text, imageData!, imageName!).then((brand) {
      widget.onBrandAdded(brand);
    }).onError((error, stackTrace) async {
      //TODO tratar o erro certinho
      await ViewUtils.showConfirmAlert(context: context, title: "Ops", description: "Ocorreu um erro ao adicionar uma nova marca");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 500,
      child: Row(
        children: [
          if (imageData != null)
            Image.memory(
              imageData!,
              height: 40,
              width: 40,
            ),
          SizedBox(width: 20),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: "Nome da Marca",
                fillColor: Color.fromARGB(0, 23, 18, 18),
              ),
            ),
          ),
          IconButton(
            onPressed: () => openImagePicker(),
            icon: const Icon(Icons.add_photo_alternate),
          ),
          ElevatedButton(onPressed: addBrand, child: Text("Salvar")),
        ],
      ),
    );
  }
}
