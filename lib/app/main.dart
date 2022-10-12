import 'package:field_drawer/front/map_screen.dart';
import 'package:field_drawer/front/no_internet_screen.dart';
import 'package:field_drawer/app/permission.dart';
import 'package:flutter/material.dart';

import 'injection.dart';
import 'package:permission_handler/permission_handler.dart';

Future<Widget> selectScreenBasedOnPermission() async {
  late Widget screen;
  PermissionsUtils permissionsUtils = getIt();
  PermissionStatus? location = await permissionsUtils.checkAndRequestLocation();
  bool isThereInternet = await permissionsUtils.getNetworkStatus();

  if (isThereInternet == true && location.isGranted == true) {
    screen = const MapScreen();
  }
  if (isThereInternet == false && location.isGranted == true) {
    screen = const ErrorScreen(
      message: 'You have no internet connection',
    );
  }
  if (location.isGranted != true) {
    screen = const ErrorScreen(
        message: "You didn't accept location request permission.");
  }
  return screen;
}

void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();

  var screen = await selectScreenBasedOnPermission();

  runApp(MyApp(
    screnn: screen,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.screnn});

  final Widget screnn;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: screnn,
    );
  }
}
