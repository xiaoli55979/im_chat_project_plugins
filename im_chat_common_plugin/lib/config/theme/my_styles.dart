import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../tools/tools_utils.dart';
import 'dark_theme_colors.dart';
import 'light_theme_colors.dart';
import 'my_fonts.dart';

/// 定义统一的间距变量
const double htmlSpacing = 1.0;

class MyStyles {
  /// 圆角
  static BorderRadius getBorderRadius = BorderRadius.circular(5.r);

  /// 字体大小
  static FontSize htmlFontSize({double? size}) {
    double fontsize = 15.75;
    if (size != null) {}
    if (ToolsUtils.getIsPad()) {
      fontsize = fontsize + 2.25;
    }
    return FontSize(fontsize);
  }

  /// Html标签样式
  static Map<String, Style> htmlStyleList = <String, Style>{
    "html": Style(
      padding: HtmlPaddings.all(htmlSpacing), // 使用统一变量设置内边距
      margin: Margins.all(htmlSpacing), // 使用统一变量设置外边距
      fontSize: htmlFontSize(),
    ),
    "body": Style(
      padding: HtmlPaddings.all(htmlSpacing),
      margin: Margins.all(htmlSpacing),
      fontSize: htmlFontSize(),
    ),
    "p": Style(
      margin: Margins.all(htmlSpacing), // 段落的外边距
      padding: HtmlPaddings.all(htmlSpacing), // 段落的内边距
      fontSize: htmlFontSize(),
    ),
    "a": Style(
      margin: Margins.all(htmlSpacing),
      padding: HtmlPaddings.all(htmlSpacing),
      fontSize: htmlFontSize(),
    ),
    "img": Style(
      margin: Margins.all(htmlSpacing),
      padding: HtmlPaddings.all(htmlSpacing),
      fontSize: htmlFontSize(),
    ),
    "ul": Style(
      margin: Margins.all(htmlSpacing),
      padding: HtmlPaddings.all(htmlSpacing),
      fontSize: htmlFontSize(),
    ),
    "ol": Style(
      margin: Margins.all(htmlSpacing),
      padding: HtmlPaddings.all(htmlSpacing),
      fontSize: htmlFontSize(),
    ),
    "li": Style(
      margin: Margins.all(htmlSpacing),
      padding: HtmlPaddings.all(htmlSpacing),
      fontSize: htmlFontSize(),
    ),
    "table": Style(
      margin: Margins.all(htmlSpacing),
      padding: HtmlPaddings.all(htmlSpacing),
      fontSize: htmlFontSize(),
    ),
    "tr": Style(
      margin: Margins.all(htmlSpacing),
      padding: HtmlPaddings.all(htmlSpacing),
      fontSize: htmlFontSize(),
    ),
    "td": Style(
      margin: Margins.all(htmlSpacing),
      padding: HtmlPaddings.all(htmlSpacing),
      fontSize: htmlFontSize(),
    ),
    "span": Style(
      margin: Margins.all(htmlSpacing),
      padding: HtmlPaddings.all(htmlSpacing),
      fontSize: htmlFontSize(),
    ),
    "h1": Style(
      margin: Margins.all(htmlSpacing),
      padding: HtmlPaddings.all(htmlSpacing),
      fontSize: htmlFontSize(size: 16),
    ),
    "h2": Style(
      margin: Margins.all(htmlSpacing),
      padding: HtmlPaddings.all(htmlSpacing),
      fontSize: htmlFontSize(size: 18),
    ),
    "h3": Style(
      margin: Margins.all(htmlSpacing),
      padding: HtmlPaddings.all(htmlSpacing),
      fontSize: htmlFontSize(size: 20),
    ),
    "h4": Style(
      margin: Margins.all(htmlSpacing),
      padding: HtmlPaddings.all(htmlSpacing),
      fontSize: htmlFontSize(size: 22),
    ),
    "h5": Style(
      margin: Margins.all(htmlSpacing),
      padding: HtmlPaddings.all(htmlSpacing),
      fontSize: htmlFontSize(size: 24),
    ),
    "h6": Style(
      margin: Margins.all(htmlSpacing),
      padding: HtmlPaddings.all(htmlSpacing),
      fontSize: htmlFontSize(size: 26),
    ),
  };

  ///icons theme
  static IconThemeData getIconTheme({required bool isLightTheme}) => IconThemeData(
        color: isLightTheme ? LightThemeColors.iconColor : DarkThemeColors.iconColor,
      );

  /// InputDecorationTheme
  static TabBarTheme getTabBarTheme({required bool isLightTheme}) {
    return TabBarTheme(
      labelColor: LightThemeColors.primaryColor,
      unselectedLabelColor: LightThemeColors.displayTextColor,
      dividerColor: LightThemeColors.displayTextColor,
      indicatorColor: LightThemeColors.primaryColor,
    );
  }

  ///app bar theme
  static AppBarTheme getAppBarTheme({required bool isLightTheme}) => AppBarTheme(
        elevation: 0,
        //toolbarHeight: 42,
        titleTextStyle: getTextTheme(isLightTheme: isLightTheme).bodyMedium!.copyWith(
              color: LightThemeColors.appBarTextColor,
              fontSize: MyFonts.appBarTittleSize,
              fontWeight: FontWeight.w600,
            ),
        iconTheme: IconThemeData(color: isLightTheme ? LightThemeColors.appBarIconsColor : DarkThemeColors.appBarIconsColor),
        backgroundColor: isLightTheme ? LightThemeColors.appBarColor : DarkThemeColors.appbarColor,
      );

