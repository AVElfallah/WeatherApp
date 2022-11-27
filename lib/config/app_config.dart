import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:weather_app/model/forecast_enums.dart';

class Appconfig {
  //SECTION -
  Appconfig._() {
    debugPrint('Appconfig class has been intilazed');
    _initStorage();
    _setPreferences().whenComplete(() => debugPrint('setPref complete'));
  }

  //SECTION -  static vars
  static final Appconfig _instance = Appconfig._();
  static Appconfig get instance => _instance;
  static const String apiKey = 'cd136c77bedb4ef689c154038221611';
  static final storedInfoBox = GetStorage('WeatherApp');

//SECTION -  application preferences
  Temperature? temperature;
  PressureIn? pressureIn;
  WindSpeed? windSpeed;
  String? applang;

//SECTION -  internal methods
  Future<void> updatePreferences() async {
    await storedInfoBox.write('applang', applang);
    await storedInfoBox.write('temperature', temperature.toString());
    await storedInfoBox.write('pressureIn', pressureIn.toString());
    await storedInfoBox.write('windSpeed', windSpeed.toString());
  }

  Future<void> _setPreferences() async {
    temperature = temperatuerByKey(storedInfoBox.read<String>('temperature')!);
    pressureIn = getPressureInByKey(storedInfoBox.read<String>('pressureIn')!);
    windSpeed = getWindSpeedByKey(storedInfoBox.read<String>('windSpeed')!);
    applang = storedInfoBox.read<String>('applang');
  }

//SECTION -  static methods

  static void _initStorage() {
    storedInfoBox.writeIfNull('applang', 'en');
    storedInfoBox.writeIfNull('temperature', 'c');
    storedInfoBox.writeIfNull('pressureIn', 'inc');
    storedInfoBox.writeIfNull('windSpeed', 'kph');
    debugPrint('initStorage complete');
  }
}
