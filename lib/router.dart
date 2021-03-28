import 'package:flutter/material.dart';
import 'package:kunime_app/common/route.dart' as routes;
import 'package:kunime_app/ui/dashboard/dashboard_page.dart';
import 'package:kunime_app/ui/dashboard/quiz_page.dart';
import 'package:kunime_app/ui/dashboard/quiz_result_page.dart';
import 'package:kunime_app/ui/dashboard/setting_page.dart';
import 'package:kunime_app/ui/login_page.dart';
import 'package:kunime_app/ui/splash_screen.dart';
import 'package:kunime_app/ui/verification_page.dart';
import 'package:kunime_app/ui/welcome_page.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routes.SplashRoute:
      return MaterialPageRoute(builder: (context) => SplashPage());
      break;
    case routes.WelcomeRoute:
      return MaterialPageRoute(builder: (context) => WelcomePage());
      break;
    case routes.LoginRoute:
      return MaterialPageRoute(builder: (context) => LoginPage());
      break;
    case routes.VerificationRoute:
      return MaterialPageRoute(builder: (context) => VerificationPage());
      break;
    case routes.DashboardRoute:
      return MaterialPageRoute(builder: (context) => DashboardPage());
      break;
    case routes.SettingRoute:
      return MaterialPageRoute(builder: (context) => SettingPage());
      break;
    case routes.QuizRoute:
      return MaterialPageRoute(builder: (context) => QuizPage());
      break;
    case routes.QuizResultRoute:
      return MaterialPageRoute(builder: (context) => QuizResultPage());
      break;
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(child: Text('No path for ${settings.name}')),
        ),
      );
  }
}
