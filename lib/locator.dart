import 'package:get_it/get_it.dart';
import 'package:worker_attendace/core/service/authentication_service.dart';
import 'package:worker_attendace/core/service/checkin_service.dart';
import 'package:worker_attendace/core/service/firestore_service.dart';
import 'package:worker_attendace/core/service/navigation_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => FirestoreService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => CheckinService());
}
