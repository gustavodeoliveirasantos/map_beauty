import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  final bool forceActive;
  final Function(String) onChanged;
  final Function() onClose;

  SearchBarWidget({required this.onChanged, required this.onClose, required this.forceActive, super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _controler = TextEditingController();
  FocusNode focusNode = FocusNode();
  bool showCancelButton = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.forceActive) FocusScope.of(context).requestFocus(focusNode);
    });
  }

  @override
  void didUpdateWidget(covariant SearchBarWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (widget.forceActive) FocusScope.of(context).requestFocus(focusNode);
  }

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      focusNode: focusNode,
      controller: _controler,
      hintText: "Pesquisar...",
      leading: const Icon(Icons.search),
      elevation: const MaterialStatePropertyAll(1),
      trailing: [
        if (showCancelButton)
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              _controler.clear();
              setState(() {
                showCancelButton = false;
              });
              widget.onClose();
            },
          )
      ],
      onChanged: (value) {
        setState(() {
          showCancelButton = value.isNotEmpty;
        });
        widget.onChanged(value);
        print(value);
      },
    );
  }
}
