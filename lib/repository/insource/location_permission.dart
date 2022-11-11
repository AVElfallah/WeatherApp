import 'package:location/location.dart';

class LocationPermissionRepo {
  LocationPermissionRepo._();
  static final _instance = LocationPermissionRepo._();
  static LocationPermissionRepo get instance => _instance;
  Future<PermissionStatus> getLocationPermission() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {}
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return permissionGranted;
      }
    }
    return permissionGranted;
  }
}
