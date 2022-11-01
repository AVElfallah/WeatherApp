import 'package:flutter/material.dart';
import 'package:weather_app/model/route_model.dart';
import 'package:weather_app/views/pages/home_page.dart';

class Routes {
  Map<String, Widget Function(BuildContext)> mapOFRoutes = {
    homePage.name!: (context) => homePage.page!,
  };
  static const RouteModel homePage = RouteModel(name: "/", page: HomePage());
}
