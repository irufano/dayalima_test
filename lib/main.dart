import 'package:dayalima_test/src/app/helpers/routes.dart';
import 'package:dayalima_test/src/app/managers/dialog_manager.dart';
import 'package:dayalima_test/src/app/managers/route_manager.dart' as router;
import 'package:dayalima_test/src/app/services/locator_service.dart';
import 'package:dayalima_test/src/app/services/navigation_service.dart';
import 'package:dayalima_test/src/presentation/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // layout potrait only
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return DialogManager(
      child: MaterialApp(
        title: 'Base Project Bloc Felangel by irufano',
        debugShowCheckedModeBanner: false,
        theme: Styles.themeData,
        navigatorKey: locator<NavigationService>().navigatorKey,
        onGenerateRoute: router.generateRoute,
        initialRoute: Routes.ROOT,
        builder: (context, child) {
          child = router.builderDialog(context, child); //do something
          return child;
        },
      ),
    );
  }
}
