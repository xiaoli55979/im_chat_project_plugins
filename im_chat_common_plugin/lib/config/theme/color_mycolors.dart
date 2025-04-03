import 'package:flutter/material.dart';

abstract class MyColors {
  /// 主页账号余额底部背景图
  static Color mainAmountBgBtm = Color.fromRGBO(234, 128, 255, 0.10);

  /// 主题灰
  static const Color bgGrey = Color(0xffF7F7FA);

  /// 淡绿色
  static const Color bgGreen = Color(0xffeffaf1);

  /// 主题淡灰色  按钮延时
  static Color btnGrey = const Color(0xffd984f8);
  // static const Color btnGrey = Color(0xfff5f5fe);

  /// 渐变色低色值 EA80FF
  static Color bgldis = const Color(0xffEA80FF); //.withOpacity(0.9);

  /// 单粉色底色
  static Color bgpink = const Color(0xfffef2f2); //.withOpacity(0.9);

  /// 渐变色高 border-radius: 24px;
  // background: linear-gradient(275deg, #53F 3.84%, #EA80FF 100%);
  static const Color bghdis = Color(0xff5533FF); //.withOpacity(0.9);

  /// 渐变色低色值
  static const Color bgl = Color(0xffd984f8);

  /// 渐变色高
  static const Color bgh = Color(0xff5135f5);

  /// 主题蓝色
  static const Color themeblue = Color(0xff7b67f6);

  /// 主题黑色
  static const Color themeblack = Color(0xff202020);

  /// 主题白色
  static Color themewhite = Colors.white.withOpacity(0.8);

  /// 透明
  static Color transparentred = Color.fromRGBO(242, 73, 73, 0.10);
}
