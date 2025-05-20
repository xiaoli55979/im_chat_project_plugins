import 'dart:convert';

import 'locales.g.dart';

class EnglishLanguage {
  static Map<String, String> language = {
    kAppName: 'Test',
    kChangeLanguage: 'Change Language',
    kLanguageFollowSystem: 'Follow the system',

    ///common
    kCommonEmptyDes: '暂无记录',
    kCommonCancel: '取消',
    kCommonSubmit: '确认',
    kConfirm: 'confirm',

    kLaunchWelcomeDes: 'welcome',
    kSecurityCodeTitle: '请输入您的安全码',
    kSecurityCodeHintText: '请输入您的安全码',
  };

  static String _decode(String encodedText) {
    try {
      return utf8.decode(base64Decode(encodedText));
    } catch (e) {
      // 解码失败时返回原始文本
      return encodedText;
    }
  }

  static Map<String, String> get decodedLanguage {
    return language.map((key, encodedValue) {
      return MapEntry(key, _decode(encodedValue));
    });
  }
}
