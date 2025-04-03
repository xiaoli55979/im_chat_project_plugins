import 'package:shared_preferences/shared_preferences.dart';

class PasswordManager {
  static const String _passwordKey = 'security_password';
  static const String _companyIdKey = 'companyIdKey';

  /// 获取保存的密码
  static Future<String> getPassword() async {
    final prefs = await SharedPreferences.getInstance();
    // 如果密码不存在或为 null，则返回空字符串
    return prefs.getString(_passwordKey) ?? "";
  }

  /// 设置保存的密码
  static Future<void> setPassword(String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_passwordKey, password);
  }

  /// 检查密码是否已设置
  static Future<bool> isPasswordSet() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_passwordKey);
  }

  /// 获取企业ID
  static Future<String> getCompanyId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_companyIdKey) ?? "";
  }

  /// 设置保存的企业ID
  static Future<void> setCompanyId(String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_companyIdKey, password);
  }

  /// 检查企业ID是否已设置
  static Future<bool> isCompanyIdSet() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_companyIdKey);
  }
}
