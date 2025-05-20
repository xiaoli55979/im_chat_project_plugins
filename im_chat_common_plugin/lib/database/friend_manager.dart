import 'package:sqflite/sqflite.dart';

import 'database_manager.dart';

class FriendRequestManager extends DatabaseManager {
  static final FriendRequestManager _instance = FriendRequestManager._internal();
  factory FriendRequestManager() => _instance;

  FriendRequestManager._internal() {
    DatabaseManager.registerTableCreator(_createTable);
  }

  /// 创建 `friend_info` 表
  Future<void> _createTable(Database db) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS friend_info (
        uid TEXT PRIMARY KEY,
        name TEXT,
        avatar TEXT,
        remark TEXT,
        token TEXT,
        status INTEGER,
        read INTEGER,
        created_at INTEGER,
        updated_at INTEGER
      )
    ''');
  }

  /// 添加或更新好友请求
  Future<bool> addFriendRequest(Map<String, dynamic> friend) async {
    final db = await getDatabase(); // 获取数据库实例
    bool isNewRequest = true;

    // 检查是否存在该好友请求
    final existingRequest = await getFriendRequest(friend['uid']);
    if (existingRequest != null) {
      await deleteFriendRequest(friend['uid']);
      if (existingRequest['status'] == 0) { // 假设状态 0 表示“等待确认”
        isNewRequest = false;
      }
    }

    // 插入新请求
    friend['created_at'] ??= DateTime.now().millisecondsSinceEpoch;
    friend['updated_at'] = DateTime.now().millisecondsSinceEpoch;
    await db.insert('friend_info', friend);
    return isNewRequest;
  }

  /// 获取所有好友请求
  Future<List<Map<String, dynamic>>> getAllFriendRequests() async {
    final db = await getDatabase(); // 获取数据库实例
    return await db.query('friend_info', orderBy: 'created_at DESC');
  }

  /// 获取未读好友请求数量
  Future<int> getUnreadFriendRequestCount() async {
    final db = await getDatabase(); // 获取数据库实例
    final result = await db.rawQuery('SELECT COUNT(*) as count FROM friend_info WHERE readed = 0');
    return result.first['count'] as int? ?? 0;
  }

  /// 获取指定好友请求（通过 UID）
  Future<Map<String, dynamic>?> getFriendRequest(String uid) async {
    final db = await getDatabase(); // 获取数据库实例
    final result = await db.query('friend_info', where: 'uid = ?', whereArgs: [uid]);
    if (result.isEmpty) return null;
    return result.first;
  }

  /// 标记所有好友请求为已读
  Future<void> markAllFriendRequestsAsRead() async {
    final db = await getDatabase(); // 获取数据库实例
    await db.rawUpdate('UPDATE friend_info SET readed = 1 WHERE readed = 0');
  }

  /// 更新指定好友请求的状态
  Future<void> updateFriendRequestStatus(String uid, int status) async {
    final db = await getDatabase(); // 获取数据库实例
    await db.rawUpdate('''
      UPDATE friend_info 
      SET status = ?, readed = 1, updated_at = ? 
      WHERE uid = ?
    ''', [status, DateTime.now().millisecondsSinceEpoch, uid]);
  }

  /// 删除指定好友请求
  Future<void> deleteFriendRequest(String uid) async {
    final db = await getDatabase(); // 获取数据库实例
    await db.delete('friend_info', where: 'uid = ?', whereArgs: [uid]);
  }

  /// 清空 `friend_info` 表
  Future<void> clearFriendRequests() async {
    final db = await getDatabase(); // 获取数据库实例
    await db.delete('friend_info');
  }

  Future<Database> getDatabase() {
    return database;
  }
}
