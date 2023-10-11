import 'package:flutter/material.dart';
import 'package:mapbeauty/modules/product/presentation/components/stepper_item_widget.dart';
import 'package:mapbeauty/modules/product/presentation/components/stepper_separator_widget.dart';

class StepperWidget extends StatelessWidget {
  final int currentIndex;
  // Quantidade de steps já abertos, para saber qual devo colocar como disabled
  // Exemplo:
  // - usuário selecionou até as cores , voltou para a marca e selecionou outra marca..., logo as cores devem ser desabilitadas, por que não faz mais sentido apresenta-las
  final int stepsOpened;
  final Function(int index) onTap;
  const StepperWidget({super.key, required this.currentIndex, required this.onTap, required this.stepsOpened});

  StepState getState(int stepIndex) {
    if (stepsOpened - 1 < stepIndex) {
      return StepState.disabled;
    }

    if (currentIndex == stepIndex) {
      return StepState.editing;
    } else if (currentIndex > stepIndex) {
      return StepState.complete;
    } else if (currentIndex < stepIndex) {
      return StepState.complete;
    } else {
      return StepState.error;
    }
  }

  notifyOnTapIfNeeded(int index) {
    if (currentIndex == index) return;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        const StepperSeparatorWidget(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StepperItemWidget(step: 1, title: "Marcas", state: getState(0), onTap: () => onTap(0)),
            //  const StepperSeparatorWidget(),
            StepperItemWidget(step: 2, title: "Produtos", state: getState(1), onTap: () => onTap(1)),
            //  const StepperSeparatorWidget(),
            StepperItemWidget(step: 3, title: "Cores", state: getState(2), onTap: () => onTap(2)),
            // StepperSeparatorWidget(),
            // StepperItemWidget(step: 4, title: "Resultado", state: getState(3)),
          ],
        ),
      ],
    );
  }
}
