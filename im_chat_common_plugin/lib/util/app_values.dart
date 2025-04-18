import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/util/common_ui.dart';

abstract class PopupMenuItemValue {
  String get title;

  String? get image;

  PopupMenuItem item() =>
      popupMenuItem(value: this, title: title, image: image);
}

///系统账号
enum WKSystemAccount {
  ///官方
  accountCategorySystem('system'),
  ///客服
  accountCategoryCustomerService('customerService'),
  ///访客
  accountCategoryVisitor('visitor');

  const WKSystemAccount(this.value);

  final String value;
}

EdgeInsets get safeAreaEdgeInsets => Get.mediaQuery.viewPadding;

double safeAreaTopDistance(double distance) =>
    safeAreaEdgeInsets.top + distance;

double safeAreaBottomDistance(double distance) =>
    safeAreaEdgeInsets.bottom + distance;
