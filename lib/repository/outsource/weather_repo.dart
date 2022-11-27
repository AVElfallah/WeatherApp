import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:weather_app/config/app_config.dart';
import 'package:weather_app/model/forecast_hour_model.dart';
import 'package:weather_app/model/location_model.dart';
import '../../model/forecast_day_model.dart';

class WeatherRepository {
  WeatherRepository._();
  static final _instance = WeatherRepository._();
  static WeatherRepository get instance => _instance;

  Future<Map<String, dynamic>> getTodayForecast(
    String location, [
    String lang = 'en',
  ]) async {
    var request = await Dio().get(
      'http://api.weatherapi.com/v1/forecast.json?key=${Appconfig.apiKey}&q=$location&days=1&aqi=no&alerts=yes&lang=$lang',
    );

    var response = const JsonDecoder().convert(request.toString());
    var backMapResponse = {
      'day': ForecastDayModel.fromJson(response['forecast']['forecastday'][0]),
      'current': ForecastHourModel.fromJson(response['current']),
      'location': LocationModel.fromJson(response["location"]),
    };
    return backMapResponse;
  }

  Future<ForecastDayModel> getTomorrowForecast(String location,
      [String lang = 'en']) async {
    var v = await Dio().get(
      'http://api.weatherapi.com/v1/forecast.json?key=${Appconfig.apiKey}&q=$location&days=2&aqi=no&alerts=yes&lang=$lang',
    );
    var res = const JsonDecoder().convert(v.toString());
    return ForecastDayModel.fromJson(res['forecast']['forecastday'][1]);
  }

  Future<List<LocationModel>> search(String word, [String lang = 'en']) async {
    var v = await Dio().get(
      'http://api.weatherapi.com/v1/search.json?key=${Appconfig.apiKey}&q=$word&lang=$lang',
    );

    var list = [for (var i in v.data) LocationModel.fromJson(i)];
    return list;
  }
}
