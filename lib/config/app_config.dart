import 'package:weather_app/model/forecast_enums.dart';

class Appconfig {
  Temperature temperature = Temperature.c;
  PressureIn pressureIn = PressureIn.mb;
  WindSpeed windSpeed = WindSpeed.kph;
  static const String apiKey = 'b0b1aa2a67de481f810235705222910';
}
