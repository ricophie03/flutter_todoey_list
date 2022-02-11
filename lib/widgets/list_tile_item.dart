import 'package:flutter/material.dart';

class ListTileItems extends StatelessWidget {
  final bool? isChecked;
  final String? taskText;
  final void Function(bool?)? toogleCheckBox;

  ListTileItems({this.isChecked = false, this.taskText, this.toogleCheckBox});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        '$taskText',
        style: TextStyle(
            fontSize: 20.0,
            decoration: isChecked! ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: toogleCheckBox,
      ),
    );
  }
}
