import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class Navigation {
  static navigateWitParam(String routeName, Object arguments) {
    navigatorKey.currentState.pushNamed(routeName, arguments: arguments);
  }

  static navigate(String routeName) {
    navigatorKey.currentState.pushNamed(routeName);
  }

  static pushAndRemove(String routeName) {
    navigatorKey.currentState.pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
    );
  }

  static back() => navigatorKey.currentState.pop();
}
