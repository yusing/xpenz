import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget singleLineTextField(
    {IconData leadingIcon,
    double iconSize = 24,
    TextEditingController controller,
    String hintText,
    bool readOnly = false,
    TextInputType inputType = TextInputType.text,
    Function validator,
    FocusNode focusNode,
    int maxLength,
    Key formKey}) {
  return ListTile(
    leading: Icon(leadingIcon, size: iconSize),
    title: TextFormField(
      key: formKey,
      controller: controller,
      decoration: InputDecoration(border: InputBorder.none, hintText: hintText),
      maxLines: 1,
      readOnly: readOnly,
      keyboardType: inputType,
      validator: validator,
      autovalidate: validator != null,
      focusNode: focusNode,
      maxLength: maxLength,
      textAlign: TextAlign.left,
    ),
  );
}
