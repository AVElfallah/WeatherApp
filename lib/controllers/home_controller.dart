import 'package:flutter/material.dart';
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
  ScrollController scrollController = ScrollController(initialScrollOffset: 92);
  bool isLoading = false;
  @override
  void dispose() {
    super.dispose();
    debugPrint('dispose homepage controller');
  }

  void getTomorrowForecast() async {
    isLoading = true;
    var weather = WeatherRepository();
    notifyListeners();
    weather.getTomorrowForecast(locationModel.name).then(
      (day) {
        dayModel = day;
        current = day.hour!.first;
        isLoading = false;
        notifyListeners();
      },
    );
  }

  void getTodayForecast() async {
    isLoading = true;
    var weather = WeatherRepository();
    notifyListeners();
    weather.getTodayForecast(locationModel.name).then(
      (day) async {
        dayModel = day;
        current = await weather.getCurrentForecast(
          locationModel.name,
        );
        isLoading = false;
        notifyListeners();
      },
    );
  }
}
