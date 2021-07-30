import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../helpers/app_config.dart' as config;
import '../controllers/user_controller.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends StateMVC<ForgotPasswordScreen> {
  UserController _con;
  TextEditingController emailController = new TextEditingController();

  _ForgotPasswordScreenState() : super(UserController()) {
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
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Theme.of(context).hintColor,
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Forgot Password",
          style: TextStyle(
            color: Theme.of(context).hintColor,
            fontSize: 17,
            fontWeight: FontWeight.normal,
          ),
        ),
        centerTitle: false,
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
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Email  ",
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
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value.isEmpty) {
                    return ' * Required!!';
                  } else if (!value.contains('@')) {
                    return 'Should be a valid email';
                  }
                  return null;
                },
                controller: emailController,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: "Enter your email-id",
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
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
                height: config.App(context).appHeight(8),
              ),
              Center(
                child: FlatButton(
                  padding: EdgeInsets.symmetric(
                    vertical: config.App(context).appWidth(5),
                    horizontal: config.App(context).appWidth(13),
                  ),
                  child: Text(
                    "Send",
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
                    _con.sentForgotPassword(emailController.text);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
