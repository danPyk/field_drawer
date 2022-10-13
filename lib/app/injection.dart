import 'package:field_drawer/domain/map_screen_vm.dart';
import 'package:field_drawer/back/permissions.dart';
import 'package:field_drawer/domain/welcome_screen_vm.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:stacked_services/stacked_services.dart';

final sL = GetIt.instance;

@InjectableInit()
void configureDependencies() {
  ///singletons
  sL.registerLazySingleton(() => PermissionsService());
  sL.registerLazySingleton(() => NavigationService());
  sL.registerLazySingleton(() => SnackbarService());
  final internetChecker = InternetConnectionChecker.createInstance(
    checkTimeout: const Duration(seconds: 1), // Custom check timeout
    checkInterval: const Duration(seconds: 1), // Custom check interval
  );
  sL.registerLazySingleton<InternetConnectionChecker>(
    () => internetChecker,
  );

  ///factories

  sL.registerFactory(() => MapScreenVm());
  sL.registerFactory(() => WelcomeScreenVm(
      permissionsService: sL(), navServ: sL(), snackbarService: sL()));
}
