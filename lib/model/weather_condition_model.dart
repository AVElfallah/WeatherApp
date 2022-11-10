class WeatherConditionModel {
  //REVIEW - this model created to save weather condation
  //SECTION - variables
  String? text;
  String? icon;
  int? code;

//SECTION - constractor
  WeatherConditionModel({this.text, this.icon, this.code});

//SECTION - factories
  WeatherConditionModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    icon = json['icon'];
    code = json['code'];
  }
//SECTION -  methods
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'text': text,
      'icon': icon,
      'code': code,
    };

    return data;
  }
}
