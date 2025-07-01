import 'dart:convert';

import 'package:im_chat_common_plugin/models/http_dns_lines_data.dart';
import 'package:im_chat_common_plugin/tools/time_tools_utils.dart';
import 'package:im_chat_common_plugin/tools/tools_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySharedPref {
  // prevent making instance
  MySharedPref._();

  // External variable
  static String? puturl;

  // Set puturl externally
  static void setPutUrl(String url) {
    puturl = url;
  }

  // get storage
  static late SharedPreferences _sharedPreferences;

  /// 清空缓存key
  static const String _clearCashKey = 'clearCashKey';

  /// 开发者模式状态
  static const String _developerstatus = 'developerstatus_key';

  /// 账号用户信息
  static const String _currentLocalKey = 'current_local';
  static const String _lightThemeKey = 'is_theme_light';
  static const String _domain = 'base_url';
  static const String _matturl = 'mqtt_url';

  /// 是否是debug模式
  static const String _isDebugModeKey = 'isDebugModeKey';

  /// 缓存版本
  static const String _getCashKey = 'getCashKey';

  /// httpDnsLines
  static const String _httpDnsLinesKey = 'httpDnsLinesKey';

  /// 本地线路缓存地址--使用中
  static const String _endpointsKey = 'endpointsKey';

  /// 本地线路缓存地址--所有
  static const String _allEndpointsKey = 'allendpointsKey';

  /// dnsId
  static const String _getDnsIdKey = 'getDnsIdKey';

  /// dnsKey
  static const String _getDnsKeyKey = 'getDnsKeyKey';

  /// token
  static const String _authorization = 'auth_token';

  /// 项目id
  static const String _projectId = 'projectId';

  /// APP 应用锁
  static const String _appLockScreen = 'appLockScreen';

  /// init get storage services
  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static setStorage(SharedPreferences sharedPreferences) {
    _sharedPreferences = sharedPreferences;
  }

  /// 设置缓存key
  static Future<void> setClearCashKey({String cashKey = "cashKey"}) => _sharedPreferences.setString(_clearCashKey, cashKey);

  /// 获取缓存key
  static String getClearCashKey() => _sharedPreferences.getString(_clearCashKey) ?? "";

  /// 设置dns id
  static Future<void> setDnsIdKey(String cashKey) => _sharedPreferences.setString(_getDnsIdKey, cashKey);

  /// 获取dns id
  static String getDnsIdKey() => _sharedPreferences.getString(_getDnsIdKey) ?? "";

  /// 设置dns id
  static Future<void> setProjectIdKey(String cashKey) => _sharedPreferences.setString(_projectId, cashKey);

  /// 获取dns id
  static String getProjectIdKey() => _sharedPreferences.getString(_projectId) ?? "";

  /// 设置dns key
  static Future<void> setDnsKeyKey(String cashKey) => _sharedPreferences.setString(_getDnsKeyKey, cashKey);

  /// 获取dns key
  static String getDnsKeyKey() => _sharedPreferences.getString(_getDnsKeyKey) ?? "";

  /// set token
  static Future<void> setToken(String token) => _sharedPreferences.setString(_authorization, token);

  /// remove token
  static Future<void> removeToken() => _sharedPreferences.remove(_authorization);

  /// get token
  static String? getToken() => _sharedPreferences.getString(_authorization);

  /// 获取线路配置
  static HttpDnsLinesData? getHttpDnsLines() {
    String? infoStr = _sharedPreferences.getString(_httpDnsLinesKey);
    if (infoStr == null) return null;
    Map<String, dynamic> jsonMap = Map<String, dynamic>.from(jsonDecode(infoStr));
    HttpDnsLinesData accountInfo = HttpDnsLinesData.fromJson(jsonMap);
    return accountInfo;
  }

  /// 设置线路配置
  static Future<void> setHttpDnsLines(HttpDnsLinesData? appVersion) async {
    if (appVersion == null) return;
    String jsonInfo = appVersion.toString();
    _sharedPreferences.setString(_httpDnsLinesKey, jsonInfo);
  }

  /// 获取线路地址
  static List<String> getEndpointsList() {
    String timeKey = TimeToolsUtils.formatLinesCachKey();
    String? infoStr = _sharedPreferences.getString("${_endpointsKey}_$timeKey");
    if (infoStr == null) return [];
    List<String> stringList = List<String>.from(json.decode(infoStr));
    return stringList;
  }

  /// 缓存线路地址
  static void setEndpointsList(list) {
    String timeKey = TimeToolsUtils.formatLinesCachKey();
    if (list == null) return;
    String jsonString = json.encode(list);
    _sharedPreferences.setString("${_endpointsKey}_$timeKey", jsonString);
  }

  /// 获取线路地址-所有的
  static List<String> getAllEndpointsList() {
    String timeKey = TimeToolsUtils.formatLinesCachKey();
    String? infoStr = _sharedPreferences.getString("${_allEndpointsKey}_$timeKey");
    if (infoStr == null) return [];
    List<String> stringList = List<String>.from(json.decode(infoStr));
    return stringList;
  }

  /// 缓存线路地址-所有的
  static void setAllEndpointsList(list) {
    String timeKey = TimeToolsUtils.formatLinesCachKey();
    if (list == null) return;
    String jsonString = json.encode(list);
    _sharedPreferences.setString("${_allEndpointsKey}_$timeKey", jsonString);
  }

  /// set theme current type as light theme
  static Future<void> setThemeIsLight(bool lightTheme) => _sharedPreferences.setBool(_lightThemeKey, lightTheme);

  /// get if the current theme type is light
  static bool getThemeIsLight() => _sharedPreferences.getBool(_lightThemeKey) ?? true;

  /// 设置开发者状态
  static Future<void> setDeveloperstatus(bool status) => _sharedPreferences.setBool(_developerstatus, status);

  /// 获取开发者状态
  static bool getDeveloperstatus() => _sharedPreferences.getBool(_developerstatus) ?? false;

  /// 设置缓存版本
  static Future<void> setCashKey(String cashKey) => _sharedPreferences.setString(_getCashKey, cashKey);

  /// 获取缓存版本
  static String getCashKey() => _sharedPreferences.getString(_getCashKey) ?? "v1";

  /// 获取模式,是否是debugm模式
  // static bool getDebugMode() => _sharedPreferences.getBool(_isDebugModeKey) ?? kDebugMode;
  static bool getDebugMode() => _sharedPreferences.getBool(_isDebugModeKey) ?? false; //kDebugMode;

  /// 设置应用锁
  static Future<void> setAppLockScreenPwd(String pwd) => _sharedPreferences.setString(_appLockScreen, pwd);

  /// 获取应用锁密码
  static String getAppLockScreenPwd() => _sharedPreferences.getString(_appLockScreen) ?? "";

  /// base url
  static Future<void> setBaseUrl(String url) async {
    ToolsUtils.instance.baseUrl = url;
    await _sharedPreferences.setString(_domain, url);
  }

  static String? getBaseUrl() {
    String? base = "";
    if (ToolsUtils.instance.baseUrl.isEmpty) {
      base = _sharedPreferences.getString(_domain);
    } else {
      base = ToolsUtils.instance.baseUrl;
    }
    if (base != null && base.isNotEmpty) {
      return base;
    } else {
      return null;
    }
  }

  /// clear all data from shared pref
  static Future<void> clear() async => await _sharedPreferences.clear();

  /// save current locale
  static Future<void> setCurrentLanguage(String languageCode) => _sharedPreferences.setString(_currentLocalKey, languageCode);
}
