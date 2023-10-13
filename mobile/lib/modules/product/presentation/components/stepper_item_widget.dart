// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class StepperItemWidget extends StatelessWidget {
  final int step;
  final String title;
  final StepState state;
  final bool isHidden;
  final Function() onTap;

  const StepperItemWidget({
    Key? key,
    required this.step,
    required this.title,
    required this.state,
    required this.onTap,
    required this.isHidden,
  }) : super(key: key);

  TextStyle getTextStyppeFromState(BuildContext context) {
    Color color;
    FontWeight fontWeight;

    switch (state) {
      case StepState.complete: //Já passei por ele
        color = Colors.black;
        fontWeight = FontWeight.normal;
        break;
      case StepState.editing: //Atual
        color = Theme.of(context).colorScheme.primary;
        fontWeight = FontWeight.bold;
        break;
      case StepState.disabled:
        color = Colors.grey;
        fontWeight = FontWeight.normal;
        break;
      default:
        color = Colors.grey;
        fontWeight = FontWeight.normal;
        break;
    }

    return TextStyle(color: color, fontWeight: fontWeight);
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 3,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          if (state != StepState.disabled) onTap();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CircleAvatar(
                  maxRadius: 20,
                  child: Text(
                    "${step}",
                    style: getTextStyppeFromState(context),
                  )),
              Text(
                title,
                style: getTextStyppeFromState(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
