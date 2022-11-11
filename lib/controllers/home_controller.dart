import 'package:flutter/material.dart';
import 'package:weather_app/model/forecast_hour_model.dart';
import 'package:weather_app/model/location_model.dart';

import '../model/forecast_day_model.dart';

class HomePageController extends ChangeNotifier {
  HomePageController(this.dayModel, this.current, this.locationModel) {
    debugPrint('start homepage controller');
  }
  ForecastDayModel dayModel;
  ForecastHourModel current;
  LocationModel locationModel;
  var scrollController = ScrollController(initialScrollOffset: 92);
  @override
  void dispose() {
    super.dispose();
    debugPrint('dispose homepage controller');
  }
}
