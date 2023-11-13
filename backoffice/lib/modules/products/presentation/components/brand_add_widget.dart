import 'dart:typed_data';
import 'package:backoffice/modules/products/presentation/view_model/brand_view_model.dart';
import 'package:commons/modules/core/utils/view_utils.dart';
import 'package:commons/modules/products/domain/models/brand_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrandAddWidget extends StatefulWidget {
  final Function(Brand) onBrandAdded;
  final Function() onAddBrandTapped;
  const BrandAddWidget({super.key, required this.onBrandAdded, required this.onAddBrandTapped});

  @override
  State<BrandAddWidget> createState() => _BrandAddWidgetState();
}

class _BrandAddWidgetState extends State<BrandAddWidget> {
  String? imageName;
  Uint8List? imageData;
  final _controller = TextEditingController();

  openImagePicker() async {
    final result = await ViewUtils.getImageDataFromImagePicker();

    imageName = result?["imageName"];
    imageData = result?["imageData"];
    setState(() {});
  }

  void addBrand() async {
    if (_controller.text.isEmpty || imageData == null || imageName == null) {
      ViewUtils.showConfirmAlert(context: context, title: "Ops", description: "Tem que adicionar o nome e a imagem.");
      return;
    }
    widget.onAddBrandTapped();

    final viewModel = Provider.of<BrandViewModel>(context, listen: false);

    viewModel.addBrandAndUpdateImage(_controller.text, imageData!, imageName!).then((brand) {
      widget.onBrandAdded(brand);
    }).onError((error, stackTrace) async {
      await ViewUtils.showConfirmAlert(context: context, title: "Ops", description: "Ocorreu um erro ao adicionar uma nova marca");
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
          const SizedBox(width: 20),
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
          ElevatedButton(onPressed: addBrand, child: const Text("Salvar")),
        ],
      ),
    );
  }
}
