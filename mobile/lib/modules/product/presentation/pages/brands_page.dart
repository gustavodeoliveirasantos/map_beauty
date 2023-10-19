import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mapbeauty/firebase/firebase_storage_service.dart';
import 'package:mapbeauty/modules/core/utils/app_routes.dart';
import 'package:mapbeauty/modules/product/domain/models/brand.dart';
import 'package:mapbeauty/modules/product/presentation/components/firebase_storage_image_widget.dart';
import 'package:mapbeauty/modules/product/presentation/pages/products_page.dart';
import 'package:mapbeauty/modules/product/presentation/view_model/product_view_model.dart';
import 'package:provider/provider.dart';

class BrandsPage extends StatefulWidget {
  final Function(Brand) onBrandSelected;
  final Function(ScrollDirection direction) didScroll;
  const BrandsPage({super.key, required this.onBrandSelected, required this.didScroll});

  @override
  State<BrandsPage> createState() => _BrandsPageState();
}

class _BrandsPageState extends State<BrandsPage> with AutomaticKeepAliveClientMixin {
  List<Brand>? brands;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadBrands();
    });

    super.initState();
  }

  void loadBrands() async {
    brands = await Provider.of<ProductViewModel>(context, listen: false).loadBrands();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final imageSize = size.width / 3 - 30;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          final ScrollDirection direction = notification.direction;
          widget.didScroll(direction);

          return true;
        },
        child: GridView.builder(
          itemCount: brands?.length,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: size.width / 3,
            childAspectRatio: 0.8,
            mainAxisSpacing: 30,
            crossAxisSpacing: 30,
          ),
          itemBuilder: (context, index) {
            final brand = brands?[index];
            if (brand == null) {
              return Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.black12),
              );
            }
            return Column(
              children: [
                GestureDetector(
                  onTap: () => widget.onBrandSelected(brand),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      //   color: Colors.black,
                      border: Border.all(width: 0.3),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: FirebaseStorageImageWidget(
                        imageType: ImageType.logo,
                        imageName: brand.imageName,
                        height: imageSize,
                        width: imageSize,
                      ),
                    ),
                  ),
                ),
                Text(
                  brand.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
