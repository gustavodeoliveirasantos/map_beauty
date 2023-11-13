import 'package:flutter/material.dart';

import 'package:fluttericon/entypo_icons.dart';
import 'package:mapbeauty/modules/product/presentation/pages/find_products_home_page.dart';
import 'package:mapbeauty/modules/product/presentation/pages/offers_page.dart';
import 'package:provider/provider.dart';

class TabBarPage extends StatefulWidget {
  final int initialIndex;
  const TabBarPage({required this.initialIndex, super.key});

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> with WidgetsBindingObserver {
  late int _selectedIndex;
  @override
  void initState() {
    _selectedIndex = widget.initialIndex;
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {}
  }

  final tabs = [
    'Promoções',
    'Descubra',
  ];

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          OffersPage(),
          FindProductsHomePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.local_offer),
            label: tabs[0],
          ),
          BottomNavigationBarItem(
            icon: const Icon(Entypo.search),
            label: tabs[1],
          ),
        ],
      ),
      //   drawer: MainDrawerWidget(),
    );
  }
}
