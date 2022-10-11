import 'package:field_drawer/back/datasource/g_maps.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() {
  //getIt.registerLazySingleton<http.Client>(() => http.Client());
  getIt.registerLazySingleton<GMapsServiceI>(
        () => GMapsService(), //sharedPreferences: sl()
  );

}

