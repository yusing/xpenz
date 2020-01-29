import 'package:flutter/material.dart';

List<IconData> walletIcons = [];
int currentWalletIndex = 0;

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: <Widget>[
        Align(
          child: ListTile(leading: Icon(Icons.filter), title: Text('Filter')),
          alignment: Alignment.bottomCenter,
        )
      ],
    ));
  }
}

/*
ListView.builder(
          itemCount: walletTypes.length,
          itemBuilder: (context, index) {
            Wallet wallet = walletTypes[index];
            return ListTile(
              leading: Icon(walletIcons[index]),
              title: Text(wallet.walletName),
              onTap: () => currentWalletIndex = index,
            );
          },
        )
        */
