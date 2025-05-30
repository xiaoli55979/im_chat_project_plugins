// Copyright (c) 2022 NetEase, Inc. All rights reserved.
// Use of this source code is governed by a MIT license that can be
// found in the LICENSE file.

import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'localization/kit_client_localizations.dart';
import 'localization/kit_client_localizations_zh.dart';

class SlocalAuth {
  static const LocalizationsDelegate<KitClientLocalizations> delegate = KitClientLocalizations.delegate;

  static KitClientLocalizations of(BuildContext? context) {
    KitClientLocalizations? localizations;
    if (context != null) {
      localizations = KitClientLocalizations.of(context);
    }
    if (localizations == null) {
      var local = PlatformDispatcher.instance.locale;
      try {
        localizations = lookupKitClientLocalizations(local);
      } catch (e) {
        localizations = KitClientLocalizationsZh();
      }
    }
    return localizations;
  }

  /// 获取文本
  static String getLocalizaContent(String? localizationsString) {
    if (localizationsString == null) return "未知语言";
    try {
      // 尝试将字符串解码为 Base64
      List<int> bytes = base64Decode(localizationsString);
      String decodedString = utf8.decode(bytes);
      return decodedString;
    } catch (e) {
      // 如果解码失败，直接返回原始字符串
      return localizationsString;
    }
  }
}
