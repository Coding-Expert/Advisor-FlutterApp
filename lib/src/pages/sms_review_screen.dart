import 'package:advisor/src/controllers/ratting_controller.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../helpers/app_config.dart' as config;
import '../pages/caller_rating_screen.dart';
import 'public_comments_screen.dart';
import 'sms_rating_screen.dart';

class SMSReviewScreen extends StatefulWidget {
  final String mobileNumber;
  final String ratingCategory;

  const SMSReviewScreen({Key key, this.mobileNumber, this.ratingCategory})
      : super(key: key);
  @override
  _SMSReviewScreenState createState() => _SMSReviewScreenState();
}

class _SMSReviewScreenState extends StateMVC<SMSReviewScreen> {
  RattingController _con;

  TextEditingController _commentController = TextEditingController();

  _SMSReviewScreenState() : super(RattingController()) {
    _con = controller;
  }

  @override
  void initState() {
    super.initState();
  }

  _makePhoneCall(BuildContext context, String number) async {
    String url = 'tel:$number';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(
          "Wrong Number",
          textDirection: TextDirection.rtl,
        ),
      ));
      // throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "SMS Review",
          style: TextStyle(
            color: Theme.of(context).hintColor,
            fontSize: 18,
          ),
        ),
        actions: [
          InkWell(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 1.0,
                ),
              ), //       <--- BoxDecoration here
              child: Text(
                "+ Add Private Note",
                style: TextStyle(
                  fontSize: 12.0,
                  fontFamily: "Muli",
                ),
              ),
            ),
            onTap: () {
              showDialog(
                  builder: (BuildContext context){
                    return new Dialog(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: 300.0),
                        child: new Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30.0, vertical: 20.0),
                              child: Text(
                                'Private Note',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontFamily: "Muli",
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 20,
                              ),
                              child: Divider(
                                height: 10,
                                indent: 5,
                                endIndent: 5,
                                color: Colors.grey,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: "Note ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
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
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, bottom: 10, right: 20),
                              child: new TextField(
                                controller: _commentController,
                                autofocus: true,
                                decoration: new InputDecoration(
                                    hintText: "Enter your private note"),
                                // controller: pnorecc,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: ButtonTheme(
                                minWidth: config.App(context).appWidth(50),
                                height: 50.0,
                                child: RaisedButton(
                                  textColor: Colors.white,
                                  color: Colors.green,
                                  onPressed: () {
                                    _con.addPrivateNote(widget.mobileNumber,
                                        _commentController.text);
                                  },
                                  child: new Text(
                                    "SUBMIT",
                                    style: TextStyle(
                                      fontFamily: "Muli",
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  
                  context: context);
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: config.App(context).appWidth(5),
              vertical: config.App(context).appHeight(3),
            ),
            child: Container(
              height: config.App(context).appHeight(80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        color: Theme.of(context).hintColor,
                        size: 60,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Text(
                    "Number:",
                    style: TextStyle(
                      color: Theme.of(context).hintColor,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(1),
                  ),
                  Text(
                    widget.mobileNumber,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    child: Divider(
                      color: Colors.white,
                    ),
                    height: config.App(context).appHeight(5),
                  ),
                  Text(
                    "Rating Category:",
                    style: TextStyle(
                      color: Theme.of(context).hintColor,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(1),
                  ),
                  Text(
                    widget.ratingCategory,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    child: Divider(
                      color: Colors.white,
                    ),
                    height: config.App(context).appHeight(5),
                  ),
                  Text(
                    "Your Rating:",
                    style: TextStyle(
                      color: Theme.of(context).hintColor,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(1),
                  ),
                  Text(
                    "Click on rate to post your review",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(4),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FlatButton(
                        minWidth: config.App(context).appWidth(40),
                        padding: EdgeInsets.symmetric(
                          vertical: config.App(context).appWidth(4),
                          horizontal: config.App(context).appWidth(5),
                        ),
                        child: Text(
                          "RATE",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        onPressed: () {
                          Navigator.of(context).push(
                            new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  SMSRattingScreen(
                                mobileNumber: widget.mobileNumber,
                              ),
                            ),
                          );
                        },
                      ),
                      FlatButton(
                        minWidth: config.App(context).appWidth(40),
                        padding: EdgeInsets.symmetric(
                          vertical: config.App(context).appWidth(4),
                          horizontal: config.App(context).appWidth(5),
                        ),
                        child: Text(
                          "REVIEWS",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        onPressed: () {
                          Navigator.of(context).push(
                            new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  PubCommentScreen(
                                mobileNumber: widget.mobileNumber,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
