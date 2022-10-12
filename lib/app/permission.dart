import 'package:field_drawer/app/injection.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:permission_handler/permission_handler.dart';

@singleton
class PermissionsUtils {
  Permission permission = Permission.location;

  Future<PermissionStatus> checkAndRequestLocation() async {
    ///request permission
    if (await permission.isDenied) {
      permission.request();
    }
    return permission.status;
  }

  Future<bool> getNetworkStatus() async {
    final bool connectionStatus =
        await getIt.get<InternetConnectionChecker>().hasConnection;
    return connectionStatus;
  }
}
