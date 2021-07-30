import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../controllers/user_controller.dart';
import '../helpers/app_config.dart' as config;

class ReportIssueScreen extends StatefulWidget {
  @override
  _ReportIssueScreenState createState() => _ReportIssueScreenState();
}

class _ReportIssueScreenState extends StateMVC<ReportIssueScreen> {
  UserController _con;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  _ReportIssueScreenState() : super(UserController()) {
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
        backgroundColor: Color(0xFF232121),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).hintColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Report Issue",
          style: TextStyle(
            color: Theme.of(context).hintColor,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: config.App(context).appHeight(2),
          horizontal: config.App(context).appWidth(3),
        ),
        child: Column(
          children: [
            Container(
              color: Color(0xFF232121),
              width: config.App(context).appWidth(94),
              padding: EdgeInsets.symmetric(
                horizontal: config.App(context).appWidth(5),
                vertical: config.App(context).appHeight(5),
              ),
              child: Form(
                key: _con.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _usernameController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return ' * Required!!';
                        }
                        return null;
                      },
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        hintText: "Enter your name",
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
                      height: config.App(context).appHeight(2),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return ' * Required!!';
                        } else if (!value.contains('@')) {
                          return 'Should be a valid email';
                        }
                        return null;
                      },
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        hintText: "Enter your email",
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
                      height: config.App(context).appHeight(2),
                    ),
                    TextFormField(
                      controller: _descriptionController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return ' * Required!!';
                        }
                        return null;
                      },
                      maxLines: 5,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        hintText: "Enter your issue description",
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
                  ],
                ),
              ),
            ),
            SizedBox(
              height: config.App(context).appHeight(5),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton(
                  padding: EdgeInsets.symmetric(
                    vertical: config.App(context).appWidth(4),
                    horizontal: config.App(context).appWidth(5),
                  ),
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Color(0xFF232121),
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                FlatButton(
                  padding: EdgeInsets.symmetric(
                    vertical: config.App(context).appWidth(4),
                    horizontal: config.App(context).appWidth(8),
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
                    _con.sendRepot(_usernameController.text,
                        _emailController.text, _descriptionController.text);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
