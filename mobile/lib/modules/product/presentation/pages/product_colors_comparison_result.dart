import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mapbeauty/firebase/firebase_storage_service.dart';
import 'package:mapbeauty/modules/product/domain/models/product_colors.dart';
import 'package:mapbeauty/modules/product/presentation/components/firebase_storage_image_widget.dart';
import 'package:mapbeauty/modules/product/presentation/components/product_info_widget.dart';
import 'package:mapbeauty/modules/product/presentation/view_model/product_view_model.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../domain/models/color_type.dart';
import '../../domain/models/product.dart';

class ProductsColorComparisonResultArgs {
  final Product product;
  final ProductColor productColor;

  ProductsColorComparisonResultArgs(this.product, this.productColor);
}

class ProductsColorComparisonResult extends StatefulWidget {
  final ProductsColorComparisonResultArgs args;

  const ProductsColorComparisonResult({super.key, required this.args});

  @override
  State<ProductsColorComparisonResult> createState() => _ProductsColorComparisonResultState();
}

class _ProductsColorComparisonResultState extends State<ProductsColorComparisonResult> {
  bool isLoading = false;
  List<Product> products = [];
  bool isProductInfoHidden = false;
  // final StoreViewModel _viewModel = StoreViewModel();

  @override
  void initState() {
    final viewModel = Provider.of<ProductViewModel>(context, listen: false);
    isLoading = true;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      products = await viewModel.loadSimilarProductsUseCase(widget.args.product, widget.args.productColor.colorType);
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  void openProductPage(ProductColor productColor) async {
    final uri = Uri.parse(productColor.buyUrl);

    if (!await launchUrl(uri)) {
      throw Exception('Could not launch ${productColor.buyUrl}');
    }
  }

  didScroll(ScrollDirection direction) {
    // print(offset);
    if (direction == ScrollDirection.reverse) {
      setState(() => isProductInfoHidden = true);
    } else if (direction == ScrollDirection.forward) {
      setState(() => isProductInfoHidden = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 8,
        shadowColor: Colors.black,
        surfaceTintColor: Colors.transparent,
        //  foregroundColor: ,
        backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
        // backgroundColor: Colors.red,
        title: Text(
          "Resultados",
          style: GoogleFonts.belleza(
            fontSize: 26,
            color: Colors.black,
          ),
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                strokeWidth: 3.0,
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ProductInfoWidget(
                    product: widget.args.product,
                    productColor: widget.args.productColor,
                    isProductInfoHidden: isProductInfoHidden,
                  ),
                  SizedBox(height: isProductInfoHidden ? 0 : 20),
                  Expanded(
                    child: NotificationListener<UserScrollNotification>(
                      onNotification: (notification) {
                        final ScrollDirection direction = notification.direction;
                        didScroll(direction);
                        return true;
                      },
                      child: ListView.separated(
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return ListTile(
                            contentPadding: EdgeInsets.zero,
                            //   tileColor: Colors.amber,
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: FirebaseStorageImageWidget(
                                imageName: product.imageUrl,
                                imageType: ImageType.product,
                                height: 80,
                                width: 60,
                              ),

                              //  Image.asset(
                              //   product?.imageUrl! ?? "",
                              //   fit: BoxFit.cover,
                              //   //  height: double.infinity,
                              //   //   width: double.infinity,
                              // ),
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: Colors.black),
                                ),
                                Text(
                                  "Cor: ${product.getBrandColorNameFor(selectedColor: widget.args.productColor)}", //Adicionar cor equivalente
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: Colors.black),
                                ),
                              ],
                            ),
                            subtitle: Text(
                              "${product.brand.name}",
                              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: Colors.black),
                            ),
                            trailing: SizedBox(
                              height: 30,
                              child: TextButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.surfaceVariant),
                                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 8)),
                                ),
                                child: const Text(
                                  "Comprar",
                                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                                ),
                                onPressed: () => openProductPage(widget.args.productColor),
                              ),
                            ),
                            //   onTap: () => openProductPage(product),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Divider(height: 0.5),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
