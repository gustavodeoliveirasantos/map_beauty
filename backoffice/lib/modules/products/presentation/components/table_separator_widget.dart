import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TableSeparatorWidget extends StatelessWidget {
  final double height;
  const TableSeparatorWidget({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: height,
      width: 0.8,
      color: Colors.grey,
    );
  }
}
