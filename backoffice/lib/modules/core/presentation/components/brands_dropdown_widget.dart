import 'package:backoffice/modules/products/presentation/view_model/brand_view_model.dart';
import 'package:commons/modules/products/domain/models/brand_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrandsDropdownWidget extends StatefulWidget {
  final Brand? initialBrand;
  final Function(Brand?) onChanged;
  final bool isValid;
  const BrandsDropdownWidget({super.key, required this.onChanged, this.initialBrand, required this.isValid});

  @override
  State<BrandsDropdownWidget> createState() => _BrandsDropdownWidgetState();
}

class _BrandsDropdownWidgetState extends State<BrandsDropdownWidget> {
  Brand? dropdownValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dropdownValue = widget.initialBrand;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: SizedBox(
        height: widget.isValid ? 54 : 80,
        child: Consumer<BrandViewModel>(
          builder: (context, viewModel, child) {
            final brands = viewModel.brands;

            final dropdownItems = brands
                .map(
                  (brand) => DropdownMenuItem(
                    value: brand,
                    child: Text(brand.name),
                  ),
                )
                .toList();

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: DropdownButton(
                      isDense: true,
                      isExpanded: true,
                      //    dropdownColor: Colors.blue,

                      hint: const Text("Marca"),
                      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black),

                      //underline: Text("123"),

                      value: dropdownValue,
                      items: dropdownItems,
                      onChanged: (value) {
                        setState(() {
                          dropdownValue = value;
                        });
                        widget.onChanged(value);
                      },
                    ),
                  ),
                  if (!widget.isValid)
                    Text(
                      "Adicionar um valor",
                      style: TextStyle(color: Theme.of(context).colorScheme.error, fontSize: 12),
                    )
                ],
              ),
            );
          },
        ),
      ),
    );
    // return DropdownButton(items: , onChanged: onChanged)
  }
}
