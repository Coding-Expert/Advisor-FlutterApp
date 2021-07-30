import 'package:advisor/src/service/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../controllers/user_controller.dart';
import '../helpers/app_config.dart' as config;

class LoginScreenWidget extends StatefulWidget {
  @override
  _LoginScreenWidgetState createState() => _LoginScreenWidgetState();
}

class _LoginScreenWidgetState extends StateMVC<LoginScreenWidget> {
  UserController _con;
  String device_token = "";

  _LoginScreenWidgetState() : super(UserController()) {
    _con = controller;
  }

  @override
  void initState() {
    super.initState();
    getDeviceToken();
  }

  getDeviceToken() {
    NotificationService.firebaseMessaging.getToken().then((token) {
      device_token = token;
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: config.App(context).appHeight(15),
              child: Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: config.App(context).appWidth(5),
              ),
              color: Colors.white,
              height: config.App(context).appHeight(85),
              width: config.App(context).appWidth(100),
              child: Form(
                key: _con.loginFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: config.App(context).appHeight(15),
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.black,
                          // fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "Username  ",
                          ),
                          TextSpan(
                            text: "*",
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: config.App(context).appHeight(2),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      onSaved: (input) => _con.user.username = input,
                      validator: (input) =>
                          input.isEmpty == true ? "* Required!" : null,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: "Enter your email",
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 1,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: config.App(context).appHeight(5),
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.black,
                          // fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "Password  ",
                          ),
                          TextSpan(
                            text: "*",
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: config.App(context).appHeight(2),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      onSaved: (input) => _con.user.password = input,
                      validator: (input) =>
                          input.isEmpty == true ? "* Required!" : null,
                      obscureText: _con.hidePassword,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: "Enter your password",
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 1,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: config.App(context).appHeight(3),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/ForgotPassword');
                          },
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: config.App(context).appHeight(5),
                    ),
                    Center(
                      child: FlatButton(
                        padding: EdgeInsets.symmetric(
                          vertical: config.App(context).appWidth(5),
                          horizontal: config.App(context).appWidth(13),
                        ),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        onPressed: () {
                          print("------token:${device_token}");
                          setState(() {
                            _con.user.deviceId = _con.device.identifier;
                            _con.user.deviceToken = device_token;
                            _con.login();
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: config.App(context).appHeight(3),
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('/SignUp');
                        },
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                              // fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: "Don't have an account? ",
                              ),
                              TextSpan(
                                text: " SignUp",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
