import 'dart:async';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:im_chat_common_plugin/config/theme/dark_theme_colors.dart';
import 'package:im_chat_common_plugin/config/theme/light_theme_colors.dart';
import 'package:im_chat_common_plugin/tools/my_shared_pref.dart';

class CommonRefresh {
  static EasyRefresh instance({
    Key? key,
    double triggerOffset = 75,
    required Widget child,
    bool hasMore = false,
    bool hasBefore = true,
    Axis? triggerAxis = Axis.vertical,
    FutureOr Function()? onRefresh,
    FutureOr Function()? onLoad,
    EasyRefreshController? controller,
    ScrollController? scrollController,
  }) {
    final themeColor = MySharedPref.getThemeIsLight() ? LightThemeColors.primaryColor : DarkThemeColors.primaryColor;
    return EasyRefresh(
      key: key,
      header: hasBefore && onRefresh != null
          ? MaterialHeader(
              clamping: false,
              springRebound: true,
              triggerOffset: triggerOffset,
              backgroundColor: Colors.white,
              color: themeColor,
            )
          : null,
      onRefresh: hasBefore ? onRefresh : null,
      footer: hasMore && onLoad != null
          ? MaterialFooter(
              triggerOffset: triggerOffset,
              backgroundColor: Colors.white,
              color: themeColor,
            )
          : null,
      onLoad: hasMore ? onLoad : null,
      triggerAxis: triggerAxis,
      controller: controller,
      scrollController: scrollController,
      child: child,
    );
  }
}
