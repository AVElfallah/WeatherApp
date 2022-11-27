import 'package:flutter/material.dart';

class AppController extends ChangeNotifier {
  AppController._();
  static final _instance = AppController._();
  static AppController get instance => _instance;
  Locale appLanguage = const Locale('en');

  changeAppLocale(AppLang lang) {
    appLanguage = Locale(lang.name.toLowerCase());
    notifyListeners();
  }
}

enum AppLang {
  ar,
  en,
}
