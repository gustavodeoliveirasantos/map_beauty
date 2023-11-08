import 'package:backoffice/modules/products/presentation/components/table_separator_widget.dart';
import 'package:flutter/material.dart';

class OffersTitleListWidget extends StatelessWidget {
  final String date;
  final String totalOfProducts;
  final Function() onActivateAllTapped;
  final Function() onDeactvateAllTapped;
  final Function() onDeleteAllTapped;
  const OffersTitleListWidget({
    super.key,
    required this.date,
    required this.totalOfProducts,
    required this.onActivateAllTapped,
    required this.onDeactvateAllTapped,
    required this.onDeleteAllTapped,
  });

  @override
  Widget build(BuildContext context) {
    const double rowHeight = 80;
    const double fontSize = 14;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 18),
                    children: <TextSpan>[
                      const TextSpan(text: 'Data: ', style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: date),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 16),
                    children: <TextSpan>[
                      const TextSpan(text: 'Total de Produtos: ', style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: totalOfProducts),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(width: 50),
            TextButton(onPressed: onActivateAllTapped, child: Text("Ativar Todos")),
            TextButton(onPressed: onDeactvateAllTapped, child: Text("Desativar Todos")),
            TextButton(onPressed: onDeactvateAllTapped, child: Text("Excluir Todos")),
          ],
        ),
        const SizedBox(height: 10),
        const Row(children: [
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
        ]),
      ],
    );
  }
}
