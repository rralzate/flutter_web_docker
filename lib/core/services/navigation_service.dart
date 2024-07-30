import 'package:flutter/material.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  //*Navigate to the desired view WITHOUT damaging the widget tree
  static navigateTo(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  //*Navigate to the desired view REPLACING views in the widget tree
  static replaceTo(String routeName) {
    return navigatorKey.currentState!.pushReplacementNamed(routeName);
  }

  //*Navigates to the desired view DESTRUCTING the last views in the widget tree and leaving the new view at the top.
  static popAndPush(String routeName) {
    return navigatorKey.currentState!.popAndPushNamed(routeName);
  }

  static goBack(String routeName) {
    return navigatorKey.currentState!.pop();
  }
}
