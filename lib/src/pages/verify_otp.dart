import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import 'package:pinput/pin_put/pin_put.dart';

import '../controllers/user_controller.dart';
import '../helpers/app_config.dart' as config;

class VerifyOtpScreen extends StatefulWidget {
  final String userName,
      email,
      website,
      profileImage,
      mobile,
      password,
      otp,
      countryCode,
      tag,
      userId;

  final File imageFile;

  VerifyOtpScreen({
    Key key,
    @required this.userName,
    @required this.email,
    @required this.website,
    @required this.profileImage,
    @required this.mobile,
    @required this.password,
    @required this.otp,
    @required this.countryCode,
    @required this.tag,
    @required this.userId,
    @required this.imageFile,
  }) : super(key: key);

  @override
  _VerifyOtpScreenState createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends StateMVC<VerifyOtpScreen> {
  UserController _con;
  bool _clear = false;
  _VerifyOtpScreenState() : super(UserController()) {
    _con = controller;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          "Verification Code",
          style: TextStyle(
            color: Theme.of(context).hintColor,
            fontWeight: FontWeight.normal,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding:
            EdgeInsets.symmetric(horizontal: config.App(context).appWidth(5)),
        color: Colors.white,
        child: Form(
          key: _con.loginFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Please type the verification code sent to \n${widget.countryCode} ${widget.mobile}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                ),
              ),
              SizedBox(
                height: config.App(context).appHeight(2),
              ),
              PinPut(
                actionButtonsEnabled: false,
                keyboardAction: TextInputAction.done,
                fieldsCount: 6,
                clearInput: _clear,
                onSubmit: (String pin) {
                  if (widget.otp == pin) {
                    _con.verifyOtp(
                      widget.userName,
                      widget.email,
                      widget.website,
                      widget.mobile,
                      widget.password,
                      _con.device.identifier,
                      widget.countryCode,
                      widget.profileImage,
                      widget.otp,
                      widget.tag,
                      widget.imageFile,
                    );
                  } else {
                    Fluttertoast.showToast(msg: "Invalid OTP!!!");
                  }
                },
              ),
              SizedBox(
                height: config.App(context).appHeight(2),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    _con.sendOtp("call");
                  },
                  child: Text(
                    "Didn't got the otp? Call",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: config.App(context).appHeight(4),
              ),
              // Center(
              //   child: FlatButton(
              //     padding: EdgeInsets.symmetric(
              //       vertical: config.App(context).appWidth(5),
              //       horizontal: config.App(context).appWidth(13),
              //     ),
              //     child: Text(
              //       "VERIFY",
              //       style: TextStyle(
              //         fontSize: 18,
              //       ),
              //     ),
              //     shape: RoundedRectangleBorder(
              //       side: BorderSide.none,
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     color: Theme.of(context).primaryColor,
              //     textColor: Colors.white,
              //     onPressed: () {},
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
