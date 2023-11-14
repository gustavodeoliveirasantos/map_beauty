import 'package:flutter/material.dart';

class BuyButtonWidget extends StatelessWidget {
  final Function() onPressed;
  const BuyButtonWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.surfaceVariant),
          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 8)),
        ),
        child: const Text(
          "Comprar",
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
