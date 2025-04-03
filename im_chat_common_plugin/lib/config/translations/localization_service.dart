import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'en_US/en_us_translation.dart';
import 'zh_CN/zh_cn_translation.dart';

class LocalizationService extends Translations {
  // prevent creating instance
  LocalizationService._();

  static LocalizationService? _instance;

  static LocalizationService getInstance() {
    _instance ??= LocalizationService._();
    return _instance!;
  }

  // default language
  // todo change the default language
  static Locale defaultLanguage = supportedLanguages['zh']!;

  // supported languages
  static Map<String, Locale> supportedLanguages = {
    'en': const Locale('en', 'US'),
    'zh': const Locale('zh', 'CN'),
  };

  // supported languages fonts family (must be in assets & pubspec yaml) or you can use google fonts
  static Map<String, TextStyle> supportedLanguagesFontsFamilies = {};

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUs,
        'zh_CN': zhCN,
      };

  /// check if the language is supported
  static isLanguageSupported(String languageCode) => supportedLanguages.keys.contains(languageCode);

  /// update app language by code language for example (en,ar..etc)
  static updateLanguage(String languageCode) async {
    // check if the language is supported
    if (!isLanguageSupported(languageCode)) return;
    // update current language in shared pref
    // await MySharedPref.setCurrentLanguage(languageCode);
    if (!Get.testMode) {
      Get.updateLocale(supportedLanguages[languageCode]!);
    }
  }

  /// check if the language is english
  // static bool isItEnglish() =>
  //     // MySharedPref.getCurrentLocal().languageCode.toLowerCase().contains('en');
  //
  // /// get current locale
  // static Locale getCurrentLocal() => MySharedPref.getCurrentLocal();
}
