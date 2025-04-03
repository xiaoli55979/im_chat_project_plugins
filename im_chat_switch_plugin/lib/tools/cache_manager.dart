import 'package:shared_preferences/shared_preferences.dart';

class CacheManager {
  // 单例模式的实例
  static final CacheManager _instance = CacheManager._internal();

  // 私有的构造函数
  CacheManager._internal();

  // 提供一个工厂构造函数，返回单例实例
  factory CacheManager() {
    return _instance;
  }

  // 初始化 SharedPreferences
  Future<void> init() async {
    // 此处可以执行任何初始化操作，如预加载某些值等
  }

  // 存储字符串
  Future<void> setString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  // 获取字符串
  Future<String?> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  // 存储整数
  Future<void> setInt(String key, int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }

  // 获取整数
  Future<int?> getInt(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  // 存储布尔值
  Future<void> setBool(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  // 获取布尔值
  Future<bool?> getBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  // 清空缓存
  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
