import 'package:flutter/material.dart';
import 'package:weather_app/model/location_model.dart';

import '../config/routes.dart';
import '../config/context_extention.dart';
import '../repository/outsource/weather_repo.dart';

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

  void openSearchResult(
      BuildContext context, LocationModel locationModel) async {
    final instance = WeatherRepository.instance;
    var backMap = await instance.getTodayForecast(
      locationModel.name,
      context.readAppCtrl.appLanguage.languageCode,
    );
    // ignore: use_build_context_synchronously
    Navigator.pushNamed(
      context,
      Routes.weatherResultPage.name!,
      arguments: backMap,
    );
  }
}
