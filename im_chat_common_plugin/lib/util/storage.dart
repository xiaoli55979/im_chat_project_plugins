import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:im_chat_common_plugin/models/global_info_entity.dart';
import 'package:im_chat_common_plugin/models/person_info_entity.dart';
import 'package:im_chat_common_plugin/models/user_info_data.dart';

class Storage {
  static const _kIsLightTheme = 'is_light_theme_key';
  static const _kLocale = 'local_key';
  static const _kToken = '_token_key';
  static const _kUserInfo = 'user_info_key';
  static const _kFriendSync = 'friend_sync';
  /// globalConf
  static const String _globalConf = 'globalConf';
  /// personConf
  static const String _personConf = 'personConf';
  /// ownConf
  static const String _ownConf = 'ownConf';

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

  static Future<void> setToken(String? token) async {
    return _getStorage!.write(_kToken, token);
  }

  static String? getToken() {
    return _getStorage!.read<String?>(_kToken);
  }

  static Future<void> setUserInfo(UserInfoData? userInfo) async {
    if (userInfo == null) {
      return _getStorage!.write(_kUserInfo, null);
    }
    String userEntityString = jsonEncode(userInfo.toJson());
    return _getStorage!.write(_kUserInfo, userEntityString);
  }

  static UserInfoData? getUserInfo() {
    String? userEntityString = _getStorage!.read<String?>(_kUserInfo);
    if (userEntityString != null) {
      UserInfoData user = UserInfoData.fromJson(jsonDecode(userEntityString));
      return user;
    }
    return null;
  }

  /// set GlobalConfigInfo
  static void setGlobalConf(GlobalInfoEntity model) {
    final jsonMap = model.toString();
    _getStorage?.write(_globalConf, json.encode(jsonMap));
  }


  /// get GlobalConfigInfo
  static GlobalInfoEntity getGlobalConf() {
    final jsonString = _getStorage?.read(_globalConf);
    if (jsonString == null) {
      throw Exception("Global config not found");
    }
    final jsonMap = json.decode(jsonString);
    return GlobalInfoEntity.fromJson(jsonMap);
  }

  /// set PersonConf
  static void setPersonConf(PersonInfoEntity model) {
    final jsonMap = model.toString();
    _getStorage?.write(_personConf, json.encode(jsonMap));
  }


  /// get PersonConf
  static PersonInfoEntity getPersonConf() {
    final jsonString = _getStorage?.read(_personConf);
    if (jsonString == null) {
      throw Exception("Person config not found");
    }
    final jsonMap = json.decode(jsonString);
    return PersonInfoEntity.fromJson(jsonMap);
  }

  /// set PersonConf
  static void setOwnConf(UserInfoData model) async {
    final jsonMap = model.toJson();
    await _getStorage?.write(_ownConf, json.encode(jsonMap));
  }

  /// get PersonConf
  static UserInfoData getOwnConf() {
    final jsonString = _getStorage?.read(_ownConf);
    if (jsonString == null) {
      throw Exception("Own config not found");
    }
    final jsonMap = json.decode(jsonString);
    print(jsonMap.toString());
    return UserInfoData.fromJson(jsonMap);
  }

  static Future<void> putFriendSync(bool friendSync) async {
    return _getStorage!.write(_kFriendSync, friendSync);
  }

  ///是否同步过通讯录数据
  static bool getFriendSync() {
    return _getStorage!.read<bool?>(_kFriendSync) ?? false;
  }
}
