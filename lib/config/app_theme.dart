import 'package:flutter/material.dart';
import 'package:weather_app/colors/colors.dart';

class ApplicationTheme {
  ///Light
  static final ThemeData ligtTheme = ThemeData(
    primaryColor: Colors.blue,
    iconTheme: const IconThemeData(color: Colors.white),
    scaffoldBackgroundColor: Colors.cyan.shade100,
    primarySwatch: Colors.blue,
    secondaryHeaderColor: Colors.white,
    shadowColor: Colors.black,
    highlightColor: Colors.blue.shade200,
    appBarTheme: AppBarTheme(
      color: Colors.cyan.shade400,
      foregroundColor: Colors.white,
    ),
    splashColor: Colors.black,
    cardColor: Colors.cyan.shade500,
    chipTheme: ChipThemeData(
      selectedColor: Colors.yellow.shade300,
      disabledColor: Colors.blue.shade200,
      labelStyle: const TextStyle(color: Colors.black),
    ),
  );

  ///Dark
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: ProjectColors.purpleLight,
    iconTheme: const IconThemeData(color: Colors.white),
    scaffoldBackgroundColor: ProjectColors.purple,
    primarySwatch: Colors.purple,
    secondaryHeaderColor: Colors.black,
    shadowColor: Colors.black,
    splashColor: Colors.white,
    highlightColor: ProjectColors.purpleLight,
    appBarTheme: const AppBarTheme(
      color: ProjectColors.purple,
      foregroundColor: Colors.white,
    ),
    cardColor: ProjectColors.purpleLight,
    canvasColor: Colors.white,
    chipTheme: const ChipThemeData(
      selectedColor: ProjectColors.orange,
      disabledColor: ProjectColors.purpleLight,
      labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    ),
  );
}
