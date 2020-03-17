import 'package:covidph/services/firestore_services.dart';
import 'package:get_it/get_it.dart';
import 'package:covidph/services/navigation_service.dart';
import 'package:covidph/services/dialog_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => FirestoreService());
}
