import 'package:flutter/material.dart';

Widget materialRadioButton({int index, int selectedIndex, Function onChanged, Color activeColor, String text}) {
  return MaterialButton(
    child: Row(
      children: <Widget>[
        Radio(
          value: index, 
          groupValue: selectedIndex, 
          onChanged: onChanged, 
          activeColor: activeColor,
        ), 
        Text(text)
      ],
    ), 
    onPressed: () => onChanged(index));
}