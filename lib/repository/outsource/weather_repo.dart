import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:weather_app/config/app_config.dart';
import 'package:weather_app/model/forecast_hour_model.dart';
import 'package:weather_app/model/location_model.dart';

import '../../model/forecast_day_model.dart';

class WeatherRepository {
  Future<ForecastDayModel> getTodayForecast(String location) async {
    var v = await Dio().get(
      'http://api.weatherapi.com/v1/forecast.json?key=${Appconfig.apiKey}&q=$location&days=1&aqi=no&alerts=yes',
    );
    var res = const JsonDecoder().convert(v.toString());
    return ForecastDayModel.fromJson(res['forecast']['forecastday'][0]);
  }

  Future<ForecastDayModel> getTomorrowForecast(String location) async {
    var v = await Dio().get(
      'http://api.weatherapi.com/v1/forecast.json?key=${Appconfig.apiKey}&q=$location&days=2&aqi=no&alerts=yes',
    );
    var res = const JsonDecoder().convert(v.toString());
    return ForecastDayModel.fromJson(res['forecast']['forecastday'][1]);
  }

  Future<ForecastHourModel> getCurrentForecast(String location) async {
    var v = await Dio().get(
      'http://api.weatherapi.com/v1/forecast.json?key=${Appconfig.apiKey}&q=$location&days=1&aqi=no&alerts=yes',
    );
    var res = const JsonDecoder().convert(v.toString());

    return ForecastHourModel.fromJson(res['current']);
  }

  Future<LocationModel> getLocationInfo(String location) async {
    var v = await Dio().get(
      'http://api.weatherapi.com/v1/forecast.json?key=${Appconfig.apiKey}&q=$location&days=1&aqi=no&alerts=yes',
    );
    var res = const JsonDecoder().convert(v.toString());

    return LocationModel.fromJson(res["location"]);
  }
}
