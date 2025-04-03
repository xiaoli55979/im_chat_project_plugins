import 'package:flutter/material.dart';

// 字体样式定义
class MyFonts {
  // 金额显示字体
  static String amountFontFamily = "DINAlternate";

  // return the right font depending on app language
  static TextStyle get getAppFontType => const TextStyle();

  // headlines text font
  static TextStyle get displayTextStyle => getAppFontType;

  // body text font
  static TextStyle get bodyTextStyle => getAppFontType;

  // button text font
  static TextStyle get buttonTextStyle => getAppFontType;

  // app bar text font
  static TextStyle get appBarTextStyle => getAppFontType;

  // chips text font
  static TextStyle get chipTextStyle => getAppFontType;

  // appbar font size
  static double get appBarTittleSize => 16;

  // body font size
  static double get bodySmallTextSize => 11;

  static double get bodyMediumSize => 13; // default font
  static double get bodyLargeSize => 16;

  // display font size
  static double get displayLargeSize => 18;

  static double get displayMediumSize => 16;

  static double get displaySmallSize => 12;

  //button font size
  static double get buttonTextSize => 14;

  //chip font size
  static double get chipTextSize => 10;

  // list tile fonts sizes
  static double get listTileTitleSize => 16;

  static double get listTileSubtitleSize => 12;
}
