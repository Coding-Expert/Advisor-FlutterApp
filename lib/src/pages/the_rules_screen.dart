import 'package:flutter/material.dart';
import '../helpers/app_config.dart' as config;

class TheRulesScreen extends StatelessWidget {
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
          "The Rules",
          style: TextStyle(
            color: Theme.of(context).hintColor,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding:
            EdgeInsets.symmetric(horizontal: config.App(context).appWidth(5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: config.App(context).appHeight(5),
            ),
            Text(
              "     The Advisor application is a member only dating safety and verification app. All ratings are intended to be seen by its members only! It is only effective if the bad guys are unaware that it exists. Therefore, it and all the information within it should be treated with the strictest confidence by all members. ",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Muli"),
            ),
            SizedBox(
              height: config.App(context).appHeight(5),
            ),
            Text(
              "     You will probably never see us on any social media platform as we would like to remain somewhat anonymous. Therefore, we would only like to be shared amongst the community of liked minded women looking to verify a potential date or those wanting to warn others about potential dangers.',",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Muli"),
            ),
            SizedBox(
              height: config.App(context).appHeight(5),
            ),
            Text(
              "     Members are responsible for their ratings and are based solely on their opinion. Only leave true, accurate ratings and always use your own judgement before any date. Whether you choose to proceed with the date, is entirely up to you. The Adviser app and website simply offer the opportunity to share ratings and communicate with others who have had a date or might be considering a date with the same person.",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Muli"),
            ),
            SizedBox(
              height: config.App(context).appHeight(5),
            ),
            Text(
              "     The more ratings each caller has, the better. As a rule of thumb, if three or more members have given the same date the same rating, chances are the community opinion rating might be correct. On the other hand, if a potential date only has one review perhaps the next few reviewers would disagree. That is why The Advisor application is only as good as its members! ",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Muli"),
            ),
            SizedBox(
              height: config.App(context).appHeight(5),
            ),
          ],
        ),
      ),
    );
  }
}
