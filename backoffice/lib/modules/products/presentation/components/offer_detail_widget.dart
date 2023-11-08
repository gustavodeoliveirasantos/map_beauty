import 'package:backoffice/modules/products/domain/models/offer_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

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
  static const _locale = 'pt_BR';
  String _formatNumber(String s) {
    return NumberFormat.decimalPattern(_locale).format(int.parse(s));
  }

  String get _currency => NumberFormat.compactSimpleCurrency(locale: _locale).currencySymbol;

  final _productNameController = TextEditingController();
  final _productDescriptionController = TextEditingController();
  final _urlController = TextEditingController();
  final _oldPriceController = TextEditingController();
  final _discountPriceController = TextEditingController();

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
              height: screenSize.height / 1.5,
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
              child: Container(
                color: Colors.amber,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: TextField(
                            controller: _productNameController,
                            decoration: const InputDecoration(labelText: "Nome Produto"),
                          ),
                        ),
                        const SizedBox(width: 40),
                        Flexible(
                          flex: 1,
                          child: TextField(
                            controller: _urlController,
                            decoration: const InputDecoration(labelText: "URL"),
                          ),
                        )
                      ],
                    ),
                    TextField(
                      maxLines: 2,
                      controller: _productDescriptionController,
                      decoration: const InputDecoration(labelText: "Descrição do Produto"),
                    ),
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: TextField(
                            controller: _oldPriceController,
                            decoration: InputDecoration(labelText: "Preço Anterior", prefixText: _currency),
                            onChanged: (value) {
                              value = '${_formatNumber(value.replaceAll(',', ''))}';
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
                            decoration: InputDecoration(labelText: "Preço com Desconto", prefixText: _currency),
                            onChanged: (value) {
                              final replaced = value.replaceAll(',', '');
                              value = '${_formatNumber(replaced)}';
                              _discountPriceController.value = TextEditingValue(
                                text: value,
                                selection: TextSelection.collapsed(offset: value.length),
                              );
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              //   color: Colors.amber,
            ),
          ],
        ),
      ),
    );
  }
}
