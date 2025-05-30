import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class Storage {
  static const _kIsLightTheme = 'is_light_theme_key';
  static const _kLocale = 'local_key';
  static const _kFriendSync = 'friend_sync';

  static Storage? _instance;
  static Storage shared() {
    if (_instance == null) {
      _instance = Storage();
      return _instance!;
    }
    return _instance!;
  }

  // 本地化存储，存APP内部
  static GetStorage? _getStorage;

  // runApp方法前调用
  static init() async {
    await GetStorage.init();
    _getStorage = GetStorage();
  }

  static Future<void> setLocale(Locale? locale) async {
    if (locale == null) {
      return _getStorage!.write(_kLocale, null);
    }
    String value = "${locale.languageCode}_${locale.countryCode}";
    return _getStorage!.write(_kLocale, value);
  }

  static Locale? getLocale() {
    String? value = _getStorage!.read<String?>(_kLocale);
    if (value != null) {
      final strings = value.split("_");
      if (strings.length == 2) {
        return Locale(strings.first, strings.last);
      }
    }
    return null;
  }

  static Future<void> putIsLightTheme(bool friendSync) async {
    return _getStorage!.write(_kIsLightTheme, friendSync);
  }

  static bool getIsLightTheme() {
    return _getStorage!.read<bool?>(_kIsLightTheme) ?? true;
  }

  static Future<void> putFriendSync(bool friendSync) async {
    return _getStorage!.write(_kFriendSync, friendSync);
  }

  ///是否同步过通讯录数据
  static bool getFriendSync() {
    return _getStorage!.read<bool?>(_kFriendSync) ?? false;
  }
}
