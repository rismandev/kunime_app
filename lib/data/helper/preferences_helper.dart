import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  final Future<SharedPreferences> sharedPreferences;

  PreferencesHelper({@required this.sharedPreferences});

  // THEME
  static const DARK_THEME = 'DARK_THEME';

  Future<bool> get isDarkTheme async {
    final prefs = await sharedPreferences;
    return prefs.getBool(DARK_THEME) ?? false;
  }

  void setDarkTheme(bool value) async {
    final prefs = await sharedPreferences;
    prefs.setBool(DARK_THEME, value);
  }

  // USER PHONE
  static const USER_PHONE = 'USER_PHONE';

  Future<bool> get isUserPhone async {
    final prefs = await sharedPreferences;
    String _phone = prefs.getString(USER_PHONE) ?? '';
    return _phone.isNotEmpty;
  }

  void setUserPhone(String phone) async {
    final prefs = await sharedPreferences;
    prefs.setString(USER_PHONE, phone);
  }
}
