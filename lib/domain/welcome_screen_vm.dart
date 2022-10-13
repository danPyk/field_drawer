import 'package:field_drawer/app/routes.router.dart';
import 'package:field_drawer/back/permissions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mockito/annotations.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stacked_services/stacked_services.dart';

@Injectable()
@GenerateNiceMocks([MockSpec<WelcomeScreenVm>()])
class WelcomeScreenVm extends ChangeNotifier {
  WelcomeScreenVm(
      {required this.permissionsService,
      required this.navServ,
      required this.snackbarService});

  final PermissionsService permissionsService;
  final NavigationService navServ;
  final SnackbarService snackbarService;

  void _showErrorSnacbar(String text) {
    snackbarService.showSnackbar(
      message: text,
      title: 'Error',
      duration: const Duration(seconds: 3),
    );
  }

  Future<void> internetConnectionSnackbar() async {
    var internet = await permissionsService.getNetworkStatus();
    if (internet != true) {
      _showErrorSnacbar('You have no internet connection.');
    }
  }

  Future<void> checkLocationPermission() async {
    await permissionsService.permissionServices().then(
      (value) async {
        switch (await permissionsService.permission.status) {
          case PermissionStatus.denied:
            _showErrorSnacbar('Location permission denied');
            break;

          case PermissionStatus.permanentlyDenied:
            _showErrorSnacbar('You have rejected location permission.');
            break;

          ///NAVIGATE IF GRANTED PERMISSION
          case PermissionStatus.granted:
            navServ.navigateTo(Routes.mapScreen);
            break;

          default:
            _showErrorSnacbar('Did not granted permission.');
            break;
        }
      },
    );
  }
}
