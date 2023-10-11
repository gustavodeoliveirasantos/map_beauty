import 'package:flutter/material.dart';

class StepperSeparatorWidget extends StatelessWidget {
  const StepperSeparatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Transform.translate(offset: Offset(0, -10), child: Container(width: double.infinity, height: 0.5, color: Colors.grey)),
    );
  }
}
