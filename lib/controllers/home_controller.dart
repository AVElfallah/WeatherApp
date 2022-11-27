import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:weather_app/model/forecast_hour_model.dart';
import 'package:weather_app/model/location_model.dart';
import 'package:weather_app/repository/outsource/weather_repo.dart';

import '../model/forecast_day_model.dart';

class HomePageController extends ChangeNotifier {
  HomePageController(this.dayModel, this.current, this.locationModel) {
    debugPrint('start homepage controller');
  }
  ForecastDayModel dayModel;
  ForecastHourModel current;
  LocationModel locationModel;

  CurrentForecast forecast = CurrentForecast.today;
  ScrollController scrollController =
      ScrollController(initialScrollOffset: 192);
  bool isLoading = false;
  @override
  void dispose() {
    super.dispose();
    debugPrint('dispose homepage controller');
  }

  changeCurrentForecast(String lang, [forecastG]) {
    if (forecastG == null) {
      forecastG = forecast;
    } else {
      forecast = forecastG;
    }
    if (forecast == CurrentForecast.today) {
      _getTodayForecast(lang);
    } else {
      _getTomorrowForecast(lang);
    }
  }

  void _getTomorrowForecast(String lang) async {
    isLoading = true;
    var weather = WeatherRepository.instance;
    var locData = await Location().getLocation(); //get location
    var longlat = '${locData.latitude},${locData.longitude}'; //set location var
    notifyListeners();
    weather.getTomorrowForecast(longlat, lang).then(
      (day) {
        dayModel = day;
        current = day.hour!.first;
        isLoading = false;
        notifyListeners();
      },
    );
  }

  void _getTodayForecast(String lang) async {
    isLoading = true;
    var weather = WeatherRepository.instance;

    var locData = await Location().getLocation(); //get location
    var longlat = '${locData.latitude},${locData.longitude}'; //set location var
    notifyListeners();
    weather.getTodayForecast(longlat, lang).then(
      (day) async {
        dayModel = day['day'];
        current = day['current'];
        locationModel = day['location'];
        isLoading = false;
        notifyListeners();
      },
    );
  }
}

enum CurrentForecast {
  today,
  tomorrow,
}
