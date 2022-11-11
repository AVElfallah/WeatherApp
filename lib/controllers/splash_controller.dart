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
  SplashPageController(this.context) {
    startEvents();
  }
  final BuildContext? context;
  int stateIndex = SplashState.checkConnection.index;

  bool isLoaded = true;
  String stateText = 'check network connection..';
  bool _conn = false;
  var _locP = PermissionStatus.denied;

  void startEvents() {
    isLoaded = true;
    notifyListeners();
    debugPrint('start');
    getConnection().whenComplete(() {
      if (_conn) {
        changePage(SplashState.getLocation);
        getLocation().whenComplete(() {
          if (_locP == PermissionStatus.granted) {
            changePage(SplashState.getForcastes);
            getForcastes();
          }
        });
      }
    });
  }

  void changePage(SplashState state) {
    const labels = [
      'check network connection..',
      'get your current location..',
      'geting forcastes & open the app..',
    ];
    stateIndex = state.index;
    stateText = labels[stateIndex];
    notifyListeners();
  }

  Future getLocation() async {
    _locP = await LocationPermissionRepo.instance.getLocationPermission();
    if (_locP == PermissionStatus.granted) {
    } else {
      WeatherCustomDailog.show(
        title: 'Permission Error',
        context: context!,
      );
      isLoaded = false;
      _conn = false;
      changePage(SplashState.checkConnection);
      notifyListeners();
    }
  }

  Future getConnection() async {
    if (await NetworkConnection.instance.checkConnection()) {
      _conn = true;
    } else {
      WeatherCustomDailog.show(
        title: 'Network error check your connection',
        context: context!,
      );
      isLoaded = false;
      _conn = false;
      changePage(SplashState.checkConnection);
      notifyListeners();
    }
  }

  void getForcastes() async {
    var locData = await Location().getLocation();
    var longlat = '${locData.latitude},${locData.longitude}';
    var dayForecast = await WeatherRepository().getTodayForecast(longlat);
    var currentForcast = await WeatherRepository().getCurrentForecast(longlat);
    var location = await WeatherRepository().getLocationInfo(longlat);
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
