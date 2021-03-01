import 'package:dayalima_test/src/app/services/dialog_service.dart';
import 'package:dayalima_test/src/app/services/navigation_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
}
