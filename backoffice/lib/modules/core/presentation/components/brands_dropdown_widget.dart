import 'package:backoffice/modules/products/domain/models/brand_model.dart';
import 'package:backoffice/modules/products/presentation/view_model/brand_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class BrandsDropdownWidget extends StatefulWidget {
  final Function(Brand) onChanged;
  const BrandsDropdownWidget({super.key, required this.onChanged});

  @override
  State<BrandsDropdownWidget> createState() => _BrandsDropdownWidgetState();
}

class _BrandsDropdownWidgetState extends State<BrandsDropdownWidget> {
  Brand? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Consumer<BrandViewModel>(
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

        return DropdownButton(
          value: dropdownValue,
          items: dropdownItems,
          onChanged: (value) {
            setState(() {
              dropdownValue = value;
            });
          },
        );
      },
    );
    // return DropdownButton(items: , onChanged: onChanged)
  }
}
