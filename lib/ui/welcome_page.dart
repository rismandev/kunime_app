import 'package:flutter/material.dart';
import 'package:kunime_app/common/navigation.dart';
import 'package:kunime_app/common/styles.dart';
import 'package:kunime_app/common/route.dart' as routes;
import 'package:kunime_app/widgets/button/primary_button.dart';

const String welcomeTitle = "Apa itu KunimeApp?";
const String welcomeDesc =
    "KunimeApp adalah Aplikasi yang berisi Kuis Anime. Aplikasi ini dibuat khusus untuk menguji pengetahuan setiap penggemar Anime.";

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/welcome.png",
                  width: 240,
                  height: 200,
                ),
                SizedBox(height: 25),
                Container(
                  margin: EdgeInsets.all(25),
                  child: Text(
                    welcomeTitle,
                    style: Theme.of(context).textTheme.headline5.copyWith(
                        color: textColor,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.5),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(25),
                  child: Text(
                    welcomeDesc,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: textColor,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.5),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            width: double.infinity,
            margin: EdgeInsets.all(25),
            child: PrimaryButton(
              text: "Mulai",
              onPressed: () => Navigation.navigate(routes.LoginRoute),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
