import 'package:flutter/material.dart';
import 'package:weather_app/model/location_model.dart';
import 'package:weather_app/repository/outsource/weather_repo.dart';

class SearchController extends ChangeNotifier {
  TextEditingController txtController = TextEditingController();
  bool isSearchButtonClicked = false;
  List<LocationModel> searchResult = [];
  clickSearchButton() {
    isSearchButtonClicked = !isSearchButtonClicked;
    notifyListeners();
  }

  search() async {
    searchResult = await WeatherRepository.instance.search(txtController.text);
    notifyListeners();
  }
}
