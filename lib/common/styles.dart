import 'package:flutter/material.dart';

final Color primaryColor = Color(0xFF098DE6);
final Color secondaryColor = Color(0xFFFFFFFF);
final Color redColor = Color(0xFFFF4646);
final Color greenColor = Color(0xFF00ED18);
final Color greenSecondaryColor = Color(0xFF02B814);

final Color textColor = Color(0xFF404040);
final Color borderColor = Color(0xFFEEEEEE);

final TextTheme customTextTheme = TextTheme(
  headline1: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 92,
    fontWeight: FontWeight.w700,
    letterSpacing: -1.5,
  ),
  headline2: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 57,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
  ),
  headline3: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 46,
    fontWeight: FontWeight.w700,
  ),
  headline4: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 32,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.25,
  ),
  headline5: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 23,
    fontWeight: FontWeight.w500,
  ),
  headline6: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 19,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  ),
  subtitle1: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 15,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  ),
  subtitle2: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 13,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  ),
  bodyText1: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
  ),
  bodyText2: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.25,
  ),
  button: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.25,
  ),
  caption: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
  ),
  overline: TextStyle(
    fontFamily: 'Poppins',
    fontSize: 10,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
  ),
);

ThemeData lightTheme = ThemeData(
  primaryColor: primaryColor,
  accentColor: secondaryColor,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  scaffoldBackgroundColor: Colors.white,
  textTheme: customTextTheme,
  appBarTheme: AppBarTheme(
    textTheme: customTextTheme.apply(bodyColor: Colors.white),
    elevation: 0,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: primaryColor,
    textTheme: ButtonTextTheme.accent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
);
