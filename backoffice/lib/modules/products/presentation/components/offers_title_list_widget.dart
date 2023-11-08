import 'package:backoffice/modules/products/presentation/components/table_separator_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class OffersTitleListWidget extends StatelessWidget {
  const OffersTitleListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const double rowHeight = 80;
    const double fontSize = 14;

    return const Row(children: [
      SizedBox(
          width: 200,
          child: Text(
            "Produto",
            style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
          )),
      TableSeparatorWidget(height: rowHeight),
      SizedBox(
          width: 120,
          child: Text(
            "Marca",
            style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
          )),
      TableSeparatorWidget(height: rowHeight),
      SizedBox(
          width: 80,
          child: Text(
            "Preço Anterior",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
          )),
      TableSeparatorWidget(height: rowHeight),
      SizedBox(
          width: 80,
          child: Text(
            "Preço com Desconto",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
          )),
      TableSeparatorWidget(height: rowHeight),
      SizedBox(
          width: 70,
          child: Text(
            "Imagens",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
          )),
      TableSeparatorWidget(height: rowHeight),
      SizedBox(
          width: 60,
          child: Text(
            "Link",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
          )),
      TableSeparatorWidget(height: rowHeight),
      SizedBox(
          width: 180,
          child: Text(
            "Ações",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
          )),
    ]);
  }
}
