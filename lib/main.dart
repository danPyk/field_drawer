import 'package:field_drawer/front/map_screen.dart';
import 'package:flutter/material.dart';

import 'injection.dart';

void main()  {
  runApp(const MyApp());
  configureDependencies();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MapScreen(),
    );
  }
}

