import 'package:flutter/material.dart';

class StepperSeparatorWidget extends StatelessWidget {
  const StepperSeparatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Container(width: 30, height: 0.5, color: Colors.grey),
        ));
  }
}
