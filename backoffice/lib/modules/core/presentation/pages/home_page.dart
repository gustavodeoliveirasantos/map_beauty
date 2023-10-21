import 'package:backoffice/modules/core/presentation/components/app_bar_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Center(
        child: Text(
          "Olá 😊, Seja bem vinda ao MAP beauty!",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
