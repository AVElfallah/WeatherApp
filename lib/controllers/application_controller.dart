import 'package:flutter/material.dart';
import 'package:weather_app/config/app_config.dart';

class AppController extends ChangeNotifier {
  AppController._();
  static final _instance = AppController._();
  static AppController get instance => _instance;
  Locale appLanguage = Locale(Appconfig.instance.applang);

  changeAppLocale(AppLang lang) {
    appLanguage = Locale(lang.name.toLowerCase());
    Appconfig.instance.applang = lang.name.toLowerCase();
    Appconfig.instance.updatePreferences();
    notifyListeners();
  }
}

enum AppLang {
  ar,
  en,
}
