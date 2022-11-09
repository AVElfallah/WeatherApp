import 'package:weather_app/model/astronomy_model.dart';
import 'package:weather_app/model/day_model.dart';
import 'package:weather_app/model/forecast_hour_model.dart';

class ForecastDayModel {
  String? date;
  int? dateEpoch;
  DayModel? day;
  AstronomyModel? astro;
  List<ForecastHourModel>? hour;

  ForecastDayModel({
    this.date,
    this.dateEpoch,
    this.day,
    this.astro,
    this.hour,
  });

  ForecastDayModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    dateEpoch = int.parse(json['date_epoch'].toString());
    day = json['day'] != null ? DayModel.fromJson(json['day']) : null;
    astro =
        json['astro'] != null ? AstronomyModel.fromJson(json['astro']) : null;
    hour = json['hour'] != null
        ? ForecastHourModel.fromListOFHourJson(json['hour'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['date'] = date;
    data['date_epoch'] = dateEpoch;
    if (day != null) {
      data['day'] = day!.toJson();
    }
    if (astro != null) {
      data['astro'] = astro!.toJson();
    }
    if (hour != null) {
      data['hour'] = hour!.map((e) => e.toJson());
    }
    return data;
  }
}
