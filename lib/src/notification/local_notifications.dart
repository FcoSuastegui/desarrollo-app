/* import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotifications {
    static final LocalNotifications localNotifications = new LocalNotifications._internal();

    factory LocalNotifications() {
      return localNotifications;
    }
    
    LocalNotifications._internal();

    final _day = DateTime.now().day;
    final _dia = 27;

    var initializationSettingsAndroid;
    var initializationSettingsIOS;
    var initializationSettings;
    
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();

    void setupNotifications() async {
      
      initializationSettingsAndroid = new AndroidInitializationSettings('icon_notification');
      initializationSettingsIOS = new IOSInitializationSettings(
          onDidReceiveLocalNotification: onDidReceiveLocalNotification
        );
      initializationSettings = new InitializationSettings(
          initializationSettingsAndroid, initializationSettingsIOS
        );

    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification
        );
    }

    Future<void> demoNotification() async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'channel_ID', 'channel name', 'channel description',
        importance: Importance.Max,
        priority: Priority.High,
        ticker: 'test ticker');

    var iOSChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSChannelSpecifics);

    if ( _day == _dia ) {
      await flutterLocalNotificationsPlugin.show(0, 'Hello, buddy',
          'A message from flutter buddy', platformChannelSpecifics,
          payload: 'test oayload');
    }
  }

    Future onSelectNotification(String payload) async {
        if (payload != null) {
          debugPrint('notification payload: ' + payload);
        }
        
        print(payload);
    }


  Future onDidReceiveLocalNotification( int id, String title, String body, String payload) async {
  
  }

}

 */