import 'package:flutter/material.dart';
import 'package:mapbeauty/modules/core/utils/app_routes.dart';
import 'package:mapbeauty/modules/product/domain/models/brand.dart';
import 'package:mapbeauty/modules/product/presentation/pages/products_page.dart';
import 'package:mapbeauty/modules/product/presentation/view_model/product_view_model.dart';
import 'package:provider/provider.dart';

class BrandsPage extends StatefulWidget {
  final Function(Brand) onBrandSelected;
  const BrandsPage({super.key, required this.onBrandSelected});

  @override
  State<BrandsPage> createState() => _BrandsPageState();
}

class _BrandsPageState extends State<BrandsPage> {
  List<Brand>? brands;

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadBrands();
    });

    super.initState();
  }

  void loadBrands() async {
    Future.delayed(Duration(seconds: 3));
    brands = await Provider.of<ProductViewModel>(context, listen: false).loadBrands();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GridView.builder(
      itemCount: brands?.length,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: size.width / 3,
        childAspectRatio: 1,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      itemBuilder: (context, index) {
        final brand = brands?[index];
        if (brand == null) {
          return Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.black12),
          );
        }
        return GestureDetector(
          onTap: () => widget.onBrandSelected(brand),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              //   color: Colors.black,
              border: Border.all(),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  brand.imageUrl,
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
