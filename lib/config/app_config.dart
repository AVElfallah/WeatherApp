import 'package:weather_app/model/forecast_enums.dart';

class Appconfig {
  Temperature temperature = Temperature.c;
  PressureIn pressureIn = PressureIn.mb;
  WindSpeed windSpeed = WindSpeed.kph;
  static const String apiKey = 'cd136c77bedb4ef689c154038221611';
}
