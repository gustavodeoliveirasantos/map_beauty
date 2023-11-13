import 'dart:ui';
import 'package:backoffice/modules/core/presentation/components/brands_dropdown_widget.dart';
import 'package:backoffice/modules/core/presentation/components/loading_widget.dart';
import 'package:backoffice/modules/core/utils/utils.dart';
import 'package:backoffice/modules/core/utils/view_utils.dart';
import 'package:backoffice/modules/products/domain/models/brand_model.dart';
import 'package:backoffice/modules/products/domain/models/offer_model.dart';
import 'package:backoffice/modules/products/presentation/components/offer_image_widget.dart';
import 'package:backoffice/modules/products/presentation/view_model/brand_view_model.dart';
import 'package:backoffice/modules/products/presentation/view_model/offer_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OfferDetailWidget extends StatefulWidget {
  final Function() onCloseTapped;
  final Offer? offer;
  const OfferDetailWidget({
    required this.onCloseTapped,
    this.offer,
    super.key,
  });

  @override
  State<OfferDetailWidget> createState() => _OfferDetailWidgetState();
}

class _OfferDetailWidgetState extends State<OfferDetailWidget> {
  Offer? _offer;
  Brand? _selectedBrand;

  late OfferViewModel _viewModel;
  bool _isEditMode = false;
  static const _locale = 'pt_BR';
  String _formatNumber(String s) {
    return NumberFormat.decimalPattern(_locale).format(int.parse(s));
  }

  NumberFormat coin = NumberFormat.currency(
    locale: 'pt_BR', // Defina a localização desejada
    symbol: '', // Símbolo da moeda
  );

  String get _currency => NumberFormat.compactSimpleCurrency(locale: _locale).currencySymbol;

  final _productNameController = TextEditingController();
  final _productDescriptionController = TextEditingController();
  final _urlController = TextEditingController();
  final _oldPriceController = TextEditingController();
  final _discountPriceController = TextEditingController();

  bool _isProductNameValid = true;
  bool _isProductDescriptionValid = true;
  bool _isUrlValid = true;
  bool _isOldPriceValid = true;
  bool _isDiscountPriceValid = true;
  bool _isBrandValid = true;

  List<String> _images = [];
  final _scrollController = ScrollController();
  bool _isImageUploading = false;

  @override
  void initState() {
    super.initState();
    _viewModel = Provider.of<OfferViewModel>(context, listen: false);
    _offer = widget.offer;
    if (widget.offer != null) {
      _isEditMode = true;
      _productNameController.text = widget.offer!.productName;
      _productDescriptionController.text = widget.offer!.productDescription;
      _urlController.text = widget.offer!.buyUrl;
      _oldPriceController.text = coin.format(widget.offer!.oldPrice);
      _discountPriceController.text = coin.format(widget.offer!.discountPrice);

      _images = widget.offer!.images ?? [];
      _selectedBrand = Provider.of<BrandViewModel>(context, listen: false).getBrandById(widget.offer!.brandId);
    }
  }

  void saveOffer() async {
    bool isFormValid = validateFields();

    //  final date = _offer?.date ?? DateTime.now();
    // final isActive = _offer?.isActive ?? false;

    if (_isEditMode) {
      editOffer();
    } else {
      addOffer();
    }
  }

  void editOffer() async {
    final productName = _productNameController.text;
    final productDescription = _productDescriptionController.text;
    final brandId = _selectedBrand?.id ?? "";
    final brandName = _selectedBrand?.name ?? "";
    final oldPrice = double.parse(_oldPriceController.text.replaceAll(",", "").replaceAll(".", "")) / 10;
    final discountPrice = double.parse(_discountPriceController.text.replaceAll(",", ".")) / 10;
    final buyUrl = _urlController.text;
    final images = _images ?? [];

    final offer = _offer!.copyWith(
      productName: productName,
      productDescription: productDescription,
      brandId: brandId,
      brandName: brandName,
      oldPrice: oldPrice,
      discountPrice: discountPrice,
      buyUrl: buyUrl,
      images: images,
    );

    _viewModel.updateOffer(offer);
  }

  void addOffer() async {
    final offer = Offer(
      id: Utils.uuid(),
      date: DateTime.now(),
      isActive: false,
      productName: _productNameController.text,
      productDescription: _productDescriptionController.text,
      brandId: _selectedBrand?.id ?? "",
      brandName: _selectedBrand?.name ?? "",
      oldPrice: double.parse(_oldPriceController.text.replaceAll(",", "").replaceAll(".", "")) / 10,
      discountPrice: double.parse(_discountPriceController.text.replaceAll(",", ".")) / 10,
      buyUrl: _urlController.text,
      images: [],
    );

    _viewModel.addOffer(offer).then((value) {
      _offer = offer;
      setState(() => _isEditMode = true);
    });
  }

