import 'package:flutter/material.dart';
import 'package:im_chat_common_plugin/config/color/dark_theme_colors.dart';
import 'package:im_chat_common_plugin/config/color/light_theme_colors.dart';
import 'package:im_chat_common_plugin/util/storage.dart';

class IMColors {
  // PRIMARY
  static Color get primaryColor => Storage.getIsLightTheme() ? LightThemeColors.primaryColor : DarkThemeColors.primaryColor;
  static Color get accentColor => Storage.getIsLightTheme() ? LightThemeColors.accentColor : DarkThemeColors.accentColor;

  static Color get white => Storage.getIsLightTheme() ? LightThemeColors.white : DarkThemeColors.white;

  static Color get black => Storage.getIsLightTheme() ? LightThemeColors.black : DarkThemeColors.black;

  static Color get background => Storage.getIsLightTheme() ? LightThemeColors.background : DarkThemeColors.background;

  static Color get dividerColor => Storage.getIsLightTheme() ? LightThemeColors.dividerColor : DarkThemeColors.dividerColor;

  static Color get cardColor => Storage.getIsLightTheme() ? LightThemeColors.cardColor : DarkThemeColors.cardColor;

  /// app_bar
  static Color get appBarColor => Storage.getIsLightTheme() ? LightThemeColors.appBarColor : DarkThemeColors.appBarColor;
  static Color get appBarIconsColor => Storage.getIsLightTheme() ? LightThemeColors.appBarIconsColor : DarkThemeColors.appBarIconsColor;
  static Color get appBarTextColor => Storage.getIsLightTheme() ? LightThemeColors.appBarTextColor : DarkThemeColors.appBarTextColor;

  // BUTTON
  static Color get buttonColor => Storage.getIsLightTheme() ? LightThemeColors.buttonColor : DarkThemeColors.buttonColor;
  static Color get buttonTextColor => Storage.getIsLightTheme() ? LightThemeColors.buttonTextColor : DarkThemeColors.buttonTextColor;
  static Color get buttonDisabledColor => Storage.getIsLightTheme() ? LightThemeColors.buttonDisabledColor : DarkThemeColors.buttonDisabledColor;
  static Color get buttonDisabledTextColor => Storage.getIsLightTheme() ? LightThemeColors.buttonDisabledTextColor : DarkThemeColors.buttonDisabledTextColor;

  //tab
  static Color get tabTextUnSelectedColor => Storage.getIsLightTheme() ? LightThemeColors.tabTextUnSelectedColor : DarkThemeColors.tabTextUnSelectedColor;

  // TEXT
  static Color get normalTextColor => Storage.getIsLightTheme() ? LightThemeColors.normalTextColor : DarkThemeColors.normalTextColor;
  static Color get subTextColor => Storage.getIsLightTheme() ? LightThemeColors.subTextColor : DarkThemeColors.subTextColor;
  static Color get chooseTextColor => Storage.getIsLightTheme() ? LightThemeColors.chooseTextColor : DarkThemeColors.chooseTextColor;
  static Color get hintTextColor => Storage.getIsLightTheme() ? LightThemeColors.hintTextColor : DarkThemeColors.hintTextColor;

  static Color get cardTitleTextColor => Storage.getIsLightTheme() ? LightThemeColors.cardTitleTextColor : DarkThemeColors.cardTitleTextColor;

  static Color get reminderColor => Storage.getIsLightTheme() ? LightThemeColors.reminderColor : DarkThemeColors.reminderColor;

  static Color get visitorColor => Storage.getIsLightTheme() ? LightThemeColors.visitorColor : DarkThemeColors.visitorColor;

  static const colorA2ACFF = Color(0xFFA2ACFF);

  static const colorF5F8FC = Color(0xFFF5F8FC);

  static const color454D59 = Color(0xFF454D59);

  static const colorADB5C2 = Color(0xFFADB5C2);

  static const color575B66 = Color(0xFF575B66);

  static const colorF8F8F8 = Color(0xFFF8F8F8);

  static const colorF67F2A = Color(0xFFF67F2A);

  static const color2FBC63 = Color(0xff2FBC63);

  static const color1678FF = Color(0xFF1678FF);

  static const colorDFE9FD = Color(0xFFDFE9FD);

  static const color2F5EF7 = Color(0xFF2F5EF7);

  static const colorEDEDED = Color(0xFFEDEDED);

  static const colorEFEFEF = Color(0xFFEFEFEF);

  static const colorF80202 = Color(0xFFF80202);

  static const colorFFDADA = Color(0xFFFFDADA);

}
