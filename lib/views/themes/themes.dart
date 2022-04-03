import 'package:flutter/material.dart';
import 'package:sample_app/styles/app_colors.dart';

enum AppTheme {
  lightAppTheme,
  darkAppTheme,
}

final appThemeData = {
  AppTheme.darkAppTheme: ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: AppColors.kPrimaryColor,
    textTheme: TextTheme(
      headline3: TextStyle().copyWith(color: Colors.white),

    ),
  ),
  AppTheme.lightAppTheme: ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),
    primaryColor: AppColors.kPrimaryColor,
    textTheme: TextTheme(
      headline3: TextStyle().copyWith(color: Colors.black),
    ),
  ),
};