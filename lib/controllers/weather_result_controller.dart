import 'package:flutter/material.dart';
import 'package:weather_app/model/forecast_day_model.dart';
import 'package:weather_app/model/forecast_hour_model.dart';
import 'package:weather_app/repository/outsource/weather_repo.dart';

class WeatherResultContoller extends ChangeNotifier {
  bool? isLoading = true;
  ForecastHourModel? currentHour;
  ForecastDayModel? wholeDay;

  setForecast(String location, [String lang = 'en']) async {
    try {
      wholeDay =
          await WeatherRepository.instance.getTodayForecast(location, lang);
      currentHour =
          await WeatherRepository.instance.getCurrentForecast(location, lang);

      isLoading = false;
      notifyListeners();
    } catch (ex) {
      debugPrint(ex.toString());
      isLoading = true;
      notifyListeners();
    }
  }
}
