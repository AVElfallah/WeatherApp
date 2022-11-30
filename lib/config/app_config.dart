import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:weather_app/model/forecast_enums.dart';

class Appconfig {
  //SECTION -
  Appconfig._() {
    debugPrint('Appconfig class has been intilazed');
  }

  //SECTION -  static vars
  static final Appconfig _instance = Appconfig._();
  static Appconfig get instance => _instance;
  static const String apiKey = 'cd136c77bedb4ef689c154038221611';
  static GetStorage? storedInfoBox = GetStorage('WeatherApp');

//SECTION -  application preferences
  Temperature? temperature =
      temperatuerByKey(storedInfoBox?.read<String>('temperature') ?? 'c');
  PressureIn? pressureIn =
      getPressureInByKey(storedInfoBox?.read<String>('pressureIn') ?? 'inc');
  WindSpeed? windSpeed =
      getWindSpeedByKey(storedInfoBox?.read<String>('windSpeed') ?? 'kph');
  String applang = storedInfoBox?.read('applang') ?? 'en';

//SECTION

  void updatePreferences() {
    debugPrint('update start');
    storedInfoBox?.write('applang', applang);

    storedInfoBox?.write(
        'temperature', Temperature.values[temperature!.index].name);

    storedInfoBox?.write(
      'pressureIn',
      PressureIn.values[pressureIn!.index].name,
    );

    storedInfoBox?.write('windSpeed', WindSpeed.values[windSpeed!.index].name);
    debugPrint('update end');
  }

//SECTION -  static methods

}
