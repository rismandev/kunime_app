import 'package:firebase_core/firebase_core.dart';
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
    // INITIALIZE FIREBASE
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: 'AIzaSyCNtJOXWptUJ6hGdrFOqirX7c4VVCMf3kQ',
        appId: '1:874148490032:ios:6896fd3470d6d4a52ff6f5',
        messagingSenderId: '874148490032',
        projectId: 'kunimeapp',
      ),
    );
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
