import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'package:weather_app/config/routes.dart';
import 'package:weather_app/controllers/application_controller.dart';

import 'localization/localization.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppController(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var watch = context.watch<AppController>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather app',
      locale: watch.appLanguage,
      supportedLocales: const [
        Locale('en', ''),
        Locale('ar', ''),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
        secondaryHeaderColor: Colors.white,
      ),
      routes: Routes().mapOFRoutes,
      initialRoute: Routes.splashPage.name,
    );
  }
}
