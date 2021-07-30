import 'package:flutter/material.dart';
import '../helpers/app_config.dart' as config;

class HowToUseScreen extends StatelessWidget {
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
          "How to use App",
          style: TextStyle(
            color: Theme.of(context).hintColor,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: config.App(context).appHeight(20),
              width: config.App(context).appWidth(100),
              decoration: BoxDecoration(
                color: Color(0xFF232121),
              ),
              child: Center(
                child: Text(
                  "how it works".toUpperCase(),
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: config.App(context).appHeight(6),
            ),
            Container(
              color: Color(0xFF232121),
              width: config.App(context).appWidth(92),
              padding: EdgeInsets.symmetric(
                horizontal: config.App(context).appWidth(5),
                vertical: config.App(context).appHeight(3),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Introduction",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "The Advisor is a community-based application for mobile phones with Android operating system designed to protect you against all kinds of unwanted calls.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(2),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "It is developed by 3rdpage LLC. If you have any questions about our product, terms or privacy policy, please write to us by email to info@TheAdvisor.app",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Text(
                    "Installation",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "• Preferred installation method is via Google Play Store which you can find directly in your mobile device or via Google Play web page. There is no other official distribution channel of installer APK.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(2),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "• After installation, you must grant some permissions and change some system configurations to ensure proper functionality. Our 'Permissions Configuration' dialog will help you with it. Please pay attention to it.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Text(
                    "Requirements & Recommendations",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "This application requires Android 4.1 or higher!",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Text(
                    "Requirements for devices with Android 6 or higher",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "• You must allow access to Phone Contacts",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "• You must allow access to Call Information",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "• You must allow Draw over other Apps permission",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Text(
                    "Recommendations for devices with Android 7 or higher",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "• Set our application as default \"Phone app\" to activate native call filtering! Why? Android 7 provides new call filtering API which can be used only by default \"Phone App\"!",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Text(
                    "Recommendations for devices with Android 4, 5 or 6",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Our app must be running to properly filter incoming calls. We recommend to:",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "• Enable our Accessibility Service",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "• Disable Battery Optimizations",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "• Exclude from Lock Screen Optimization",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "You can find detailed description of requirements in the Permissions Configuration.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Text(
                    "Features",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "• Community based protection against unwanted phone calls by special alerts",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "• It works well even in places without an Internet connection",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "• Daily updated Community Database.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "• Easy check of phone numbers ratings in your Phone Call History.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "• Easy access to read phone number users ratings or leave your own rating.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "• Optional automatic call blocking. (This function should not be compatible with all phone models due manufacturers modifications of the system)",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Text(
                    "How it works",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "• When a number calls, application shows phone number rating via security rating notifications (Alerts).",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "• Each rating is based on reviews in Community Database, your Phone Contacts - if not otherwise specified, taken always as POSITIVE.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "• All above is combined into single POSITIVE, NEUTRAL, NEGATIVE or UNKNOWN final rating.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "• The YOUR RATINGS tab serves for composing of your own rating for any number - can be public or private, these are always prior to community rating.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Based on the Settings, the application can only display information about incoming/outgoing calls or block them.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "For those functions, application combines the information you have provided on the \"YOUR RATINGS\" tab (this info is a top-priority, so you can e.g. mark also a number stored within your Contacts as negative), with your mobile Contacts (by default marked as POSITIVE, second priority) and with the information from the Community database (stored off-line in your mobile) taken as third priority.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "To provide those functions, the application must be still running in your device memory - user must check and assure this for some manufacturers.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Text(
                    "User Interface Log",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "This is the core app part where user can check the application functions and actions the application has taken. Log contains the Phone Call History, read from phone system log. Icon on the left side indicates the Phone Number Rating with following meaning:",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "negative rating",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "neutral rating",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "positive rating",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Available Actions:",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "• Phone Number Click : this action opens the Phone Number Details screen with detailed information and further actions: Call, Block, Rate and download reviews for the number.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "• Call Button Click : will open the system phone log, where you can manage the log of phone calls history.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Logs division:",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "PHONE : this list contains all calls as provided by your system phone log",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "BLOCKED : this list contains only the blocked calls. Call them back if needed",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "CHECKED : this list provides the list of all calls checked by our applicationUse the 'Phone Number Details' screen or the 'Your Ratings' tab to add your own rating which will be used in alerts and blocking.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Text(
                    "Your Ratings",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "This screen is the core of the rating system used lately for blocking or allowing the calls. In this section you can:",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "• create POSITIVE, NEGATIVE or NEUTRAL (each private or public) rating for any number",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "• manage your created ratings – or adjust them",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Your rating can be defined for a single number or multiple phone numbers by using a mask. Be aware when setting a rule for wide range of numbers. Always double-check the possibility of conflict with any other rule or Contacts.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Available Actions:",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "• Rating Filter : (at the top of the screen) helps to filter the rating rules by phone number. Useful if you search for some specific number rule. Just tick on the line and fill any number or a part of it. Positive rated numbers will not be displayed through search. The only time positive ratings will show up is when the caller has initiated a call or text to you first.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "• User Rating Click : by clicking on any of your rating you open a screen for edition of the respective rating. There you can set the rating attributes, save it or cancel the changes.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "• Phone Number Click : this action opens the screen for creation of new rating, see below the Phone Number Rating.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Remember, the rating can use PRIVATE NOTES - in that case it will not be visible on internet, will be stored purely in your mobile. Also, it is a best practice to create rule using the international area code, or to pick the exact number from LOGS screen and create the rating there.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Text(
                    "Private Notes",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Are just that, “private” and only you can see them in the app, on your phone. Write whatever you want about each caller in this section. Keep in mind that if you are logged into the app, anyone can have access. It is important that you safeguard your information by logging out if you are worried about another person gaining access to you phone.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Text(
                    "Private Chat",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Here you can chat with other members, privately. You can discuss, exchange information and say whatever you want here. Only you & the person you are chatting with will be able to see your conversation.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Text(
                    "Chat",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "See all the chats you are currently having with other members in the app. You can also delete any chat from this area.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Text(
                    "My Profile",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Change your email address, website, phone number, photo & password.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Text(
                    "Settings",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "This section contains main application settings.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Text(
                    "Notifications",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      "'Show Notifications'",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Here you can easily enable/disable the 'Show Notifications’ By disabling this item, you will get rid of the notification message and the notification icon that comes up when for incoming and outgoing calls.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      "Show after-call information",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Here you can enable/disable displaying of phone number details after finishing the call.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      "Notify Blocked Calls",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Blocking works automatically without user's attention. You can also select if you want to be notified when any blocking occurs.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      "Download reviews automatically",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "If the internet connection is poor, please use the Web Search function instead.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Text(
                    "About",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "No personal data are ever transferred from your mobile phone. Privacy is important to us, so we don't send stats about numbers stored in your Phone Contacts unless you have entered them into our database!",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "• How to Help Our Community opens page on how user can contribute to this project",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "• Report Issue : If app problem requires a solution from out technical support, press this button and report screen will open. Write your name, check your e-mail address provided (or write it so we can contact you back) and write at least few words describing the problem (usually to state the exact number causing a problem will help). Reports with empty description will be deleted. The application logs will be added automatically",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Text(
                    "Phone Number Details",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "This screen shows detailed information for selected phone number. Here you can find the overall number rating in the form of count of Positive/Neutral/Negative ratings and the category mostly used for this number (this information is stored off-line in the database of your mobile phone). You can also see how much positive/neutral/negative ratings the number received from community.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Available Actions:",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "• Rate shows the form for filling your new phone number rating - see below.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "• Reviews loads and shows the community reviews for this number. This function requires internet access. If your own (personal) rating is presented, it is displayed automatically (all of them are stored in your phone) and EDIT button is presented for further edit of your review.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "• Call Button Click initiates calling to the number.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Text(
                    "Phone Number Rating",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Phone number rating is the base for the alert and blocking functionality. User can enter this form either from LOGS screen by clicking on number and from the phone call detail by pressing the RATE button, or from the RATINGS screen by adding a new rating. You can create either POSITIVE, NEUTRAL or NEGATIVE rating, or adjust existing rating. Your own positive rating will override the negative community rating and your own negative rating can override positive community rating (and the basic rule that numbers in Contacts are taken as positive by default). Please always check this logic when creating new rating.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Text(
                    "Public Ratings",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "By default, the rating is submitted to our community database for benefit of other users. If you don't want to make the rating for the respective number public, then leave in your private notes section - in such case the rating will be stored in your mobile only. In such case you don't have to fill the Category and Comment, just select ‘private comments’ and press SAVE.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Text(
                    "Rating Alert",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "In the Alert displayed for the phone call you can find all required information for making the decision to accept the call or hang up.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "• Contact shows name of the contact associated with phone number (if available).",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "• Number shows phone number the alert is displayed for.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "• Rating shows one of positive, neutral, negative or unknown rating.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "• Category shows the mostly used Category for the respective phone number",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "• Community shows the total statistic counts of positive, neutral and negative ratings from the community",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Please be aware that the Alert screen will be shown in the front of the system call screen - if this is a problem and the system buttons are hidden behind it, just drag it with a finger to better position up or down - it will remember such position for all future calls.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Text(
                    "Permissions Configuration",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "There are just a few permissions which must be granted to our app to keep the application running and to keep the protection fully working. This window provides easy way how to setup all required permissions.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      "Phone Contacts Permission (Android 6+)",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Your Phone Contacts helps us to determine which calls are from 'unknown' sources. We also show phone contact names instead of phone numbers in 'Logs' tab and phone number details.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      "Call Info Permission (Android 6+)",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "We need to know what phone number is calling to you. Without this permission our app can't work.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      "Set Default Phone App (Android 7+)",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Android 7 provides new way how to filter incoming calls. It is highly recommended to set our application as default 'Phone App' to get 100% protection against unwanted calls.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      "Draw Over Other Apps (Android 6+)",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "The application displays Alerts window during ringing phase. This can be done only with the 'Draw Over Other Apps' permission granted.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      "Accessibility Service (If not set as default phone app)",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Enabling our Accessibility Service is very important to keep the protection active - most of the memory managers will keep such service running.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      "Disabling Background Optimizations",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Most memory managers will try to kill any application on background if it seems not to be used actually - this will prevent our app from staying active. Disabling background optimizations for our app helps to keep the protection active.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      "Disabling Lock Screen Optimizations (Some Devices)",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Most devices terminate unnecessary apps every time you lock the screen. If your device has this feature, please add our application to the lock screen whitelist to keep the protection active.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Text(
                    "FAQ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      "Q: How to block phone number?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "From the LOGS screen select the respective call, press BLOCK button",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      "Q: How do I chat with other members?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "You can only chat with members who have rated the same caller. Simply click the ‘reviews’ button on any number you have rated, then click the member you wish to chat with. You can keep up with your various chats or delete any conversation in the ‘chat’ section under ‘settings’.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      "Q: How to unblock phone number?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Simply press the unblock button from the Caller Review screen.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      "Q: Why I don't see any Alerts?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "This is probably due our application has been stopped by system or 3rd party app. First please try to reboot your mobile, after the restart check if our app is running and if it has got all the necessary permissions.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      "Q: Why blocking does not work for me?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "First please try to reboot your mobile, after the restart check if our app is running and if it has got all the necessary permissions. Please read the Call Blocking does not work troubleshooting. Also, make sure you are logged into the app.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      "Q: Why the phone rings before blocking?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Depending on the speed of your phone hardware, software and the application settings it can happen that even a call that should be blocked will ring firstly and then it will be blocked. Uninstalling unnecessary applications which are running on background can improve the reaction time. Sometime helps just restart the phone.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      "Q: Why they still call even when I'm blocking them?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Well, they don't know you use some blocking device. From the other side it seems the number called is just busy. Some robocalls can ignore this and will try to call again. Actually, with the present versions of Android operating system it is not possible to play them some message to let them know you are not interested, if this changes in the future we will add this functionality.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      "Q: How to update my local database?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Your local database is stored in your mobile phone along with the application, It contains just the numbers and statistics data for them, without user reviews. The database is checked (and updated if necessary) each time you connect to the internet.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      "Q: Can I protect my landline with The Advisor?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Basically yes - you can re-direct the landline calls (or probably your provider can do it) to your mobile phone, where our app will check them. Or you can switch your landline to an internet-operating device if available for your country - any Android operating device can then have the The Advisor app installed.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      "Q: How do I delete my membership on The Advisor?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Just send us an email with your user ID and email address to deletions@TheAdvisor.app and your membership will be deleted within 24 – 48 hours. Please not that if you decide to renew your membership, you will have to go through the entire reviewal process again.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      "Q: What are the criteria to be accepted as a member of The Advisor?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "The Advisor app is a private application. Membership approval is based solely on the discretion of The Advisor Group LLC. Some criteria may be confirmation of the applicant’s identity and additional information submitted. All information is thoroughly checked and verified. Additionally, any ad submitted must match the applicant and from a verified website.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Text(
                    "Troubleshooting",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "If you have device with Android 7+, then you should have set our app as default Phone App. Please check the Settings. If all is set (no advice screen is offered in the 'Permissions Configuration') then you can try to restart the phone. If the issue persists, please contact our support",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "If you have device with Android 4, 5 or 6 you must keep our application running! How to Keep Protection Active is one of the biggest challenges due insufficient support in the Android System. In most cases our application must be running to be able to react when new incoming call happens.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Unfortunately, almost all phone manufacturers implement their own battery optimizers which terminates background applications. You must manually whitelist our app to keep application running. It differs across manufacturers and often it's more complicated as it should be.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Text(
                    "Call Blocking does not work",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "If you have device with Android 7+, then you should have set our app as default Phone App. Please check the settings. If all is set (no advice screen is offered in the 'Permissions Configuration') then you can try to restart the phone. If the issue persists, please contact our support.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "If you have older device then please check the Protection is not active. If the protection is active, the problem can be in manufacturers Android modifications in your phone.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Android 4, 5 or 6 does not support call blocking. The only way how to block call is to use little hacking and call internal methods of Telephone interface. These methods are used across all call blockers available in the Play Store.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Using of internal interfaces means it's not 100% guaranteed that the function works correctly on your phone. Any phone manufacturer internal modification can break or change the functionality.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Text(
                    "Privacy Policy",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Privacy matters but it can be confusing. Please read this explanation of our approach to privacy in our application or on TheAdvisor.app website",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Text(
                    "Phone Contacts",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Our app does not send your contact information to server.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Text(
                    "Stats about Phone Calls",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "The app does not send any phone call information until you allow it. Stats about phone calls from 'numbers which are not in your Phone Contacts' are very useful for us. These stats help us detect new sources of unwanted calls. Allowing sending stats, you are helping to our community. Thank you!",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Sending respective phone number in request for getting user ratings Displaying of user ratings for the respective number needs your permission to send respective phone number to server.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Text(
                    "Submitting of own phone number review",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "If you fill and send some phone number for rating, you agree with publishing the phone number and all filled information on our website. We also store technical information about the request (time, IP and agent) for solving problems.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Text(
                    "Using our web service",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Some features like reviews download, database update, phone info search, uses our web service. Our web service collects statistics about visitors and service usage. Please read privacy policy of our web service for detailed information.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Text(
                    "Updates to this policy",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "We may update this privacy policy anytime to keep this description in sync with used technology.",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Text(
                    "Any questions?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "If you have any questions about our product, terms or privacy policy, please write to us by email to info@TheAdvisor.app",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: config.App(context).appHeight(3),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: config.App(context).appHeight(8),
            ),
          ],
        ),
      ),
    );
  }
}
