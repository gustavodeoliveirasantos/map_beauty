import 'package:backoffice/modules/core/presentation/components/app_bar_widget.dart';
import 'package:backoffice/modules/products/domain/models/brand_model.dart';
import 'package:backoffice/modules/products/presentation/view_model/product_view_model.dart';
import 'package:flutter/material.dart';

class BrandsPage extends StatefulWidget {
  const BrandsPage({super.key});

  @override
  State<BrandsPage> createState() => _BrandsPageState();
}

class _BrandsPageState extends State<BrandsPage> {
  List<Brand> brands = [];

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
    final vm = ProductViewModel();
    brands = await vm.getBrands();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print("GOS - Entroeu aqui");
    return Scaffold(
      appBar: AppBarWidget(),
      body: ListView.builder(
        itemCount: brands.length,
        itemBuilder: (context, index) {
          final brand = brands[index];
          return Text(brand.name);
        },
      ),
    );
  }
}
