import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/config/color/colors.dart';
import 'package:im_chat_common_plugin/generated/locales.g.dart';
import 'package:im_chat_common_plugin/util/asset_util.dart';
import 'package:im_chat_common_plugin/util/constant.dart';
import 'package:im_chat_common_plugin/util/fonts.dart';
import 'package:im_chat_common_plugin/widget/form/multi_menu_item.dart';
import 'package:im_chat_resource_plugin/generated/assets.dart';

LinearGradient appbarGeneralGradient() {
  return LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      const Color(0xffCAD5F9),
      const Color(0xffF3F3F7),
    ],
    stops: [0, 1],
  );
}

LinearGradient generalLRGradient({isReverse = false, List<Color>? colors}) {
  return LinearGradient(
    begin: isReverse ? Alignment.centerRight : Alignment.centerLeft,
    end: isReverse ? Alignment.centerLeft : Alignment.centerRight,
    colors: colors ??
        [
          IMColors.primaryColor,
          IMColors.accentColor,
        ],
    stops: [0, 1],
  );
}

LinearGradient subGeneralLRGradient({isReverse = false, List<Color>? colors}) {
  return LinearGradient(
    begin: isReverse ? Alignment.centerRight : Alignment.centerLeft,
    end: isReverse ? Alignment.centerLeft : Alignment.centerRight,
    colors: colors ??
        [
          const Color(0xff4387F5),
          const Color(0xff66B1F9),
        ],
    stops: [0, 1],
  );
}

LinearGradient generalTBGradient({isReverse = false, List<Color>? colors}) {
  return LinearGradient(
    begin: isReverse ? Alignment.bottomCenter : Alignment.topCenter,
    end: isReverse ? Alignment.topCenter : Alignment.bottomCenter,
    colors: colors ??
        [
          IMColors.primaryColor,
          IMColors.accentColor,
        ],
    stops: [0, 1],
  );
}

Widget loadingIndicator({Color? color, double size = 60}) {
  return Container(
    width: size,
    height: size,
    padding: const EdgeInsets.all(1),
    child: Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(IMColors.primaryColor),
        strokeWidth: 2,
      ),
    ),
  );
}

Widget getDivider({
  bool visible = true,
  double? height = 0.5,
  double? thickness = 0.5,
  Color? color,
}) {
  return Visibility(
    visible: visible,
    child: Divider(
      height: height,
      thickness: thickness,
      color: color ?? IMColors.dividerColor,
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
      borderRadius: BorderRadius.circular(10),
      color: backgroundColor ?? Colors.white,
    ),
    child: GestureDetector(
      onTap: onTap,
      child: child,
    ),
  );
}

buildTextFormView(String title, MultiMenuItemType type,
    {bool enable = true,
      bool showDivider = false,
      double? height,
      EdgeInsetsGeometry? padding,
      Decoration? decoration,
      Function()? onTap,
      ValueChanged<String>? onChange,
      String? hintText,
      String? subTitle,
      TextStyle? titleStyle,
      TextStyle? subTitleStyle,
      TextStyle? hintTitleStyle,
      Widget? prefixWidget,
      Widget? suffixWidget,
      Widget? arrowWidget,
      double? spacing,
      TextInputType? keyboardType,
      List<TextInputFormatter>? inputFormatters,
      bool showCleanButton = false,
      TextAlign subTitleTextAlign = TextAlign.right,
      Axis direction = Axis.horizontal,
      bool showPwdText = false,
      TextEditingController? controller,
      double? dividerHeight,
      double? dividerThickness,
      Color? dividerColor,}) {
  return Column(
    children: [
      MultiMenuItem(
        type: type,
        height: height,
        direction: direction,
        hintText: hintText,
        title: title,
        titleStyle: titleStyle,
        enabled: enable,
        subTitle: subTitle,
        subTitleStyle: subTitleStyle,
        hintTextStyle: hintTitleStyle,
        spacing: spacing,
        padding: padding,
        decoration: decoration,
        onTap: onTap,
        subTitleTextAlign: subTitleTextAlign,
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
        onChanged: onChange,
        showCleanButton: showCleanButton,
        prefixWidget: prefixWidget,
        suffixWidget: suffixWidget,
        arrowWidget: arrowWidget,
        showPwdText: showPwdText,
        controller: controller,
      ),
      Visibility(
        visible: showDivider,
        child: getDivider(height: dividerHeight, thickness: dividerThickness, color: dividerColor),
      ),
    ],
  );
}

commonEmptyView({EdgeInsetsGeometry? margin, Decoration? decoration}){
  return Container(
    margin: margin,
    width: double.infinity,
    height: 111.h,
    decoration: decoration,
    child: Column(
      children: [
        AssetUtil.asset(Assets.commonIconCommonEmpty),
        SizedBox(height: 8.h),
        CommonText.instance(kCommonEmptyDes.tr, 14.sp, color: IMColors.hintTextColor)
      ],
    ),
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
  return PopupMenuItem(
    value: value,
    height: height ?? kMinInteractiveDimension,
    padding: EdgeInsets.zero,
    child: Container(
      height: height ?? kMinInteractiveDimension,
      padding: padding ?? EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: showDivider && !isLast
            ? Border(bottom: BorderSide(color: IMColors.dividerColor, width: 0.5))
            : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (image != null) ...[
            Image.asset(image,
                color: imageColor,
                width: 20,
                height: 20,
                package: resourcePackageName),
            const SizedBox(width: 12),
          ],
          CommonText.instance(
            title,
            14,
            color: value == currentValue
                ? IMColors.chooseTextColor
                : IMColors.normalTextColor,
          ),
        ],
      ),
    ),
  );
}
