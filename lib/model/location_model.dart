class LocationModel {
  LocationModel({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
  });
  late final String name;
  late final String region;
  late final String country;
  late final double lat;
  late final double lon;

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      name: json['name'],
      region: json['region'],
      country: json['country'],
      lat: json['lat'],
      lon: json['lon'],
    );
  }

  Map<String, dynamic> toJson() {
    // ignore: no_leading_underscores_for_local_identifiers
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['region'] = region;
    _data['country'] = country;
    _data['lat'] = lat;
    _data['lon'] = lon;

    return _data;
  }
}
