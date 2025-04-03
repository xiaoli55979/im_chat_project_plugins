import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../tools/font_utils.dart';
import 'dark_theme_colors.dart';
import 'light_theme_colors.dart';
import 'my_styles.dart';

/// 主题对象构建
class MyTheme {
  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }

  static getThemeData({required bool isLight}) {
    return ThemeData(
        useMaterial3: false,
        // main color (app bar,tabs..etc)
        primaryColor: isLight ? LightThemeColors.primaryColor : DarkThemeColors.primaryColor,

        // secondary & background color
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: createMaterialColor(isLight ? LightThemeColors.primaryColor : DarkThemeColors.primaryColor),
          accentColor: isLight ? LightThemeColors.accentColor : DarkThemeColors.accentColor,
          backgroundColor: isLight ? LightThemeColors.backgroundColor : DarkThemeColors.backgroundColor,
          brightness: isLight ? Brightness.light : Brightness.dark,
        ).copyWith(
          secondary: isLight ? LightThemeColors.accentColor : DarkThemeColors.accentColor,
        ),

        // color contrast (if the theme is dark text should be white for example)
        brightness: isLight ? Brightness.light : Brightness.dark,

        // card widget background color
        cardColor: isLight ? LightThemeColors.cardColor : DarkThemeColors.cardColor,

        // hint text color
        hintColor: isLight ? LightThemeColors.hintTextColor : DarkThemeColors.hintTextColor,

        // divider color
        dividerColor: isLight ? LightThemeColors.dividerColor : DarkThemeColors.dividerColor,

        // app background color
        scaffoldBackgroundColor: isLight ? LightThemeColors.scaffoldBackgroundColor : DarkThemeColors.scaffoldBackgroundColor,

        // progress bar theme
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: isLight ? LightThemeColors.primaryColor : DarkThemeColors.primaryColor,
        ),

        // appBar theme
        appBarTheme: MyStyles.getAppBarTheme(isLightTheme: isLight),
        tabBarTheme: MyStyles.getTabBarTheme(isLightTheme: isLight),

        // elevated button theme
        elevatedButtonTheme: MyStyles.getElevatedButtonTheme(isLightTheme: isLight),

        // text theme
        textTheme: MyStyles.getTextTheme(isLightTheme: isLight),

        // chip theme
        chipTheme: MyStyles.getChipTheme(isLightTheme: isLight),

        // icon theme
        iconTheme: MyStyles.getIconTheme(isLightTheme: isLight),

        // input
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1)),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: LightThemeColors.primaryColor, width: 1)),
          hintStyle: TextStyle(fontSize: FontUtils.contentTitleFontSize),
          errorStyle: TextStyle(
            fontSize: FontUtils.contentFontSize,
          ),
        ),

        // list tile theme
        listTileTheme: MyStyles.getListTileThemeData(isLightTheme: isLight),
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
                side:
                    MaterialStateProperty.all(BorderSide(color: isLight ? LightThemeColors.primaryColor : DarkThemeColors.primaryColor)))),

        // custom themes
        extensions: []);
  }

  /// update app theme and save theme type to shared pref
  /// (so when the app is killed and up again theme will remain the same)
  static changeTheme() {
    // *) check if the current theme is light (default is light)
    bool isLightTheme = true; //MySharedPref.getThemeIsLight();

    // // *) store the new theme mode on get storage
    // MySharedPref.setThemeIsLight(!isLightTheme);

    // *) let GetX change theme
    Get.changeThemeMode(!isLightTheme ? ThemeMode.light : ThemeMode.dark);
  }

  /// check if the theme is light or dark
  bool get getThemeIsLight => true;
}
