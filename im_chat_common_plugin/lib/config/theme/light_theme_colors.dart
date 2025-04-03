import 'package:flutter/material.dart';

/// 主题颜色配置
class LightThemeColors {
  // PRIMARY
  static Color get primaryColor {
    // if (ToolsUtils.instance.isJtp) {
    //   return const Color(0xFF144eee);
    // } else {
    //   return const Color(0xff7b67f6);
    // }
    return const Color(0xff1593b9);
  }

  /// 聊天我的背景色
  static const Color chatMyColor = Color(0xFFa9e97a);

  // SECONDARY COLOR
  static const Color accentColor = Color(0xFFD9EDE1);

  // APPBAR
  static const Color appBarColor = Color(0xFFf1f4f9);

  // SCAFFOLD
  static const Color scaffoldBackgroundColor = Color(0xFFf1f4f9);
  static const Color backgroundColor = Color(0xFFf1f4f9);
  static const Color dividerColor = Color(0xFFc0c0c0);
  static const Color cardColor = Color(0xfffafafa);

  // ICONS
  static const Color appBarIconsColor = Color(0xFF1a242e);
  static const Color appBarTextColor = Color(0xFF1a242e);
  static const Color iconColor = Colors.black;

  // BUTTON
  static Color get buttonColor => primaryColor;
  static const Color buttonTextColor = Colors.white;
  static const Color buttonDisabledColor = Colors.grey;
  static const Color buttonDisabledTextColor = Colors.black;

  // TEXT
  static const Color bodyTextColor = Colors.black;
  static const Color displayTextColor = Color(0xFF000000);

  // 0xFF1E2432 3a3d44
  static const Color bodySmallTextColor = Color(0xff7C7C7C);
  static const Color hintTextColor = Color(0xff686868);

  // CHIP
  static Color get chipBackground => primaryColor;
  static const Color chipTextColor = Colors.white;

  // PROGRESS BAR INDICATOR
  static const Color progressIndicatorColor = Color(0xFF40A76A);

  // LIST TILE
  static const Color listTileTitleColor = Color(0xFF575757);
  static const Color listTileSubtitleColor = Color(0xFF575757);
  static const Color listTileBackgroundColor = Color(0xFFF8F8F8);
  static const Color listTileIconColor = Color(0xFF575757);
}
