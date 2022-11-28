import 'package:flutter/material.dart';
import 'package:weather_app/model/forecast_enums.dart';

import '../config/app_config.dart';

class SettingsController extends ChangeNotifier {
  Temperature currentTemperature = Appconfig.instance.temperature!;
  PressureIn currentPressure = Appconfig.instance.pressureIn!;
  WindSpeed currentWindSpeed = Appconfig.instance.windSpeed!;

  void changeTemperature(temp) {
    currentTemperature = temp;
    Appconfig.instance.temperature = temp;
    Appconfig.instance.updatePreferences();
    notifyListeners();
  }

  void changePressure(pre) {
    currentPressure = pre;
    Appconfig.instance.pressureIn = currentPressure;
    Appconfig.instance.updatePreferences();
    notifyListeners();
  }

  void changeWindSpeed(wind) {
    currentWindSpeed = wind;
    Appconfig.instance.windSpeed = currentWindSpeed;
    Appconfig.instance.updatePreferences();
    notifyListeners();
  }
}
