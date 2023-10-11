import 'package:flutter/material.dart';
import 'package:scmia_eprom/constants.dart';

class OptionTile extends StatefulWidget {
  OptionTile({super.key, required this.option, required this.index});

  String option;
  int index;

  @override
  State<OptionTile> createState() => _OptionTileState();
}

class _OptionTileState extends State<OptionTile> {
  @override
  Widget build(BuildContext context) {
    int selectedOption = 1;
    return ListTile(
      leading: Radio(
        fillColor: MaterialStateProperty.all(theme_dark),
        value: selectedOption,
        groupValue: 2,
        onChanged: (value) {
          setState(() {
            selectedOption = value!;
          });
        },
      ),
      title: Text(
        "${widget.index} - ${widget.option}",
        style: option_style,
      ),
    );
  }
}
