import 'package:flutter/material.dart';
class ScreenUtils {
  static Size? screenSize;
  static MediaQueryData? mqData;
  static double containerBoxHeight = 410.0;

  static double topBarHeight = 152;
  static double bottomBarHeight = 95;

  static double get safeArea => mqData != null ? mqData!.padding.top : 0;
  static Size? get size => screenSize;
  static double get height => size!.height;
  static double get width => size!.width;
}