  void uploadImages() async {
    setState(() => _isImageUploading = true);
    if (_offer != null) {
      final result = await ViewUtils.getMultiImagesDataFromImagePicker();

      await _viewModel.uploadImages(_offer!, result ?? [], (offer) {
        _offer = offer;
        setState(() {
          _images = _offer!.images;
        });
      });
    }

    setState(() => _isImageUploading = false);
  }

  void onDeleteImage(String imageName) async {
    if (_offer != null) {
      await _viewModel.deleteImage(_offer!, imageName, (offer) {
        setState(() {});
      });
    }
  }

  bool validateFields() {
    setState(() {
      _isProductNameValid = _productNameController.text.isNotEmpty;
      _isProductDescriptionValid = _productDescriptionController.text.isNotEmpty;

      _isUrlValid = Utils.isValidUrl(_urlController.text);
      _isOldPriceValid = Utils.isDouble(_oldPriceController.text.replaceAll(",", "").replaceAll(".", ""));
      _isDiscountPriceValid = Utils.isDouble(_discountPriceController.text.replaceAll(",", "."));
      _isBrandValid = _selectedBrand != null;
    });

    return _isProductNameValid && _isProductDescriptionValid && _isUrlValid && _isOldPriceValid && _isDiscountPriceValid && _isBrandValid;
  }

  String getPriceMask(String value) {
    RegExp regex = RegExp(r'[a-zA-Z]');
    final replaced = value.replaceAll(',', '').replaceAll('.', '').replaceAll(regex, '');
    final doubleValue = double.parse(replaced) / 100;
    return coin.format(doubleValue);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height,
      width: screenSize.width,
      color: Colors.black26,
      child: Center(
        child: Stack(
          children: [
            Container(
              color: Colors.white,
              height: 650,
              width: screenSize.width / 1.7,
            ),
            Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: widget.onCloseTapped,
                )),
            Positioned(
              top: 40,
              right: 20,
              left: 20,
              bottom: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: TextField(
                          controller: _productNameController,
                          decoration: InputDecoration(
                            labelText: "Nome Produto",
                            errorText: _isProductNameValid ? null : "Campo não pode ser vazio",
                          ),
                        ),
                      ),
                      const SizedBox(width: 40),
                      Flexible(
                        flex: 1,
                        child: BrandsDropdownWidget(
                          initialBrand: _selectedBrand,
                          isValid: _isBrandValid,
                          onChanged: (brand) => _selectedBrand = brand,
                        ),
                      ),
                    ],
                  ),
                  TextField(
                    //    maxLines: 2,
                    controller: _productDescriptionController,
                    decoration: InputDecoration(
                      labelText: "Descrição do Produto",
                      errorText: _isProductDescriptionValid ? null : "Campo não pode ser vazio",
                    ),
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: TextField(
                          controller: _urlController,
                          decoration: InputDecoration(
                            labelText: "URL",
                            errorText: _isUrlValid ? null : "URL Inválida - Deve conter \"https://\"",
                          ),
                        ),
                      ),
                      const SizedBox(width: 40),
                      const Flexible(flex: 1, child: SizedBox())
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: TextField(
                          controller: _oldPriceController,
                          decoration: InputDecoration(
                            labelText: "Preço Anterior",
                            prefixText: _currency,
                            errorText: _isOldPriceValid ? null : "Valor Inválido",
                          ),
                          onChanged: (value) {
                            value = getPriceMask(value);
                            _oldPriceController.value = TextEditingValue(
                              text: value,
                              selection: TextSelection.collapsed(offset: value.length),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 40),
                      Flexible(
                        flex: 1,
                        child: TextField(
                          controller: _discountPriceController,
                          decoration: InputDecoration(
                            labelText: "Preço com Desconto",
                            prefixText: _currency,
                            errorText: _isDiscountPriceValid ? null : "Valor Inválido",
                          ),
                          onChanged: (value) {
                            value = getPriceMask(value);
                            _discountPriceController.value = TextEditingValue(
                              text: value,
                              selection: TextSelection.collapsed(offset: value.length),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      ElevatedButton(
                          onPressed: !_isEditMode || _isImageUploading ? null : uploadImages,
                          child: _isImageUploading
                              ? const LoadingWidget(
                                  strokeWidth: 2,
                                  size: Size(20, 20),
                                )
                              : const Text("Adicionar Fotos")),
                      const SizedBox(width: 20),
                      ElevatedButton(onPressed: saveOffer, child: Text("Salvar")),
                    ],
                  ),
                  Scrollbar(
                    thumbVisibility: true,
                    controller: _scrollController,
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(
                        dragDevices: {
                          PointerDeviceKind.touch,
                          PointerDeviceKind.mouse,
                        },
                      ),
                      child: SingleChildScrollView(
                        controller: _scrollController,
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: _images
                              .map(
                                (e) => OfferImageWidget(imageName: e, onDeleteTapped: onDeleteImage),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              //   color: Colors.amber,
            ),
          ],
        ),
      ),
    );
  }
}
