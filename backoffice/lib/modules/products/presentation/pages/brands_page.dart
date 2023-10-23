import 'dart:typed_data';
import 'package:backoffice/modules/core/presentation/components/app_bar_widget.dart';
import 'package:backoffice/modules/firebase/firebase_storage_service.dart';
import 'package:backoffice/modules/products/domain/models/brand_model.dart';
import 'package:backoffice/modules/products/presentation/components/firebase_storage_image_widget.dart';
import 'package:backoffice/modules/products/presentation/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BrandsPage extends StatefulWidget {
  const BrandsPage({super.key});

  @override
  State<BrandsPage> createState() => _BrandsPageState();
}

class _BrandsPageState extends State<BrandsPage> {
  final vm = ProductViewModel();
  List<Brand> brands = [];
  int? indexInEditMode;
  bool showAddNewBrand = false;

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

  openImagePicker() async {
    final imagePicker = ImagePicker();

    final XFile? pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage == null) {
      return;
    } else {
      // String fileName = path.basename(tmpFile.path);
      Uint8List imageData = await pickedImage.readAsBytes();
      final imageURL = await vm.uploadImageToFirebaseStorage(imageData, pickedImage.name);
      print(imageURL);
    }
  }

  void saveBrand() {
    vm.saveBrand();
    vm.getBrands2();
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
              if (showAddNewBrand)
                Container(
                  height: 70,
                  width: 400,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "Nome da Marca",
                            fillColor: Colors.transparent,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: openImagePicker,
                        icon: const Icon(Icons.add_photo_alternate),
                      ),
                      ElevatedButton(onPressed: saveBrand, child: Text("Salvar")),
                    ],
                  ),
                ),
              const SizedBox(height: 40),
              Expanded(
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
                        imageType: ImageType.logo,
                      )),
                      TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(enabled: isEditMode, controller: TextEditingController(text: brand.name)),
                          )),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: IconButton(
                          onPressed: openImagePicker,
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
        )

        // ListView.builder(
        //   itemCount: brands.length,
        //   itemBuilder: (context, index) {
        //     final brand = brands[index];
        //     return Text(brand.name);
        //   },
        // ),
        );
  }
}
