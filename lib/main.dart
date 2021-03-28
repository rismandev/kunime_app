import 'package:flutter/material.dart';
import 'package:kunime_app/common/navigation.dart';
import 'package:kunime_app/common/route.dart' as routes;
import 'package:kunime_app/common/sizeconfig.dart';
import 'package:kunime_app/common/styles.dart';
import 'package:kunime_app/data/helper/preferences_helper.dart';
import 'package:kunime_app/data/provider/quiz_provider.dart';
import 'package:kunime_app/data/provider/user_provider.dart';
import 'package:kunime_app/router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => QuizProvider()),
        ChangeNotifierProvider(
          create: (context) => UserProvider(
            preferencesHelper: PreferencesHelper(
              sharedPreferences: SharedPreferences.getInstance(),
            ),
          ),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);

            return MaterialApp(
              builder: (context, child) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).requestFocus(new FocusNode());
                    },
                    child: child,
                  ),
                );
              },
              debugShowCheckedModeBanner: false,
              title: 'KunimeApp',
              theme: lightTheme,
              navigatorKey: navigatorKey,
              initialRoute: routes.SplashRoute,
              onGenerateRoute: onGenerateRoute,
            );
          },
        );
      },
    );
  }
}
