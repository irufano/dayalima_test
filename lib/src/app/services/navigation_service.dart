import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(
    String routeName, {
    dynamic arguments,
  }) {
    return navigatorKey.currentState.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  Future<dynamic> replaceNavigateTo(
    String routeName, {
    dynamic arguments,
  }) {
    return navigatorKey.currentState.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  Future<dynamic> replaceUntilNavigateTo(
    String routeName,
    String removeRouteName, {
    dynamic arguments,
  }) {
    return navigatorKey.currentState.pushNamedAndRemoveUntil(
      routeName,
      ModalRoute.withName(removeRouteName),
      arguments: arguments,
    );
  }

  Future<dynamic> clearNavigateTo(
    String routeName, {
    dynamic arguments,
  }) {
    return navigatorKey.currentState.pushNamedAndRemoveUntil(
      routeName,
      (Route<dynamic> pageRoute) => false,
      arguments: arguments,
    );
  }

  bool goBack() {
    navigatorKey.currentState.pop();
    return true;
  }
}
