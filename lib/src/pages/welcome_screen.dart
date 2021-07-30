import 'package:flutter/material.dart';
import '../helpers/app_config.dart' as config;

class WelcomeScreenWidget extends StatefulWidget {
  @override
  _WelcomeScreenWidgetState createState() => _WelcomeScreenWidgetState();
}

class _WelcomeScreenWidgetState extends State<WelcomeScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                  Theme.of(context).accentColor.withOpacity(1),
                  BlendMode.dstATop,
                ),
                image: AssetImage(
                  "assets/img/adult-blur-close-up-977840.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: config.App(context).appHeight(15),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "The Advisor".toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: config.App(context).appHeight(85),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: config.App(context).appWidth(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: config.App(context).appHeight(20),
                      ),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                          children: <TextSpan>[
                            TextSpan(text: "Stay "),
                            TextSpan(
                              text: "Safe,",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: config.App(context).appHeight(2),
                      ),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: "Avoid",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            TextSpan(
                              text: " time wasters,",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: config.App(context).appHeight(2),
                      ),
                      Text(
                        "Rate Caller &",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: config.App(context).appHeight(2),
                      ),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: "Share reviews",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: config.App(context).appHeight(2),
                      ),
                      Text(
                        "Click on get started to use \nour app",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: config.App(context).appHeight(10),
                      ),
                      FlatButton(
                        minWidth: config.App(context).appWidth(80),
                        padding: EdgeInsets.symmetric(
                          vertical: config.App(context).appWidth(5),
                        ),
                        child: Text(
                          "GET STARTED",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.white,
                            width: 2,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: Colors.transparent,
                        textColor: Colors.white,
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed('/Introduce');
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
