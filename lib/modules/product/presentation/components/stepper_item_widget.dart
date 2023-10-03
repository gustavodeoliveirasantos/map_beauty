import 'package:flutter/material.dart';

class StepperItemWidget extends StatelessWidget {
  final int step;
  final String title;
  final StepState state;

  const StepperItemWidget({super.key, required this.step, required this.state, required this.title});

  TextStyle getTextStyppeFromState() {
    Color color;
    switch (state) {
      case StepState.complete:
        color = Colors.grey;
        break;
      case StepState.indexed:
        color = Colors.blue;
        break;
      case StepState.editing:
        color = Colors.black;
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
      child: Column(
        children: [
          CircleAvatar(maxRadius: 16, child: Text("${step}")),
          Text(
            title,
            style: getTextStyppeFromState(),
          ),
        ],
      ),
    );
  }
}
