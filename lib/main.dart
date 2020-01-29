import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:xpenz/add_event_page.dart';
import 'package:xpenz/callback.dart';
import 'package:xpenz/item.dart';

import 'my_appbar.dart';
import 'my_drawer.dart';

List<Item> eventItems;
File file;

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SimplePermissions.requestPermission(Permission.WriteExternalStorage);
    file = File('${getApplicationDocumentsDirectory()}/data.json');
    if (!file.existsSync()) file.createSync(recursive: true);
    var data = file.readAsStringSync();
    eventItems = JsonDecoder().convert(data);
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: MaterialColor(0xFFFFFFFF, {
        50: Colors.white,
        100: Colors.white,
        200: Colors.white,
        300: Colors.white,
        400: Colors.white,
        500: Colors.white,
        600: Colors.white,
        700: Colors.white,
        800: Colors.white,
        900: Colors.white,
      })),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState() {
    callback = setState;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(title: MyAppBar()),
      body: ListView.builder(
          itemCount: eventItems.length,
          itemBuilder: (context, index) {
            Item item = eventItems[index];
            bool gained = item.amount > 0;
            Color color = gained ? Colors.indigoAccent : Colors.redAccent;
            return ListTile(
              leading: Icon(gained ? Icons.attach_money : Icons.money_off),
              title: Text(item.eventName),
              subtitle: Text(item.description),
              trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '\$${item.amount}',
                      style: TextStyle(color: color),
                    ),
                    Text(item.dateTime),
                    Text('${item.category}')
                  ]),
            );
          }),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () async => callback(() async {
                var newItem = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddEventPage()));
                if (newItem != null) {
                  eventItems.add(newItem);
                  balance += newItem.amount;
                }
              })),
    );
  }
}
