import 'package:flutter/material.dart';
import 'package:kunime_app/common/route.dart' as routes;
import 'package:kunime_app/common/navigation.dart';
import 'package:kunime_app/data/helper/preferences_helper.dart';

class UserProvider extends ChangeNotifier {
  PreferencesHelper preferencesHelper;

  UserProvider({@required this.preferencesHelper});

  String _userPhone;

  String get userPhone => _userPhone ?? '';

  void setUserPhone(String phone) {
    this._userPhone = phone;
    notifyListeners();
  }

  void setPhoneToStorage() {
    preferencesHelper.setUserPhone(this._userPhone);
    Navigation.pushAndRemove(routes.DashboardRoute);
  }

  void deleteUserPhone() {
    preferencesHelper.setUserPhone('');
    Navigation.pushAndRemove(routes.WelcomeRoute);
  }
}
