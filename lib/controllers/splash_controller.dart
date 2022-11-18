import 'dart:async';

import 'package:location/location.dart';

import 'package:flutter/material.dart';
import 'package:weather_app/config/routes.dart';
import 'package:weather_app/repository/insource/location_permission.dart';
import 'package:weather_app/repository/insource/network_connection.dart';
import 'package:weather_app/repository/outsource/weather_repo.dart';
import 'package:weather_app/views/widgets/dialog_widget.dart';

enum SplashState {
  checkConnection,
  getLocation,
  getForcastes,
}

class SplashPageController extends ChangeNotifier {
  SplashPageController(this.context, [String lang = 'en']) {
    startEvents(lang);
  }
  final BuildContext? context;
  int stateIndex = SplashState.checkConnection.index;

  bool isLoaded = true;
  var _locP = PermissionStatus.denied;

  void startEvents(String lang) async {
    isLoaded = true;
    notifyListeners();
    debugPrint('start event');
    var qc = <FutureOr Function()>[
      () => getConnection(),
      () => getLocation(),
      () => getForcastes(lang)
    ];
    for (var event in qc) {
      var x = await Future.delayed(
        const Duration(milliseconds: 1600),
        (() => event.call()),
      );
      if (x != null) {
        changePage(SplashState.values[(x as SplashState).index + 1]);
      }
    }
  }

  void changePage(SplashState state) {
    stateIndex = state.index;

    notifyListeners();
  }

  Future getLocation() async {
    _locP = await LocationPermissionRepo.instance.getLocationPermission();
    if (_locP == PermissionStatus.granted) {
      notifyListeners();
      return SplashState.getLocation;
    } else {
      WeatherCustomDailog.show(
        title: 'Permission Error',
        context: context!,
      );
      isLoaded = false;
      notifyListeners();
      return SplashState.checkConnection;
    }
  }

  Future getConnection() async {
    if (await NetworkConnection.instance.checkConnection()) {
      notifyListeners();
      return SplashState.checkConnection;
    } else {
      WeatherCustomDailog.show(
        title: 'Network error check your connection',
        context: context!,
      );
      isLoaded = false;
      notifyListeners();
      return SplashState.checkConnection;
    }
  }

  FutureOr<void> getForcastes(String lang) async {
    //get app lang
    var locData = await Location().getLocation(); //get location
    var longlat = '${locData.latitude},${locData.longitude}'; //set location var
    var weather = WeatherRepository.instance;
    var dayForecast = await weather.getTodayForecast(
      longlat,
      lang,
    );
    var currentForcast = await weather.getCurrentForecast(
      longlat,
      lang,
    );
    var location = await weather.getLocationInfo(
      longlat,
      lang,
    );

    Navigator.pushReplacementNamed(
      context!,
      Routes.homePage.name!,
      arguments: {
        'dayForecast': dayForecast,
        'currentForcast': currentForcast,
        'location': location,
      },
    );
  }
}
