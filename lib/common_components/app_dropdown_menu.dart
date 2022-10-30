import 'package:flutter/material.dart';

class AppDropDownMenu extends StatefulWidget {
  const AppDropDownMenu({
    Key? key,
    required this.items,
    required this.onChanged,
    required this.hint,
  }) : super(key: key);
  final List<String> items;
  final void Function(String?)? onChanged;
  final String hint;

  @override
  State<AppDropDownMenu> createState() => _AppDropDownMenuState();
}

class _AppDropDownMenuState extends State<AppDropDownMenu> {
  int selectedItem = -1;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: DropdownButton<String>(
          underline: const SizedBox(),
          hint: Center(
              child: Text(
            widget.hint,
            textAlign: TextAlign.center,
          )),
          value: selectedItem.isNegative ? null : widget.items[selectedItem],
          items: List.generate(
              widget.items.length,
              (i) => DropdownMenuItem(
                  onTap: () => setState(() => selectedItem = i),
                  child: Center(
                    child: Text(widget.items[i], textAlign: TextAlign.center),
                  ),
                  value: widget.items[i])),
          onChanged: widget.onChanged,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
