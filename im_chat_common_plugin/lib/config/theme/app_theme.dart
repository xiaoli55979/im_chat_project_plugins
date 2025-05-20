import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/config/color/colors.dart';


/// 主题对象构建
class AppTheme {
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
        primaryColor: IMColors.primaryColor,

        // secondary & background color
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: createMaterialColor(IMColors.primaryColor),
          accentColor: IMColors.accentColor,
          backgroundColor: IMColors.background,
          brightness: isLight ? Brightness.light : Brightness.dark,
        ).copyWith(
          secondary: IMColors.accentColor,
        ),

        // color contrast (if the theme is dark text should be white for example)
        brightness: isLight ? Brightness.light : Brightness.dark,

        // card widget background color
        cardColor: IMColors.cardColor,

        // hint text color
        hintColor: IMColors.hintTextColor,

        // divider color
        dividerColor: IMColors.dividerColor,

        // app background color
        scaffoldBackgroundColor: IMColors.background,

        // progress bar theme
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: IMColors.primaryColor,
        ),

        // appBar theme
        appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: IMColors.appBarIconsColor),
          backgroundColor: IMColors.appBarColor,
          systemOverlayStyle: getNormalSystemOverlayStyle(isLight), // 设置状态栏颜
        ),
    );
  }

  static getNormalSystemOverlayStyle(bool isLight){
    return SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: isLight ? Brightness.light : Brightness.dark,
      statusBarIconBrightness: GetPlatform.isAndroid ? (isLight ? Brightness.dark : Brightness.light) : Brightness.light,
    );
  }

  static getHomeSystemOverlayStyle(bool isLight){
    return SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: isLight ? Brightness.light : Brightness.dark,
      statusBarIconBrightness: GetPlatform.isAndroid ? (isLight ? Brightness.light : Brightness.dark) : Brightness.light,
    );
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
