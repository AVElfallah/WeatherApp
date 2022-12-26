import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/colors/colors.dart';
import 'package:weather_app/config/app_config.dart';
import 'package:weather_app/config/app_theme.dart';

import 'package:weather_app/config/routes.dart';
import 'package:weather_app/controllers/application_controller.dart';

import 'localization/localization.dart';

void main() async {
  await GetStorage.init('WeatherApp');
  Appconfig.instance;
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppController.instance,
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
      themeMode: watch.themeMode,
      theme: ApplicationTheme.ligtTheme,
      darkTheme: ApplicationTheme.darkTheme,
      routes: Routes().mapOFRoutes,
      initialRoute: Routes.splashPage.name,
    );
  }
}
