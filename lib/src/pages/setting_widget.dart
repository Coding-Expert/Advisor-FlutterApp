import 'package:flutter/material.dart';
import '../helpers/app_config.dart' as config;
import 'package:flutter/services.dart';
import 'package:system_alert_window/system_alert_window.dart';

class SettingWidget extends StatefulWidget {
  @override
  _SettingWidgetState createState() => _SettingWidgetState();
}

class _SettingWidgetState extends State<SettingWidget> {
  String _platformVersion = 'Unknown';
  bool _drawOverOtherApp = false;
  bool _showAfterCallInfo = false;
  bool _notifyBlockedCalls = true;
  bool _reviewContacts = true;
  bool _startAuto = false;
  bool _showNotificationCall = false;
  bool _showNotificationSMS = false;
  bool chatNotification = true;

  @override
  void initState() {
    super.initState();
    _initPlatformState();
    _checkPermissions();
  }

  Future<void> _checkPermissions() async {
    await SystemAlertWindow.checkPermissions.then((value) {
      setState(() {
        _drawOverOtherApp = value;
      });
    });
  }

  Future<void> _initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await SystemAlertWindow.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });

    print("Platform Version: $_platformVersion");
  }

  Future<void> _requestPermissions() async {
    await SystemAlertWindow.requestPermissions;
    _checkPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: config.App(context).appWidth(4),
        vertical: config.App(context).appHeight(3),
      ),
      child: Container(
        color: Color(0xFF2C2C2C),
        padding: EdgeInsets.symmetric(
          horizontal: config.App(context).appWidth(3),
          vertical: config.App(context).appHeight(3),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Notification Settings",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 15,
                // fontWeight: FontWeight.w400,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Draw Over Other Apps",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      // fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Switch(
                  value: _drawOverOtherApp,
                  onChanged: (value) {
                    _requestPermissions();
                    setState(() {
                      // _drawOverOtherApp = (_drawOverOtherApp != value)
                      //     ? value
                      //     : _drawOverOtherApp;
                    });
                    // setState(() {
                    //   _drawOverOtherApp = value;               
                    // });
                    
                  },
                  inactiveTrackColor: Color(0xff646464),
                  activeColor: Color(0xff79c7c0),
                  
                ),
              ],
            ),
            // SizedBox(
            //   height: 1.0,//config.App(context).appHeight(3),
            //   child: Divider(
            //     color: Colors.white,
            //   ),
            // ),
            Divider(
                color: Colors.white,
                height: 1.0,
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Text(
              "We use this method for displaying alerts for incomining/outgoing calls. Small alert window displayed front of classic system dialing window. ",
              style: TextStyle(
                color: Theme.of(context).hintColor,
                fontSize: 14,
              ),
            ),
            SizedBox(
              height:  config.App(context).appHeight(3),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Show after call information",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      // fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Switch(
                  value: _showAfterCallInfo,
                  onChanged: (value) {
                    setState(() {
                      // _showAfterCallInfo = (_showAfterCallInfo != value)
                      //     ? value
                      //     : _showAfterCallInfo;
                    });
                  },
                  inactiveTrackColor: Color(0xff646464),
                  activeColor: Color(0xff79c7c0),
                ),
              ],
            ),
            // SizedBox(
            //   height: config.App(context).appHeight(3),
            //   child: Divider(
            //     color: Colors.white,
            //   ),
            // ),
            Divider(
              color: Colors.white,
              height: 1.0,
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Text(
              "Display phone number information after the call is finished.",
              style: TextStyle(
                color: Theme.of(context).hintColor,
                fontSize: 14,
              ),
            ),
            SizedBox(
              height:  config.App(context).appHeight(3),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Notify blocked calls",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      // fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Switch(
                  value: _notifyBlockedCalls,
                  onChanged: (value) {
                    setState(() {
                      _notifyBlockedCalls = (_notifyBlockedCalls != value)
                          ? value
                          : _notifyBlockedCalls;
                    });
                  },
                  inactiveTrackColor: Color(0xff646464),
                  activeColor: Color(0xff79c7c0),
                ),
              ],
            ),
            // SizedBox(
            //   height: config.App(context).appHeight(3),
            //   child: Divider(
            //     color: Colors.white,
            //   ),
            // ),
            Divider(
              color: Colors.white,
              height: 1.0,
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Text(
              "Recive a notification when a call is blocked. ",
              style: TextStyle(
                color: Theme.of(context).hintColor,
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: config.App(context).appHeight(3),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "New Reviews and Contacts",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      // fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Switch(
                  value: _reviewContacts,
                  onChanged: (value) {
                    setState(() {
                      _reviewContacts =
                          (_reviewContacts != value) ? value : _reviewContacts;
                    });
                  },
                  inactiveTrackColor: Color(0xff646464),
                  activeColor: Color(0xff79c7c0),
                ),
              ],
            ),
            // SizedBox(
            //   height: config.App(context).appHeight(3),
            //   child: Divider(
            //     color: Colors.white,
            //   ),
            // ),
            Divider(
              color: Colors.white,
              height: 1.0,
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Text(
              "Receive notifications when someone has rated the same caller you have previously.",
              style: TextStyle(
                color: Theme.of(context).hintColor,
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: config.App(context).appHeight(3),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Start automatically",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      // fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Switch(
                  value: _startAuto,
                  onChanged: (value) {
                    setState(() {
                      // _startAuto = (_startAuto != value) ? value : _startAuto;
                    });
                  },
                  inactiveTrackColor: Color(0xff646464),
                  activeColor: Color(0xff79c7c0),
                ),
              ],
            ),
            SizedBox(
              height: 0.0, //config.App(context).appHeight(3),
              child: Divider(
                color: Colors.white,

              ),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Text(
              "The Advisor application can run automatically when you turn on your phone. ",
              style: TextStyle(
                color: Theme.of(context).hintColor,
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: config.App(context).appHeight(3),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Show Notification(CALL)",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      // fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Switch(
                  value: _showNotificationCall,
                  onChanged: (value) {
                    setState(() {
                      // _showNotificationCall = (_showNotificationCall != value)
                      //     ? value
                      //     : _showNotificationCall;
                    });
                  },
                  inactiveTrackColor: Color(0xff646464),
                  activeColor: Color(0xff79c7c0),
                ),
              ],
            ),
            // SizedBox(
            //   height: config.App(context).appHeight(3),
            //   child: Divider(
            //     color: Colors.white,
            //   ),
            // ),
            Divider(
              color: Colors.white,
              height: 1.0,
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Text(
              "Show notifications for incoming/outgoing calls you can customies which notifications are shown by the app ",
              style: TextStyle(
                color: Theme.of(context).hintColor,
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: config.App(context).appHeight(3),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Show Notifications(SMS)",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      // fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Switch(
                  value: _showNotificationSMS,
                  onChanged: (value) {
                    setState(() {
                      // _showNotificationSMS = (_showNotificationSMS != value)
                      //     ? value
                      //     : _showNotificationSMS;
                    });
                  },
                  inactiveTrackColor: Color(0xff646464),
                  activeColor: Color(0xff79c7c0),
                ),
              ],
            ),
            // SizedBox(
            //   height: config.App(context).appHeight(3),
            //   child: Divider(
            //     color: Colors.white,
            //   ),
            // ),
            Divider(
              color: Colors.white,
              height: 1.0,
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Text(
              "Show notifications for SMS you can customise which notifications are shown by the app",
              style: TextStyle(
                color: Theme.of(context).hintColor,
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: config.App(context).appHeight(3),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Show Notification(Chat)",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      // fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Switch(
                  value: chatNotification,
                  onChanged: (value) {
                    setState(() {
                      chatNotification = value;
                    });
                  },
                  inactiveTrackColor: Color(0xff646464),
                  activeColor: Color(0xff79c7c0),
                ),
                
              ],
            ),
            Divider(
              color: Colors.white,
              height: 1.0,
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Text(
              "Show notifications for Chat you can customise which notifications are shown by the app",
              style: TextStyle(
                color: Theme.of(context).hintColor,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
