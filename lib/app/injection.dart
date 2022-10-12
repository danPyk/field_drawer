import 'package:field_drawer/domain/map_screen_vm.dart';
import 'package:field_drawer/app/permission.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() {
  //getIt.registerLazySingleton<http.Client>(() => http.Client());
  getIt.registerFactory(() => MapScreenVm());

  final internetChecker = InternetConnectionChecker.createInstance(
    checkTimeout: const Duration(seconds: 1), // Custom check timeout
    checkInterval: const Duration(seconds: 1), // Custom check interval
  );
  getIt.registerSingleton<InternetConnectionChecker>(
    internetChecker,
  );
  getIt.registerLazySingleton(() => PermissionsUtils());
}
