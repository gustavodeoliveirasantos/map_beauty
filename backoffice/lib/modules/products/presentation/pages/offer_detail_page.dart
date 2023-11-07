import 'package:backoffice/modules/core/presentation/components/app_bar_widget.dart';
import 'package:flutter/material.dart';

class OfferDetailPage extends StatefulWidget {
  const OfferDetailPage({super.key});

  @override
  State<OfferDetailPage> createState() => _OfferDetailPageState();
}

class _OfferDetailPageState extends State<OfferDetailPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(),
    );
  }
}
