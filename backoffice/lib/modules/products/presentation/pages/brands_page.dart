import 'package:backoffice/modules/core/presentation/components/app_bar_widget.dart';
import 'package:backoffice/modules/core/presentation/components/brands_dropdown_widget.dart';
import 'package:backoffice/modules/core/presentation/components/loading_widget.dart';
import 'package:backoffice/modules/core/utils/view_utils.dart';
import 'package:backoffice/modules/firebase_service/firebase_storage_service.dart';
import 'package:backoffice/modules/products/domain/models/brand_model.dart';
import 'package:backoffice/modules/products/presentation/components/brand_add_widget.dart';
import 'package:backoffice/modules/products/presentation/components/firebase_storage_image_widget.dart';
import 'package:backoffice/modules/products/presentation/view_model/brand_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrandsPage extends StatefulWidget {
  const BrandsPage({super.key});

  @override
  State<BrandsPage> createState() => _BrandsPageState();
}

class _BrandsPageState extends State<BrandsPage> {
  late final BrandViewModel _viewModel;

  int? indexInEditMode;
  bool showAddNewBrand = false;
  bool showSuccesLabel = false;
  bool isLoading = false;

  // Brand? newBrand;

  @override
  void initState() {
    super.initState();
    _viewModel = Provider.of<BrandViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _viewModel.loadBrands();
    });
  }

  openImagePicker(Brand brand) async {
    final result = await ViewUtils.getImageDataFromImagePicker();
    setState(() => isLoading = true);
    await _viewModel.updateBrandImage(brand, result?["imageData"], result?["imageName"]).onError((error, stackTrace) => debugPrint(stackTrace.toString()));
    setState(() => isLoading = false);
  }

  void onAddBrandTapped() {
    setState(() {
      isLoading = true;
    });
  }

  void onBrandAdded(Brand brand) async {
    setState(() {
      showSuccesLabel = true;
      showAddNewBrand = false;
      isLoading = false;
    });
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      showSuccesLabel = false;
    });
  }

  void updateBrand(Brand brand, String? newName) {
    if (newName == brand.name) {
      return;
    }
    _viewModel.updateBrand(brand.copyWith(name: newName));
  }

  void delete(Brand brand) {
    ViewUtils.showConfirmAlert(
      context: context,
      title: "Atenção",
      description: "Tem certeza que deseja excluir?",
      confirmButtonText: "Sim",
      cancelButtonText: "Não",
      onConfirm: () => _viewModel.deleteBrand(brand),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarWidget(),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() => showAddNewBrand = !showAddNewBrand);
                  },
                  child: Text(showAddNewBrand ? "Cancelar" : "+ Novo Produto")),
              const SizedBox(height: 20),
              if (showSuccesLabel) const Text("Marca Adicionada com sucesso... :)"),
              if (showAddNewBrand) BrandAddWidget(onBrandAdded: onBrandAdded, onAddBrandTapped: onAddBrandTapped),
              if (isLoading)
                const Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    LoadingWidget(
                      size: Size(20, 20),
                    ),
                    SizedBox(width: 10),
                    Text("Carregando...")
                  ],
                ),
              const SizedBox(height: 40),
              Expanded(
                //TODO: Trocar por List View e adicionar a tabela dentro da lista para cada elemento?
                child: Consumer<BrandViewModel>(
                  builder: (context, viewModel, child) {
                    final brands = viewModel.brands;
                    return Table(
                      border: TableBorder.all(width: 0.5),
                      columnWidths: const {0: FixedColumnWidth(100), 1: FixedColumnWidth(400), 2: FixedColumnWidth(100), 3: IntrinsicColumnWidth()},
                      children: brands.map((brand) {
                        int index = brands.indexOf(brand);
                        bool isEditMode = index == indexInEditMode;
                        final controller = TextEditingController(text: brand.name);
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
                                          controller: controller,
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
                              child: SizedBox(
                                height: 50,
                                child: Row(
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          if (!isEditMode) {
                                            setState(() {
                                              indexInEditMode = index;
                                            });
                                          } else {
                                            updateBrand(brand, controller.text);
                                            setState(() {
                                              indexInEditMode = -1;
                                              isEditMode = false;
                                            });
                                          }
                                        },
                                        child: Text(isEditMode ? "Salvar" : "Editar")),
                                    TextButton(onPressed: () => delete(brand), child: const Text("Excluir")),
                                  ],
                                ),
                              )),
                        ]);
                      }).toList(),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
