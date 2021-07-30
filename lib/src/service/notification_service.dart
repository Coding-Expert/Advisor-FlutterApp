import 'package:advisor/src/module/checkmessage_module.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {

  
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  static FirebaseMessaging firebaseMessaging = FirebaseMessaging();

  static void showNotification(String title, String body, int id) async {
    var android = AndroidNotificationDetails(
          id.toString(), id.toString(), id.toString(),
          priority: Priority.high,
          importance: Importance.max,
          ticker: 'ticker',
          visibility: NotificationVisibility.public,
        );
    var iOS = IOSNotificationDetails();
    var platform = NotificationDetails(android: android, iOS: iOS);
    await flutterLocalNotificationsPlugin.show(id, '$title', '$body', platform, payload: 'SDFSDFSDDF');
  }

  static Future<void> cancelNotification() async {
    await flutterLocalNotificationsPlugin.cancel(0);
  }

}