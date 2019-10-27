import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'add_event_page.dart';

BuildContext _context;

Future onSelectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
    await Navigator.push(
      _context,
      new MaterialPageRoute(builder: (context) => AddEventPage()),
    );
}

Future<void> scheduleDailyNotification() async {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
  // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
  var initializationSettingsAndroid =
      new AndroidInitializationSettings('app_icon');
  var initializationSettingsIOS = new IOSInitializationSettings();
  var initializationSettings = new InitializationSettings(
      initializationSettingsAndroid, initializationSettingsIOS);
  flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: onSelectNotification);
  var time = new Time(02, 0, 0);
  var androidPlatformChannelSpecifics =
      new AndroidNotificationDetails('repeatDailyAtTime channel id',
          'repeatDailyAtTime channel name', 'repeatDailyAtTime description');
  var iOSPlatformChannelSpecifics =
      new IOSNotificationDetails();
  var platformChannelSpecifics = new NotificationDetails(
      androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.showDailyAtTime(
      0,
      'show daily title',
      'Daily notification shown at approximately ${time.hour.toUnsigned(2)}:${time.minute.toUnsigned(2)}:${time.second.toUnsigned(2)}',
      time,
      platformChannelSpecifics);
}