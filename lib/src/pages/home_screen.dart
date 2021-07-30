import 'dart:async';
import 'dart:developer';

import 'package:advisor/src/module/checkmessage_module.dart';
import 'package:advisor/src/pages/about_widget.dart';
import 'package:advisor/src/pages/rating_widget.dart';
import 'package:advisor/src/pages/setting_widget.dart';
import 'package:advisor/src/service/notification_service.dart';
import 'package:background_fetch/background_fetch.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'history_widget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../helpers/helper.dart';

import '../repository/user_repository.dart' as userRepo;
import 'sms_widget.dart';

class HomeScreenWidget extends StatefulWidget {
  @override
  _HomeScreenWidgetState createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {

  Timer timer;
  int i = 0;
  int message_count = 0;
 
  String _message = '';
  String device_token = "";

  @override
  void initState() {
    super.initState();
    userRepo.getCurrentUser();
    getMessage();
    // _register();
    // timer = Timer.periodic(Duration(seconds: 10), (Timer t) => checkMessage());
    // checkMessage();
    
  }
  static Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message){
    print("-----onBackgroundMessage:${message}");
    String title = message["notification"]["title"];
    String body = message["notification"]["body"];
    NotificationService.showNotification(title, body, 0);
    return Future<void>.value();
  }
  void getMessage(){
    NotificationService.firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('on message $message');
        String title = message["notification"]["title"];
        String body = message["notification"]["body"];
        NotificationService.showNotification(title, body, 0);
      },
      
      onBackgroundMessage: myBackgroundMessageHandler,
      onResume: (Map<String, dynamic> message) async {
        print('on resume $message');
        String title = message["notification"]["title"];
        String body = message["notification"]["body"];
        NotificationService.showNotification(title, body, 0);
      }, 
      onLaunch: (Map<String, dynamic> message) async {
        print('on launch $message');
        String title = message["notification"]["title"];
        String body = message["notification"]["body"];
        NotificationService.showNotification(title, body, 0);
      }
    );
    // firebaseMessaging.requestNotificationPermissions(const IosNotificationSettings(sound: true, badge: true, alert: true));
    // firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings settings) {
    //   print("Settings registered: $settings");
    // });
  }

  checkMessage() {
    i = i + 1;
    CheckMessageModule.checkAllMessageStatus().then((value){
      if(value > 0 && message_count != value){
        message_count = value;
        print("----value:${value}");
        NotificationService.showNotification('new message', 'sdsdfsdf', i);
      }
    });
    // sendNotificationData();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: Helper.of(context).onWillPop,
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF232121),
            automaticallyImplyLeading: false,
            flexibleSpace: SafeArea(
              child: TabBar(
                labelPadding: EdgeInsets.symmetric(horizontal: 0),
                labelStyle: TextStyle(
                  fontSize: 12,
                ),
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.history_outlined,
                      size: 18,
                    ),
                    text: "Call Log",
                  ),
                  Tab(
                    icon: Icon(
                      Icons.star_rate_outlined,
                      size: 18,
                    ),
                    text: "Ratings",
                  ),
                  Tab(
                    icon: Icon(
                      Icons.sms,
                      size: 18,
                    ),
                    text: "SMS",
                  ),
                  Tab(
                    icon: Icon(
                      Icons.person_outline_rounded,
                      size: 18,
                    ),
                    text: "About",
                  ),
                  Tab(
                    icon: Icon(
                      Icons.settings_outlined,
                      size: 18,
                    ),
                    text: "Settings",
                  ),
                ],
              ),
            ),
            
          ),
          body: TabBarView(
            children: [
              HistoryWidget(),
              RatingWidget(),
              SMSWidget(),
              AboutWidget(),
              SettingWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
