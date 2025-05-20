import 'dart:async';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:im_chat_common_plugin/config/color/colors.dart';

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
    return EasyRefresh(
      key: key,
      header: hasBefore && onRefresh != null
          ? MaterialHeader(
              clamping: false,
              springRebound: true,
              triggerOffset: triggerOffset,
              backgroundColor: Colors.white,
              color: IMColors.primaryColor,
            )
          : null,
      onRefresh: hasBefore ? onRefresh : null,
      footer: hasMore && onLoad != null
          ? MaterialFooter(
              triggerOffset: triggerOffset,
              backgroundColor: Colors.white,
              color: IMColors.primaryColor,
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
