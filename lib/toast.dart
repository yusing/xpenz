import 'package:flutter/material.dart';

class ToastPosition {
  static const Top = 0x10, Bottom = 0x20;
  static const Left = 0x1, Right = 0x2, Center = 0x3;
}

OverlayEntry _toastOverlayEntry(context, content, toastPosition) {
  var padding = MediaQuery.of(context).padding;
  var paddingLR = 40.0;
  var paddingTB = 120.0;
  var fontSize = 12.0;

  var box = DecoratedBox(
    child: Text(
      content,
      style: TextStyle(
        color: Colors.white, 
        backgroundColor: Colors.red,
        fontSize: fontSize,
        decoration: TextDecoration.none,
      ),
      textAlign: TextAlign.center,
      softWrap: true,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Colors.red
    )
  );

  return OverlayEntry(
    builder: (context) => toastPosition & ToastPosition.Top != 0 ? 
    Positioned(
      left: toastPosition & ToastPosition.Left != 0 ? 0 : paddingLR,
      right: toastPosition & ToastPosition.Right != 0 ? 0 : paddingLR,
      top: padding.top + paddingTB,
      child: box
    ) : 
    Positioned(
      left: toastPosition & ToastPosition.Left != 0 ? 0 : paddingLR,
      right: toastPosition & ToastPosition.Right != 0 ? 0 : paddingLR,
      bottom: paddingTB,
      child: box
    )
  );
}

Future<void> showToast({BuildContext context, Duration duration, String content, int toastPosition}) async {
  var overlayEntry = _toastOverlayEntry(context, content, toastPosition);
  Overlay.of(context).insert(overlayEntry);
  await Future.delayed(duration, () => overlayEntry.remove());
}