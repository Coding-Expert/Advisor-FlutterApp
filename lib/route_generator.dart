import 'package:flutter/material.dart';

import 'src/pages/chat_list_screen.dart';
import 'src/pages/home_screen.dart';
import 'src/pages/privacy_policy_screen.dart';
import 'src/pages/profile_screen.dart';
import 'src/pages/report_issue_screen.dart';
import 'src/pages/signup.dart';
import 'src/pages/splash_screen.dart';
import 'src/pages/the_rules_screen.dart';
import 'src/pages/welcome_screen.dart';
import 'src/pages/introduce_screen.dart';
import 'src/pages/login.dart';
import 'src/pages/forgot_password.dart';
import 'src/pages/how_to_use_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/Splash':
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case '/Welcome':
        return MaterialPageRoute(builder: (_) => WelcomeScreenWidget());

      case '/Introduce':
        return MaterialPageRoute(builder: (_) => IntroduceScreenWidget());

      case '/Login':
        return MaterialPageRoute(builder: (_) => LoginScreenWidget());

      case '/SignUp':
        return MaterialPageRoute(builder: (_) => SignUpScreenWidget());

      case '/Home':
        return MaterialPageRoute(builder: (_) => HomeScreenWidget());

      case '/ForgotPassword':
        return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());

      case '/Profile':
        return MaterialPageRoute(builder: (_) => ProfileScreen());

      case '/HowToUse':
        return MaterialPageRoute(builder: (_) => HowToUseScreen());

      case '/TheRules':
        return MaterialPageRoute(builder: (_) => TheRulesScreen());

      case '/PrivacyPolicy':
        return MaterialPageRoute(builder: (_) => PrivacyPolicyScreen());

      case '/ReportIssue':
        return MaterialPageRoute(builder: (_) => ReportIssueScreen());

      case '/ChatList':
        return MaterialPageRoute(builder: (_) => ChatListScreen());

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return MaterialPageRoute(
            builder: (_) =>
                Scaffold(body: SafeArea(child: Text('Route Error'))));
    }
  }
}
