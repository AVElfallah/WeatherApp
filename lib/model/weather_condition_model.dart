class WeatherConditionModel {
  String? text;
  String? icon;
  int? code;

  WeatherConditionModel({this.text, this.icon, this.code});

  WeatherConditionModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    icon = json['icon'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'text': text,
      'icon': icon,
      'code': code,
    };

    return data;
  }
}
