import 'dart:typed_data';
import 'package:backoffice/modules/core/presentation/components/app_bar_widget.dart';
import 'package:backoffice/modules/core/utils/view_utils.dart';
import 'package:backoffice/modules/firebase/firebase_storage_service.dart';
import 'package:backoffice/modules/products/domain/models/brand_model.dart';
import 'package:backoffice/modules/products/presentation/components/brand_add_widget.dart';
import 'package:backoffice/modules/products/presentation/components/firebase_storage_image_widget.dart';
import 'package:backoffice/modules/products/presentation/view_model/brand_view_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BrandsPage extends StatefulWidget {
  const BrandsPage({super.key});

  @override
  State<BrandsPage> createState() => _BrandsPageState();
}

class _BrandsPageState extends State<BrandsPage> {
  final vm = BrandViewModel();
  List<Brand> brands = [];
  int? indexInEditMode;
  bool showAddNewBrand = false;
  bool showSuccesLabel = false;

  // Brand? newBrand;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //  WidgetsBinding.instance.addPostFrameCallback((_) {
    //   Provider.of<NotificationsViewModel>(context, listen: false).loadAllSubgroupNotificationsList();
    //   Provider.of<InAppPurchaseViewModel>(context, listen: false).validateSubscription();
    // });
    loadBrands();
  }

  void loadBrands() async {
    brands = await vm.getBrands();
    setState(() {});
  }

  openImagePicker(Brand? brand) async {
    //TODO: Se a brand for null significa que to fazendo isso do Adicionar ...

    final imageData = await ViewUtils.getImageDataFromimagePicker();
  }

  void onBrandAdded(Brand brand) async {
    setState(() {
      showSuccesLabel = true;
      showAddNewBrand = false;
    });
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      showSuccesLabel = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showAddNewBrand = !showAddNewBrand;
                    });
                  },
                  child: Text(showAddNewBrand ? "Cancelar" : "+ Novo Produto")),
              const SizedBox(height: 20),
              if (showSuccesLabel) const Text("Marca Adicionada com sucesso... :)"),
              if (showAddNewBrand) BrandAddWidget(onBrandAdded: onBrandAdded),
              const SizedBox(height: 40),
              Expanded(
                //TODO: Trocar por List View e adicionar a tabela dentro da lista para cada elemento?
                child: Table(
                  border: TableBorder.all(width: 0.5),
                  columnWidths: const {0: FixedColumnWidth(100), 1: FixedColumnWidth(400), 2: FixedColumnWidth(100), 3: IntrinsicColumnWidth()},
                  children: brands.map((brand) {
                    int index = brands.indexOf(brand);

                    bool isEditMode = index == indexInEditMode;
                    return TableRow(children: [
                      TableCell(
                          child: FirebaseStorageImageWidget(
                        imageName: brand.image,
                        height: 100,
                        width: 50,
                        imageType: ImageFolder.logo,
                      )),
                      TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: isEditMode
                                  ? TextField(
                                      enabled: isEditMode,
                                      controller: TextEditingController(text: brand.name),
                                    )
                                  : Text(brand.name))),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: IconButton(
                          onPressed: () => openImagePicker(brand),
                          icon: const Icon(Icons.add_photo_alternate),
                        ),
                      ),
                      TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Container(
                            height: 50,
                            child: Row(
                              children: [
                                TextButton(
                                    onPressed: () {
                                      if (!isEditMode) {
                                        setState(() {
                                          indexInEditMode = index;
                                        });
                                      } else {}
                                    },
                                    child: Text(isEditMode ? "Salvar" : "Editar")),
                                TextButton(onPressed: () {}, child: Text("Excluir")),
                              ],
                            ),
                          )),
                    ]);
                  }).toList(),
                ),
              ),
            ],
          ),
        ));
  }
}
