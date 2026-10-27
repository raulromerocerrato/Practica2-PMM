import 'package:flutter/material.dart';
import 'package:practica2_pmm/routes/app_routes.dart';
import 'package:practica2_pmm/screens/home_screen.dart';

void main () {
    runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DevProfile M3',
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      routes: {
        AppRoutes.home:(context) => HomePage(),
      },
      initialRoute: AppRoutes.home,
    );
  }
}