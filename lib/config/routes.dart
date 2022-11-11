import 'package:flutter/material.dart';
import 'package:weather_app/model/route_model.dart';
import 'package:weather_app/views/pages/home_page.dart';
import 'package:weather_app/views/pages/search_page.dart';
import 'package:weather_app/views/pages/splash_page_page.dart';

class Routes {
  //REVIEW - this is application routing system to make navgation more easer
  //SECTION -  map of application pages
  Map<String, Widget Function(BuildContext)> mapOFRoutes = {
    homePage.name!: (context) => homePage.page!,
    searchPage.name!: (context) => searchPage.page!,
    splashPage.name!: (context) => splashPage.page!,
  };

//SECTION - application routes
  static const RouteModel homePage =
      RouteModel(name: "/home", page: HomePage());
  static const RouteModel searchPage =
      RouteModel(name: "/search", page: SearchPage());
  static const RouteModel splashPage =
      RouteModel(name: '/splash', page: SplashPage());
}
