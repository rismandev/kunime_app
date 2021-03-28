import 'package:flutter/material.dart';
import 'package:kunime_app/common/navigation.dart';
import 'package:kunime_app/common/styles.dart';
import 'package:kunime_app/common/route.dart' as routes;
import 'package:kunime_app/data/helper/preferences_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  PreferencesHelper _preferences = PreferencesHelper(
    sharedPreferences: SharedPreferences.getInstance(),
  );

  @override
  void initState() {
    super.initState();
    _navigate();
  }

  void _navigate() async {
    // GET USER PHONE
    bool _isLoggedIn = await _preferences.isUserPhone;
    // DURATION
    const _duration = Duration(seconds: 3);
    await Future.delayed(_duration, () {
      Navigation.pushAndRemove(
        _isLoggedIn ? routes.DashboardRoute : routes.WelcomeRoute,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "KunimeApp",
              style: Theme.of(context).textTheme.headline4.copyWith(
                  color: secondaryColor,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.5),
            ),
            SizedBox(height: 25),
            CircularProgressIndicator(
              backgroundColor: secondaryColor,
              valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
