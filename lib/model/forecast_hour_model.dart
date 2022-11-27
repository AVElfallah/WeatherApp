import 'package:weather_app/model/weather_condition_model.dart';

class ForecastHourModel {
  //REVIEW -  this class contains all weather steate for custom hour

  //SECTION - variables
  int? lastUpdatedEpoch;
  String? lastUpdated;
  double? tempC;
  double? tempF;
  bool? isDay;
  WeatherConditionModel? condition;
  double? windMph;
  double? windKph;
  int? windDegree;
  String? windDir;
  double? pressureMb;
  double? pressureIn;
  int? humidity;
  int? cloud;

//SECTION - constractor
  ForecastHourModel({
    this.lastUpdatedEpoch,
    this.lastUpdated,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.humidity,
    this.cloud,
  });
  //SECTION -  factories
  ForecastHourModel.fromJson(Map<String, dynamic> json) {
    lastUpdatedEpoch = json['last_updated_epoch'] ?? json['time_epoch'];

    lastUpdated = json['last_updated'] ?? json['time'];
    tempC = json['temp_c'];
    tempF = json['temp_f'];
    isDay = json['is_day'] == 1;
    condition = json['condition'] != null
        ? WeatherConditionModel.fromJson(json['condition'])
        : null;
    windMph = json['wind_mph'];
    windKph = json['wind_kph'];
    windDegree = json['wind_degree'];
    windDir = json['wind_dir'];
    pressureMb = json['pressure_mb'];
    pressureIn = json['pressure_in'];

    humidity = json['humidity'];
    cloud = json['cloud'];
  }

//SECTION - methods
  static fromListOFHourJson(List<dynamic> json) {
    return json.map((e) => ForecastHourModel.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'last_updated_epoch': lastUpdatedEpoch,
      'last_updated': lastUpdated,
      'temp_c': tempC,
      'temp_f': tempF,
      'is_day': isDay,
      'condition': condition!.toJson(),
      'wind_mph': windMph,
      'wind_kph': windKph,
      'wind_degree': windDegree,
      'wind_dir': windDir,
      'pressure_mb': pressureMb,
      'pressure_in': pressureIn,
      'humidity': humidity,
      'cloud': cloud,
    };

    return data;
  }
}
