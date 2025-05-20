import 'package:flutter/material.dart';
import 'package:im_chat_common_plugin/config/color/colors.dart';

class FontUtils {
  static const double contentTitleFontSize = 16;
  static const double contentSubFontSize = 14;
  static const double contentFontSize = 12;
}

extension CommonFontWeight on FontWeight {
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;
}

extension CommonTextStyle on TextStyle {
  static TextStyle instance(
      double fontSize, {
        Color? color,
        FontStyle? fontStyle,
        FontWeight fontWeight = CommonFontWeight.regular,
        TextDecoration? decoration,
        double? height,
        double? letterSpacing,
        TextBaseline? textBaseline,
        List<Shadow>? shadows,
      }) {
    return TextStyle(
      fontSize: fontSize,
      color: color ?? IMColors.normalTextColor,
      fontStyle: fontStyle,
      fontWeight: fontWeight,
      decoration: decoration,
      height: height,
      letterSpacing: letterSpacing,
      shadows: shadows,
      textBaseline: textBaseline,
    );
  }
}

extension CommonText on Text {
  static Text instance(
      String text,
      double fontSize, {
        Color? color,
        bool isTitle = false,
        FontStyle? fontStyle,
        FontWeight fontWeight = CommonFontWeight.regular,
        int? maxLines,
        TextOverflow? overflow,
        TextAlign? textAlign,
        double? height,
        double? letterSpacing,
        List<Shadow>? shadows,
        StrutStyle? strutStyle,
        TextBaseline? textBaseline,
      }) {
    return Text(
      text,
      maxLines: maxLines,
      strutStyle: strutStyle,
      style: CommonTextStyle.instance(
        fontSize,
        color: color ?? IMColors.normalTextColor,
        fontStyle: fontStyle,
        fontWeight: fontWeight,
        height: height,
        letterSpacing: letterSpacing,
        shadows: shadows,
        textBaseline: textBaseline,
      ),
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}
