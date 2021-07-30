import 'package:advisor/src/service/notification_service.dart';
import 'package:background_fetch/background_fetch.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'route_generator.dart';
import 'src/helpers/app_config.dart' as config;

//this is the name given to the background fetch
const theAdvisorNotification = "The Advisor";
int id = 0;
// flutter local notification setup

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // FlutterLocalNotificationsPlugin flp = FlutterLocalNotificationsPlugin();

  
  await GlobalConfiguration().loadFromAsset("configurations");
  
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool notification_setting = false;
  BuildContext m_context;

  @override
  void initState() {
    super.initState();
    var android = AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOS = IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: (
        int id,
        String title, String body, String payload
      ) async {}
    );
    var initSetttings = InitializationSettings(android: android, iOS: iOS);
    NotificationService.flutterLocalNotificationsPlugin.initialize(initSetttings, onSelectNotification: onSelectNotification);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "The Advisor",
      initialRoute: '/Splash',
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: config.Colors().mainColor(1),
        accentColor: config.Colors().secondColor(1),
        hintColor: config.Colors().hintColor(1),
        // primaryColorDark: config.Colors().mainDarkColor(1),
        scaffoldBackgroundColor: config.Colors().mainDarkColor(1),
        textTheme: TextTheme(),
      ),
    );
  }

  Future onSelectNotification(String payload) {
    print("-----payload:${payload}");
    Navigator.of(m_context).push(MaterialPageRoute(builder: (_){
      return NewScreen(
        payload: payload
      );
    }));
  }

}

class NewScreen extends StatelessWidget {
  String payload;

  NewScreen({
    @required this.payload,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(payload),
      ),
    );
  }
}
