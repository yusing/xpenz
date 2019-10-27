import 'package:flutter/material.dart';
import 'package:xpenz/add_event_page.dart';
import 'package:xpenz/callback.dart';
import 'package:xpenz/daily_notification.dart';
import 'package:xpenz/item.dart';
import 'my_drawer.dart';
import 'my_icons_icons.dart';
import 'my_appbar.dart';
import 'daily_notification.dart';

List<Item> eventItems = [];

void main() async {
  addDrawerItem(iconData: MyIcons.wallet, title: 'Wallet');
  await scheduleDailyNotification();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: MaterialColor(
          0xFFFFFFFF,
          { 
            50 : Colors.white, 
            100: Colors.white,
            200: Colors.white,
            300: Colors.white,
            400: Colors.white,
            500: Colors.white,
            600: Colors.white,
            700: Colors.white,
            800: Colors.white,
            900: Colors.white,
          }
        )
      ),
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
  _MyHomePageState() { callback = setState; }
  @override
  Widget build(BuildContext context) {
    _context = context;
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
                Text('${item.walletType.walletName}: \$${item.amount}', style: TextStyle(color: color),),
                Text(item.dateTime)
              ]
            ),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async => callback(
          () async {
            var newItem = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddEventPage())
            );
            if(newItem != null) {
              eventItems.add(newItem);
            }
          }
        )
      ),
    );
  }
}
