import 'package:flutter/material.dart';
import 'package:weather_app/controllers/application_controller.dart';

import '../localization/localization.dart';
import 'package:provider/provider.dart';

extension MediaQueryContext on BuildContext {
  double get aspectR => MediaQuery.of(this).size.aspectRatio;

  double get width {
    return MediaQuery.of(this).size.width;
  }

  double get height {
    return MediaQuery.of(this).size.height;
  }

  bool get isPortrait {
    return MediaQuery.of(this).orientation == Orientation.portrait;
  }

  String? translate(String? key) {
    return AppLocalizations.of(this)!.translate(key!);
  }

  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  ThemeData get theme => Theme.of(this);
  AppController get watchAppCtrl => watch<AppController>();

  AppController get readAppCtrl => read<AppController>();
}

extension TR on String {
  String? tr(BuildContext c) => AppLocalizations.of(c)?.translate(this);
}
