import 'package:flutter/material.dart';
import 'package:mapbeauty/modules/product/presentation/components/stepper_item_widget.dart';
import 'package:mapbeauty/modules/product/presentation/components/stepper_separator_widget.dart';

class StepperWidget extends StatefulWidget {
  final bool isHidden;
  final int currentIndex;
  // Quantidade de steps já abertos, para saber qual devo colocar como disabled
  // Exemplo:
  // - usuário selecionou até as cores , voltou para a marca e selecionou outra marca..., logo as cores devem ser desabilitadas, por que não faz mais sentido apresenta-las
  final int stepsOpened;
  final Function(int index) onTap;
  const StepperWidget({super.key, required this.currentIndex, required this.onTap, required this.stepsOpened, required this.isHidden});

  @override
  State<StepperWidget> createState() => _StepperWidgetState();
}

class _StepperWidgetState extends State<StepperWidget> with SingleTickerProviderStateMixin {
  StepState getState(int stepIndex) {
    if (widget.stepsOpened - 1 < stepIndex) {
      return StepState.disabled;
    }

    if (widget.currentIndex == stepIndex) {
      return StepState.editing;
    } else if (widget.currentIndex > stepIndex) {
      return StepState.complete;
    } else if (widget.currentIndex < stepIndex) {
      return StepState.complete;
    } else {
      return StepState.error;
    }
  }

  notifyOnTapIfNeeded(int index) {
    if (widget.currentIndex == index) return;
  }

  @override
  Widget build(BuildContext context) {
    const animationDuration = Duration(milliseconds: 300);

    //FIXME; A animação reversa no Animated Size
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedSize(
        duration: animationDuration,
        child: SizedBox(
          height: widget.isHidden ? 0 : 80,
          child: AnimatedOpacity(
            duration: animationDuration,
            opacity: widget.isHidden ? 0 : 1,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                const StepperSeparatorWidget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StepperItemWidget(step: 1, title: "Marcas", state: getState(0), onTap: () => widget.onTap(0), isHidden: widget.isHidden),
                    //  const StepperSeparatorWidget(),
                    StepperItemWidget(step: 2, title: "Produtos", state: getState(1), onTap: () => widget.onTap(1), isHidden: widget.isHidden),
                    //  const StepperSeparatorWidget(),
                    StepperItemWidget(step: 3, title: "Cores", state: getState(2), onTap: () => widget.onTap(2), isHidden: widget.isHidden),
                    // StepperSeparatorWidget(),
                    // StepperItemWidget(step: 4, title: "Resultado", state: getState(3)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
