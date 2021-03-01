import 'package:dayalima_test/src/app/helpers/routes.dart';
import 'package:dayalima_test/src/presentation/pages/home/detail_page.dart';
import 'package:dayalima_test/src/presentation/pages/home/menu_detail_page.dart';
import 'package:dayalima_test/src/presentation/pages/home/menu_page.dart';
import 'package:dayalima_test/src/presentation/pages/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'dialog_manager.dart';

Widget builderDialog(BuildContext context, Widget widget) => Navigator(
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (context) => DialogManager(
          child: widget,
        ),
      ),
    );

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.ROOT:
      return MaterialPageRoute(
        builder: (context) => SplashScreen(
          data: settings.arguments,
        ),
      );
    case Routes.MENU_PAGE:
      return MaterialPageRoute(
        builder: (context) => MenuPage(
          data: settings.arguments,
        ),
      );
    case Routes.MENU_DETAIL_PAGE:
      return MaterialPageRoute(
        builder: (context) => MenuDetailPage(
          data: settings.arguments,
        ),
      );
    case Routes.DETAIL_PAGE:
      return MaterialPageRoute(
        builder: (context) => DetailPage(
          data: settings.arguments,
        ),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(
            child: Text('Route not defined'),
          ),
        ),
      );
  }
}
