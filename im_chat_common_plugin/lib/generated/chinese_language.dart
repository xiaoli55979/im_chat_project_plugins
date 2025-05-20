import 'dart:convert';

import 'locales.g.dart'; // 确保你需要的常量在这里

class ChineseLanguage {
  static Map<String, String> language = {
    kAppName: '美聊',
    kChangeLanguage: '切换语言',
    kLanguageFollowSystem: '跟随系统',

    ///common
    kCommonEmptyDes: '暂无记录',
    kCommonCancel: '取消',
    kCommonSubmit: '确认',
    kConfirm: '确定',

    kLaunchWelcomeDes: '欢迎使用',
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