  ///text theme
  static TextTheme getTextTheme({required bool isLightTheme}) => TextTheme(
        labelLarge: MyFonts.buttonTextStyle.copyWith(
          fontSize: MyFonts.buttonTextSize,
        ),
        bodyLarge: (MyFonts.bodyTextStyle).copyWith(
          fontWeight: FontWeight.bold,
          fontSize: MyFonts.bodyLargeSize,
          color: isLightTheme ? LightThemeColors.bodyTextColor : DarkThemeColors.bodyTextColor,
        ),
        bodyMedium: (MyFonts.bodyTextStyle).copyWith(
          fontSize: MyFonts.bodyMediumSize,
          color: isLightTheme ? LightThemeColors.bodyTextColor : DarkThemeColors.bodyTextColor,
        ),
        displayLarge: (MyFonts.displayTextStyle).copyWith(
          fontSize: MyFonts.displayLargeSize,
          fontWeight: FontWeight.bold,
          color: isLightTheme ? LightThemeColors.displayTextColor : DarkThemeColors.displayTextColor,
        ),
        bodySmall: TextStyle(
            color: isLightTheme ? LightThemeColors.bodySmallTextColor : DarkThemeColors.bodySmallTextColor,
            fontSize: MyFonts.bodySmallTextSize),
        displayMedium: (MyFonts.displayTextStyle).copyWith(
            fontSize: MyFonts.displayMediumSize,
            fontWeight: FontWeight.bold,
            color: isLightTheme ? LightThemeColors.displayTextColor : DarkThemeColors.displayTextColor),
        displaySmall: (MyFonts.displayTextStyle).copyWith(
          fontSize: MyFonts.displaySmallSize,
          fontWeight: FontWeight.bold,
          color: isLightTheme ? LightThemeColors.displayTextColor : DarkThemeColors.displayTextColor,
        ),
      );

  static ChipThemeData getChipTheme({required bool isLightTheme}) {
    return ChipThemeData(
      backgroundColor: isLightTheme ? LightThemeColors.chipBackground : DarkThemeColors.chipBackground,
      brightness: Brightness.light,
      labelStyle: getChipTextStyle(isLightTheme: isLightTheme),
      secondaryLabelStyle: getChipTextStyle(isLightTheme: isLightTheme),
      selectedColor: Colors.black,
      disabledColor: Colors.green,
      padding: const EdgeInsets.all(5),
      secondarySelectedColor: Colors.purple,
    );
  }

  ///Chips text style
  static TextStyle getChipTextStyle({required bool isLightTheme}) {
    return MyFonts.chipTextStyle.copyWith(
      fontSize: MyFonts.chipTextSize,
      color: isLightTheme ? LightThemeColors.chipTextColor : DarkThemeColors.chipTextColor,
    );
  }

  // elevated button text style
  static MaterialStateProperty<TextStyle?>? getElevatedButtonTextStyle(bool isLightTheme, {bool isBold = true, double? fontSize}) {
    return MaterialStateProperty.resolveWith<TextStyle>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) {
          return MyFonts.buttonTextStyle.copyWith(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            fontSize: fontSize ?? MyFonts.buttonTextSize,
            color: isLightTheme ? LightThemeColors.buttonTextColor : DarkThemeColors.buttonTextColor,
          );
        } else if (states.contains(MaterialState.disabled)) {
          return MyFonts.buttonTextStyle.copyWith(
            fontSize: fontSize ?? MyFonts.buttonTextSize,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: isLightTheme ? LightThemeColors.buttonDisabledTextColor : DarkThemeColors.buttonDisabledTextColor,
          );
        }
        return MyFonts.buttonTextStyle.copyWith(
          fontSize: fontSize ?? MyFonts.buttonTextSize,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          color: isLightTheme ? LightThemeColors.buttonTextColor : DarkThemeColors.buttonTextColor,
        ); // Use the component's default.
      },
    );
  }

  //elevated button theme data
  static ElevatedButtonThemeData getElevatedButtonTheme({required bool isLightTheme}) => ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.r),
              //side: BorderSide(color: Colors.teal, width: 2.0),
            ),
          ),
          elevation: MaterialStateProperty.all(0),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 8.h)),
          textStyle: getElevatedButtonTextStyle(isLightTheme),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return isLightTheme ? LightThemeColors.buttonColor.withOpacity(0.5) : DarkThemeColors.buttonColor.withOpacity(0.5);
              } else if (states.contains(MaterialState.disabled)) {
                return isLightTheme ? LightThemeColors.buttonDisabledColor : DarkThemeColors.buttonDisabledColor;
              }
              return isLightTheme ? LightThemeColors.buttonColor : DarkThemeColors.buttonColor; // Use the component's default.
            },
          ),
        ),
      );

  /// list tile theme data
  static ListTileThemeData getListTileThemeData({required bool isLightTheme}) {
    return ListTileThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
      ),
      iconColor: isLightTheme ? LightThemeColors.listTileIconColor : DarkThemeColors.listTileIconColor,
      tileColor: isLightTheme ? LightThemeColors.listTileBackgroundColor : DarkThemeColors.listTileBackgroundColor,
      titleTextStyle: TextStyle(
        fontSize: MyFonts.listTileTitleSize,
        color: isLightTheme ? LightThemeColors.listTileTitleColor : DarkThemeColors.listTileTitleColor,
      ),
      subtitleTextStyle: TextStyle(
        fontSize: MyFonts.listTileSubtitleSize,
        color: isLightTheme ? LightThemeColors.listTileSubtitleColor : DarkThemeColors.listTileSubtitleColor,
      ),
    );
  }
}
