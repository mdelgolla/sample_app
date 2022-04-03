import 'package:flutter/material.dart';
import 'package:sample_app/styles/app_colors.dart';

extension AppTextStyles on TextTheme {
  TextStyle get titleTextStyle {
    return const TextStyle(
      fontSize: 25.0,
      color: AppColors.kPrimaryColor,
      fontWeight: FontWeight.bold,
    );
  }
  TextStyle get btnTextStyle {
    return const TextStyle(
      fontSize: 15.0,
      color: Colors.white,
      fontWeight: FontWeight.normal,
    );
  }
  TextStyle get categoryHeading {
    return const TextStyle(
      fontSize: 20.0,
      color: AppColors.grey,
      fontWeight: FontWeight.bold,
    );
  }
  TextStyle get normalTextStyle{
    return const TextStyle(
      fontSize: 15.0,
      color: AppColors.normalTextColor,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle get listTitle{
    return const TextStyle(
      fontSize: 20.0,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
  }
  TextStyle get listSubTitle{
    return const TextStyle(
      fontSize: 15.0,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
  }
}