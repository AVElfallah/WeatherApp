import 'package:flutter/material.dart';
import 'package:weather_app/config/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        secondaryHeaderColor: Colors.white,
      ),
      routes: Routes().mapOFRoutes,
      initialRoute: Routes.homePage.name,
    );
  }
}
