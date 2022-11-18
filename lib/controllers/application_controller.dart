import 'package:flutter/material.dart';

class AppController extends ChangeNotifier {
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
