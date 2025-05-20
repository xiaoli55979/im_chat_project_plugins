import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/config/color/colors.dart';
import 'package:im_chat_common_plugin/util/app_values.dart';
import 'package:im_chat_common_plugin/util/asset_util.dart';
import 'package:im_chat_common_plugin/util/common_ui.dart';
import 'package:im_chat_common_plugin/util/fonts.dart';
import 'package:im_chat_common_plugin/widget/button/common_button.dart';
import 'package:im_chat_resource_plugin/generated/assets.dart';

abstract class OptionItem {
  String get title;
  
  String? get image;
}

class OptionSheet<T extends OptionItem> extends StatelessWidget {
  const OptionSheet(
    this.options, {
    super.key,
    this.initialValue,
    required this.title,
    required this.action,
  });

  final List<T> options;

  final T? initialValue;

  final String title;

  final void Function(T) action;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: safeAreaBottomDistance(20.h)),
      decoration: BoxDecoration(
        color: IMColors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.h), topRight: Radius.circular(15.h)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: CommonText.instance(title, 16.sp,
                    color: IMColors.cardTitleTextColor),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: CommonButton(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.w),
                  minSize: 0,
                  borderRadius: BorderRadius.zero,
                  onPressed: ()=> Navigator.pop(context),
                  child: AssetUtil.asset(Assets.commonIconClose, width: 30.w, height: 30.w, fit: BoxFit.cover),
                ),
              ),
            ],
          ),
          getDivider(),
          ...options
              .map(
                (option) => _optionView(
              item: option,
              isCurrentValue: option == initialValue,
              isLast: option == options.last,
              action: (option) {
                Navigator.pop(context);
                action(option);
              },
            ),
          ).toList()
        ]
      ),
    );
  }

  Widget _optionView(
      {required T item,
      required bool isCurrentValue,
      required bool isLast,
      required void Function(T) action}) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          child: CommonButton(
            minSize: 0,
            padding: EdgeInsets.zero,
            borderRadius: BorderRadius.zero,
            onPressed: () => action(item),
            child: Row(
              children: [
                if (item.image != null)
                  AssetUtil.asset(item.image!, width: 33.w, height: 33.w, fit: BoxFit.cover),
                SizedBox(width: 6.w),
                CommonText.instance(
                  item.title,
                  15.sp,
                  color: isCurrentValue ? IMColors.chooseTextColor : IMColors.normalTextColor,
                  fontWeight: CommonFontWeight.medium,
                ),
              ],
            ),
          ),
        ),
        isLast
            ? const SizedBox()
            : getDivider(),
      ],
    );
  }

  static void show<T extends OptionItem>(
    List<T> options, {
    T? initialValue,
    required String title,
    required void Function(T) action,
  }) {
    Get.bottomSheet(
        barrierColor: IMColors.black.withOpacity(0.3),
        OptionSheet(
          options,
          initialValue: initialValue,
          title: title,
          action: action,
        ),
        ignoreSafeArea: true);
  }
}
