import 'package:advisor/src/service/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../helpers/app_config.dart' as config;
import '../repository/user_repository.dart' as userRepo;

class AboutWidget extends StatefulWidget {
  @override
  _AboutWidgetState createState() => _AboutWidgetState();
}

class _AboutWidgetState extends StateMVC<AboutWidget> {
  @override
  void initState() {
    super.initState();
    // _con.getUserDetail(userRepo.currentUser.value.userId);
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
          children: [
            FutureBuilder(
                future:
                    userRepo.getUserDetail(userRepo.currentUser.value.userId),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Reviewed Callers",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: config.App(context).appHeight(1),
                                ),
                                Text(
                                  "Today/ Total",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  ),
                                )
                              ],
                            ),
                            Text(
                              "${snapshot.data['today_review']} / ${snapshot.data['total_review']}",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: config.App(context).appHeight(5),
                          child: Divider(
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Blocked Callers",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: config.App(context).appHeight(1),
                                ),
                                Text(
                                  "Total",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  ),
                                )
                              ],
                            ),
                            Text(
                              "0",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),
            SizedBox(
              height: config.App(context).appHeight(5),
              child: Divider(
                color: Colors.white,
              ),
            ),
            FlatButton(
              padding: EdgeInsets.symmetric(
                vertical: config.App(context).appWidth(4),
              ),
              child: Container(
                alignment: Alignment.center,
                width: config.App(context).appWidth(90),
                child: Text(
                  "MY PROFILE",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context).pushNamed('/Profile');
              },
            ),
            SizedBox(
              height: config.App(context).appHeight(3),
            ),
            FlatButton(
              padding: EdgeInsets.symmetric(
                vertical: config.App(context).appWidth(4),
              ),
              child: Container(
                alignment: Alignment.center,
                width: config.App(context).appWidth(90),
                child: Text(
                  "CHAT",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context).pushNamed('/ChatList');
              },
            ),
            SizedBox(
              height: config.App(context).appHeight(3),
            ),
            FlatButton(
              padding: EdgeInsets.symmetric(
                vertical: config.App(context).appWidth(4),
              ),
              child: Container(
                alignment: Alignment.center,
                width: config.App(context).appWidth(90),
                child: Text(
                  "THE RULES",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context).pushNamed('/TheRules');
              },
            ),
            SizedBox(
              height: config.App(context).appHeight(3),
            ),
            FlatButton(
              padding: EdgeInsets.symmetric(
                vertical: config.App(context).appWidth(4),
              ),
              child: Container(
                alignment: Alignment.center,
                width: config.App(context).appWidth(90),
                child: Text(
                  "HOW TO USE APP",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context).pushNamed('/HowToUse');
              },
            ),
            SizedBox(
              height: config.App(context).appHeight(3),
            ),
            FlatButton(
              padding: EdgeInsets.symmetric(
                vertical: config.App(context).appWidth(4),
              ),
              child: Container(
                alignment: Alignment.center,
                width: config.App(context).appWidth(90),
                child: Text(
                  "REPORT ISSUE",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context).pushNamed('/ReportIssue');
              },
            ),
            SizedBox(
              height: config.App(context).appHeight(3),
            ),
            FlatButton(
              padding: EdgeInsets.symmetric(
                vertical: config.App(context).appWidth(4),
              ),
              child: Container(
                alignment: Alignment.center,
                width: config.App(context).appWidth(90),
                child: Text(
                  "PRIVACY POLICY",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context).pushNamed('/PrivacyPolicy');
              },
            ),
            SizedBox(
              height: config.App(context).appHeight(3),
            ),
            FlatButton(
              padding: EdgeInsets.symmetric(
                vertical: config.App(context).appWidth(4),
              ),
              child: Container(
                alignment: Alignment.center,
                width: config.App(context).appWidth(90),
                child: Text(
                  "LOGOUT",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: () {
                NotificationService.cancelNotification();
                userRepo.logout();
                Navigator.of(context).pushReplacementNamed('/Login');
              },
            ),
          ],
        ),
      ),
    );
  }
}
