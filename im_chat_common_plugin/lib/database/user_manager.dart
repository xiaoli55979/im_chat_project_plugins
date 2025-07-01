import 'dart:convert';

import 'package:im_chat_common_plugin/models/user_info_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'database_manager.dart';

class UserManager extends DatabaseManager {
  static final UserManager _instance = UserManager._internal();
  factory UserManager() => _instance;

  UserManager._internal() {
    DatabaseManager.registerTableCreator(createTable);
  }

  String _currentUserUid = ""; // 当前用户 UID（内存缓存）
  String _currentToken = ""; // 当前 token

  /// 创建用户表
  Future<void> createTable(Database db) async {
    await db.execute('''
    CREATE TABLE IF NOT EXISTS user_info (
      uid TEXT PRIMARY KEY,
      app_id TEXT,
      name TEXT,
      username TEXT,
      sex INTEGER,
      category TEXT,
      short_no TEXT,
      zone TEXT,
      phone TEXT,
      token TEXT,
      chat_pwd TEXT,
      lock_screen_pwd TEXT,
      lock_after_minute INTEGER,
      role TEXT,
      lang TEXT,
      setting TEXT,
      rsa_public_key TEXT,
      short_status INTEGER,
      msg_expire_second INTEGER,
      server_id TEXT,
      avatar TEXT,
      sign TEXT
    )
  ''');
  }

  /// 设置当前登录用户 UID
  Future<void> setCurrentUserUid(String uid) async {
    _currentUserUid = uid; // 缓存 UID
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('current_user_uid', uid);
  }

  /// 获取当前登录用户 UID
  Future<String> getCurrentUserUid() async {
    if (_currentUserUid.isNotEmpty) return _currentUserUid; // 先检查内存

    final prefs = await SharedPreferences.getInstance();
    _currentUserUid = prefs.getString('current_user_uid') ?? "";
    return _currentUserUid;
  }

  /// 获取当前登录用户 UID
  Future<String> getCurrentToken() async {
    if (_currentToken.isEmpty) return _currentToken;
    UserInfoData? model = await getCurrentUser();
    if (model != null) {
      return model.token ?? '';
    }
    return "";
  }

  /// 清除当前用户 UID（用户登出时调用）
  Future<void> logout() async {
    _currentUserUid = "";
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('current_user_uid');
  }

  /// 插入或更新用户
  Future<int> upsertUser(UserInfoData user) async {
    final data = user.toJson();

    // 处理 Map 类型字段，转换为 JSON String
    if (data['setting'] is Map) {
      data['setting'] = jsonEncode(data['setting']);
    } else if (data['setting'] is UserInfoSetting) {
      data['setting'] = jsonEncode(data['setting'].toJson());
    }

    print("save_object:${data}");
    return await insert('user_info', data);
  }

  /// 查询用户信息
  Future<UserInfoData?> getUser({String uid = ""}) async {
    if (uid.isEmpty) {
      _currentUserUid = await getCurrentUserUid();
      uid = _currentUserUid;
    }
    print("object_currentUserUid:$_currentUserUid");
    if (uid.isEmpty) return null;

    final result = await query('user_info', where: 'uid = ?', whereArgs: [uid]);

    if (result.isEmpty) return null;

    final data = Map<String, dynamic>.from(result.first); // 复制为可变 Map

    // 处理 `setting` 字段（可能是 JSON 字符串，需要解码）
    if (data['setting'] is String && (data['setting'] as String).isNotEmpty) {
      try {
        data['setting'] = jsonDecode(data['setting']);
      } catch (e) {
        print("⚠️ setting 解析失败: $e");
        data['setting'] = {}; // 解析失败，默认空 Map
      }
    }

    return UserInfoData.fromJson(data);
  }

  /// 获取当前登录用户的信息
  Future<UserInfoData?> getCurrentUser() async {
    final uid = await getCurrentUserUid();
    if (uid.isEmpty) return null;
    return getUser(uid: uid);
  }

  /// 删除用户
  Future<int> deleteUser(String uid) async {
    return await delete('user_info', 'uid = ?', [uid]);
  }

  /// 清空用户表
  Future<void> clearUsers() async {
    await clearTable('user_info');
  }
}
