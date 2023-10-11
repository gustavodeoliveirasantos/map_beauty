import 'package:flutter/material.dart';

class MainDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var maxWidth = MediaQuery.of(context).size.width * 0.85;
    final controller = ScrollController();
    return Drawer(
      width: maxWidth > 450 ? 450 : maxWidth,
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Scrollbar(
            controller: controller,
            child: ListView(
              controller: controller,
              children: [
                ListTile(
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {},
                  trailing: IconButton(
                    splashRadius: 24,
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  title: Text(
                    'Configurações',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
