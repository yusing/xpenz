import 'package:flutter/material.dart';

double balance = 0;
ValueNotifier<double> balanceChangedNoitfier = ValueNotifier(balance);

class MyAppBar extends StatefulWidget {
  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder( // rebuild the whole ListView when 'balance' is changed
      valueListenable: balanceChangedNoitfier,
      builder: (context, $, $$) {
        return ListTile(
          title: Text('XpenZ'),
          trailing: Text('Balance: \$$balance')
        );
      }
    );
  }
}