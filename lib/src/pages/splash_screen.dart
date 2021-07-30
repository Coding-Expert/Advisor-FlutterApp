import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/app_config.dart' as config;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String checkPref;
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      checkPref = prefs.getString('current_user');

      if (checkPref == null) {
        Timer(Duration(seconds: 3), () {
          Navigator.of(context).pushReplacementNamed('/Welcome');
        });
      } else {
        Timer(Duration(seconds: 3), () {
          Navigator.of(context).pushReplacementNamed('/Home');
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              "assets/img/butterfly-shape-from-side-view-facing-to-right.svg",
              width: config.App(context).appWidth(35),
            ),
            SizedBox(
              height: config.App(context).appHeight(5),
            ),
            Text(
              "The Advisor",
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
