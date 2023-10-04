import 'package:flutter/material.dart';

class StepperSeparatorWidget extends StatelessWidget {
  const StepperSeparatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Container(width: double.infinity, height: 0.5, color: Colors.grey),
        ));
  }
}
