import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import '../screens/home_screen.dart';
import '../screens/personal_screen.dart';
import '../screens/widget_screen.dart';

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
        AppRoutes.personal:(context) => PersonalPage(),
        AppRoutes.widgets:(context) => WidgetPage()
      },
      initialRoute: AppRoutes.home,
    );
  }
}