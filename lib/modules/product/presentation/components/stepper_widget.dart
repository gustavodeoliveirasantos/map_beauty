import 'package:flutter/material.dart';
import 'package:mapbeauty/modules/product/presentation/components/stepper_item_widget.dart';
import 'package:mapbeauty/modules/product/presentation/components/stepper_separator_widget.dart';

class StepperWidget extends StatelessWidget {
  final int currentIndex;
  const StepperWidget({super.key, required this.currentIndex});

  StepState getState(int stepIndex) {
    if (currentIndex == stepIndex) {
      return StepState.editing;
    } else if (currentIndex > stepIndex) {
      return StepState.indexed;
    } else if (currentIndex < stepIndex) {
      return StepState.complete;
    } else
      return StepState.error;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      // height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StepperItemWidget(step: 1, title: "Marca", state: getState(0)),
          StepperSeparatorWidget(),
          StepperItemWidget(step: 2, title: "Produto", state: getState(1)),
          StepperSeparatorWidget(),
          StepperItemWidget(step: 3, title: "Cor", state: getState(2)),
          StepperSeparatorWidget(),
          StepperItemWidget(step: 4, title: "Resultado", state: getState(3)),
        ],
      ),
    );
  }
}
