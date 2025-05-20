import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/util/common_ui.dart';
import 'package:im_chat_common_plugin/util/constant.dart';

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

abstract class PopupMenuItemValue {
  String get title;

  String? get image;

  PopupMenuItem item() =>
      popupMenuItem(value: this, title: title, image: image);
}

extension LocaleExtension on Locale {
  bool isSameLanguage(Locale locale) {
    return languageCode.startsWith(locale.languageCode.substring(0, 2));
  }

  String get languageValue {
    if (isSameLanguage(China)) {
      return 'CHINESE';
    }  else {
      return 'ENGLISH';
    }
  }
}

EdgeInsets get safeAreaEdgeInsets => Get.mediaQuery.viewPadding;

double safeAreaTopDistance(double distance) =>
    safeAreaEdgeInsets.top + distance;

double safeAreaBottomDistance(double distance) =>
    safeAreaEdgeInsets.bottom + distance;

