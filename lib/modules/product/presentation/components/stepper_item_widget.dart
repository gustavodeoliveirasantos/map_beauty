// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class StepperItemWidget extends StatelessWidget {
  final int step;
  final String title;
  final StepState state;
  final Function() onTap;

  const StepperItemWidget({
    Key? key,
    required this.step,
    required this.title,
    required this.state,
    required this.onTap,
  }) : super(key: key);

  TextStyle getTextStyppeFromState() {
    Color color;
    switch (state) {
      case StepState.complete: //Já passei por ele
        color = Colors.black;
        break;
      case StepState.editing: //Atual
        color = Colors.blue;
        break;
      case StepState.disabled:
        color = Colors.yellow;
        break;
      default:
        color = Colors.grey;
        break;
    }

    return TextStyle(color: color);
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 3,
      child: InkWell(
        onTap: () {
          if (state != StepState.disabled) onTap();
        },
        child: Column(
          children: [
            CircleAvatar(maxRadius: 16, child: Text("${step}")),
            Text(
              title,
              style: getTextStyppeFromState(),
            ),
          ],
        ),
      ),
    );
  }
}
