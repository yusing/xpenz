import 'dart:math';

import 'package:flutter/material.dart';
import 'package:xpenz/single_line_textfield.dart';
class DropDownMenu extends StatefulWidget {
  final List<String> values;
  final TextEditingController controller;
  final IconData leadingIcon;
  final double iconSize;
  final double fontSize;
  DropDownMenu({this.values, @required this.controller, @required this.leadingIcon, this.iconSize = 24.0, this.fontSize = 16.0});

  @override
  _DropDownMenuState createState() => _DropDownMenuState(values: this.values, controller: this.controller, leadingIcon: this.leadingIcon, iconSize: this.iconSize, fontSize: fontSize);
}

class _DropDownMenuState extends State<DropDownMenu> {
  final FocusNode _focusNode = FocusNode();
  final List<String> values;
  final TextEditingController controller;
  final IconData leadingIcon;
  final double iconSize;
  final double fontSize;
  OverlayEntry _overlayEntry;

  _DropDownMenuState({this.values, this.controller, this.leadingIcon, this.iconSize, this.fontSize});

  @override
  void initState() {
    _focusNode.addListener(() {
      if (_focusNode.hasPrimaryFocus) {
        this._overlayEntry = this._createOverlayEntry();
        Overlay.of(context).insert(this._overlayEntry);
      } else {
        this._overlayEntry.remove();
      }
    });
    super.initState();
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject();
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);
    var windowSize = MediaQuery.of(context).size;
    var top = offset.dy + size.height;

    var sorted = List.from(values);
    sorted.sort((s1, s2) => s2.length.compareTo(s1.length));

    return OverlayEntry(
      builder: (context) => Positioned(
        // p16-icon-p16-p16-text
        left: offset.dx + iconSize + 48.0,
        top: top,
        width: sorted[0].length * fontSize,
        // to confirm that it won't be shown outside of the screen
        height: min(size.height * values.length, windowSize.height - top),
        child: Material(
          elevation: 4.0,
          child: ListView(
            padding: EdgeInsets.zero,
            children: values.map(
              (item) => ListTile(
                dense: false,
                title: Text(item, textAlign: TextAlign.center, style: TextStyle(fontSize: fontSize)),
                onTap: () {
                  controller.text = item;
                  this._focusNode.unfocus();
                }
              )
            ).toList()
          )
        )
      )
    );
  }

  @override
  Widget build(context) {
    return singleLineTextField(
      controller: controller,
      focusNode: this._focusNode,
      readOnly: true,
      hintText: 'Wallet Type',
      leadingIcon: leadingIcon,
      iconSize: iconSize
    );
  }
}