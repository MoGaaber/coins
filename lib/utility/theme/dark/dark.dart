import 'package:flutter/material.dart';
import 'package:usatolebanese/utility/theme/dark/utitlity.dart';

class DarkTheme {
  double aspectRatio;
  DarkThemeUtility darkThemeUtility;
  ThemeData themeData;
  DarkTheme(this.aspectRatio) {
    darkThemeUtility = DarkThemeUtility(aspectRatio);
    themeData = ThemeData(
        fontFamily: darkThemeUtility.fontFamily,
        iconTheme: darkThemeUtility.iconThemeData,
        floatingActionButtonTheme:
            darkThemeUtility.floatingActionButtonThemeData,
        scaffoldBackgroundColor: darkThemeUtility.scaffoldColor,
        textTheme: darkThemeUtility.textTheme,
        appBarTheme: darkThemeUtility.appBarTheme);
  }
}
