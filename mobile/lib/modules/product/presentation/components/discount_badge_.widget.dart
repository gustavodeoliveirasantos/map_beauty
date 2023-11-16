import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DiscountBadgeWidget extends StatelessWidget {
  final double discount;
  final double height;
  final double width;
  final double fontSize;
  const DiscountBadgeWidget({super.key, required this.discount, required this.height, required this.width, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(height / 2),
        ),
      ),
      width: width,
      height: height,
      child: Center(
        child: Text(
          "${discount.toStringAsFixed(0)}%",
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
