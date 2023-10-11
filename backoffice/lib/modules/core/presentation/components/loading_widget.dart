import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final Color? color;
  final Size? size;
  final double? strokeWidth;
  const LoadingWidget({this.color, this.size, this.strokeWidth, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: size?.height,
        width: size?.width,
        child: CircularProgressIndicator(
          color: color,
          //   value: 1,
          strokeWidth: strokeWidth ?? 3.0,
        ),
      ),
    );
  }
}
