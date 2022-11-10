import 'package:flutter/cupertino.dart';

class RouteModel {
  //REVIEW - this is route model to make application routing more easer
  //SECTION - constractor
  const RouteModel({this.name, this.page});

  //SECTION - variables
  final String? name;
  final Widget? page;
}
