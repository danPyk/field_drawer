import 'package:field_drawer/app/routes.router.dart';
import 'package:field_drawer/front/widgets/setup_widgets.dart';
import 'package:field_drawer/front/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

import 'package:stacked_services/stacked_services.dart';

import 'injection.dart';

void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  setupErrorWidget();
  setupSnackbar();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: StackedService.navigatorKey,
        onGenerateRoute: StackedRouter().onGenerateRoute,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const WelcomeScreen());
  }
}
