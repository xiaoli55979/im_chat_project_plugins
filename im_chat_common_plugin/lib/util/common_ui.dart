import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:im_chat_common_plugin/config/theme/dark_theme_colors.dart';
import 'package:im_chat_common_plugin/config/theme/light_theme_colors.dart';
import 'package:im_chat_common_plugin/tools/my_shared_pref.dart';
import 'package:im_chat_common_plugin/util/constant.dart';
import 'package:im_chat_common_plugin/util/fonts.dart';
import 'package:im_chat_common_plugin/widget/form/custom_menu_item.dart';

Widget loadingIndicator({Color? color, double size = 60}) {
  final effectiveColor = color ?? (MySharedPref.getThemeIsLight() ? LightThemeColors.primaryColor : DarkThemeColors.primaryColor);
  return Container(
    width: size,
    height: size,
    padding: const EdgeInsets.all(1),
    child: Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(effectiveColor),
        strokeWidth: 2,
      ),
    ),
  );
}

getDivider({
  bool visible = true,
  double? height = 0.5,
  double? thickness,
  Color? color,
}) {
  return Visibility(
    visible: visible,
    child: Divider(
      height: height,
      thickness: thickness,
      color: color ?? (MySharedPref.getThemeIsLight() ? LightThemeColors.dividerColor : DarkThemeColors.dividerColor),
    ),
  );
}

radiusView(
    {required Widget child,
    Color? backgroundColor,
    double? minHeight,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    GestureTapCallback? onTap}) {
  return Container(
    constraints: minHeight == null
        ? null
        : BoxConstraints(
            minHeight: minHeight,
          ),
    margin: margin ?? EdgeInsets.only(left: 12.w, top: 15.h, right: 12.w, bottom: 15.h),
    padding: padding ?? EdgeInsets.only(left: 12.w, top: 8.h, right: 12.w, bottom: 8.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: backgroundColor ?? Colors.white,
    ),
    child: GestureDetector(
      onTap: onTap,
      child: child,
    ),
  );
}

buildTextFormView(String title, CustomMenuItemType type,
    {bool enable = true,
    bool showDivider = false,
    EdgeInsetsGeometry? padding,
    Function()? onTap,
    ValueChanged<String>? onChange,
    String? hintText,
    String? subTitle,
    TextStyle? titleStyle,
    TextStyle? subTitleStyle,
    TextStyle? hintTitleStyle,
    Widget? suffixWidget,
    Widget? arrowWidget,
    double? spacing,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    bool showCleanButton = false,
    TextAlign subTitleTextAlign = TextAlign.right}) {
  return Column(
    children: [
      CustomMenuItem(
        key: UniqueKey(),
        hintText: hintText,
        title: title,
        titleStyle: titleStyle,
        enabled: enable,
        subTitle: subTitle,
        subTitleStyle: subTitleStyle,
        hintTextStyle: hintTitleStyle,
        spacing: spacing,
        padding: padding ?? EdgeInsets.symmetric(vertical: 16.h),
        onTap: onTap,
        subTitleTextAlign: subTitleTextAlign,
        inputFormatters: inputFormatters,
        onChanged: onChange,
        showCleanButton: showCleanButton,
        type: type,
        suffixWidget: suffixWidget,
        arrowWidget: arrowWidget,
      ),
      Visibility(
        visible: showDivider,
        child: getDivider(),
      ),
    ],
  );
}

PopupMenuItem<T> popupMenuItem<T>({
  required T value,
  required String title,
  double? height,
  EdgeInsetsGeometry? padding,
  T? currentValue,
  String? image,
  Color? imageColor,
  bool showDivider = false,
  bool isLast = false,
}) {
  final chooseTextColor = MySharedPref.getThemeIsLight() ? LightThemeColors.primaryColor : DarkThemeColors.primaryColor;
  final textColor = MySharedPref.getThemeIsLight() ? LightThemeColors.bodyTextColor : DarkThemeColors.bodyTextColor;
  final dividerColor = MySharedPref.getThemeIsLight() ? LightThemeColors.dividerColor : DarkThemeColors.dividerColor;
  return PopupMenuItem(
    value: value,
    height: height ?? kMinInteractiveDimension,
    padding: EdgeInsets.zero,
    child: Container(
      height: height ?? kMinInteractiveDimension,
      padding: padding ?? EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: showDivider && !isLast
            ? Border(bottom: BorderSide(color: dividerColor, width: 0.5))
            : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (image != null)
            ...[
              Image.asset(image, package: resourcePackageName, color: imageColor, width: 20, height: 20),
              const SizedBox(width: 12),
            ],
          CommonText.instance(
            title,
            14,
            color: value == currentValue
                ? chooseTextColor
                : textColor,
          ),
        ],
      ),
    ),
  );
}
