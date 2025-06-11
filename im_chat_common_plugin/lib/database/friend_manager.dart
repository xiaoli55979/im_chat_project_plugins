import 'package:sqflite/sqflite.dart';

import 'database_manager.dart';
import 'dart:convert';


class FriendRequestManager extends DatabaseManager {
  static final FriendRequestManager _instance = FriendRequestManager
      ._internal();

  factory FriendRequestManager() => _instance;

  static FriendRequestManager get shared => _instance;

  FriendRequestManager._internal() {
    DatabaseManager.registerTableCreator(_createTable);
  }

  /// 创建 `friend_info` 表
  /// 创建表的方法，支持 Database 和 Transaction
  Future<void> _createTable(DatabaseExecutor db) async {
    await db.execute('''
    CREATE TABLE IF NOT EXISTS friend_info (
      uid TEXT PRIMARY KEY,
  name TEXT,
  username TEXT,
  email TEXT,
  zone TEXT,
  phone TEXT,
  mute INTEGER DEFAULT 0,
  top INTEGER DEFAULT 0,
  sex INTEGER DEFAULT 0,
  category TEXT,
  shortNo TEXT,
  chatPwdOn INTEGER DEFAULT 0,
  screenshot INTEGER DEFAULT 0,
  revokeRemind INTEGER DEFAULT 0,
  receipt INTEGER DEFAULT 0,
  online INTEGER DEFAULT 0,
  lastOffline INTEGER DEFAULT 0,
  deviceFlag INTEGER DEFAULT 0,
  follow INTEGER DEFAULT 0,
  beDeleted INTEGER DEFAULT 0,
  beBlacklist INTEGER DEFAULT 0,
  vercode TEXT,
  sourceDesc TEXT,
  remark TEXT,
  isUploadAvatar INTEGER DEFAULT 0,
  status INTEGER DEFAULT 0,
  robot INTEGER DEFAULT 0,
  isDestroy INTEGER DEFAULT 0,
  flame INTEGER DEFAULT 0,
  flameSecond INTEGER DEFAULT 0,
  version INTEGER DEFAULT 0,
  isDeleted INTEGER DEFAULT 0,
  createdAt TEXT,
  updatedAt TEXT,
  groupNo TEXT,
  avatar TEXT,
  type INTEGER DEFAULT 0,
  token TEXT,
  channelRemark TEXT,
  forbidden INTEGER DEFAULT 0,
  invite INTEGER DEFAULT 0,
  channelType INTEGER DEFAULT 0,
  channelName TEXT,
  read INTEGER DEFAULT 0,
  subTitle TEXT,
  channelId TEXT,
  remoteExtraMap TEXT,
  localExtra TEXT
    )
  ''');
  }


  /// 插入或更新好友数据
  Future<void> insertOrUpdateFriends(
      List<Map<String, dynamic>> friendDataList) async {
    final db = await getDatabase();

    await db.transaction((txn) async {
      // 检查表是否存在
      const tableCheckQuery = '''
      SELECT name FROM sqlite_master WHERE type='table' AND name='friend_info';
    ''';
      final result = await txn.rawQuery(tableCheckQuery);

      // 如果表不存在，创建表
      if (result.isEmpty) {
        print('Table friend_info does not exist. Creating...');
        await _createTable(txn);
      }

      // 插入或更新数据
      for (var friendData in friendDataList) {
        // 序列化非原生字段
        friendData['remoteExtraMap'] = friendData['remoteExtraMap'] != null
            ? json.encode(friendData['remoteExtraMap'])
            : null;
        friendData['localExtra'] = friendData['localExtra'] != null
            ? json.encode(friendData['localExtra'])
            : null;

        // 清理字段
        final sanitizedData = _sanitizeFriendData(friendData);

        // 插入或替换
        await txn.insert(
          'friend_info',
          sanitizedData,
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
    });
  }

// 数据清理函数
  Map<String, dynamic> _sanitizeFriendData(Map<String, dynamic> data) {
    return {
      'uid': data['uid'] ?? '',
      'name': data['name'] ?? '',
      'username': data['username'] ?? '',
      'email': data['email'] ?? '',
      'zone': data['zone'] ?? '',
      'phone': data['phone'] ?? '',
      'mute': data['mute'] ?? 0,
      'top': data['top'] ?? 0,
      'sex': data['sex'] ?? 0,
      'category': data['category'] ?? '',
      'shortNo': data['shortNo'] ?? '',
      'chatPwdOn': data['chatPwdOn'] ?? 0,
      'screenshot': data['screenshot'] ?? 0,
      'revokeRemind': data['revokeRemind'] ?? 0,
      'receipt': data['receipt'] ?? 0,
      'online': data['online'] ?? 0,
      'lastOffline': data['lastOffline'] ?? 0,
      'deviceFlag': data['deviceFlag'] ?? 0,
      'follow': data['follow'] ?? 0,
      'beDeleted': data['beDeleted'] ?? 0,
      'beBlacklist': data['beBlacklist'] ?? 0,
      'vercode': data['vercode'] ?? '',
      'sourceDesc': data['sourceDesc'] ?? '',
      'remark': data['remark'] ?? '',
      'isUploadAvatar': data['isUploadAvatar'] ?? 0,
      'status': data['status'] ?? 0,
      'robot': data['robot'] ?? 0,
      'isDestroy': data['isDestroy'] ?? 0,
      'flame': data['flame'] ?? 0,
      'flameSecond': data['flameSecond'] ?? 0,
      'version': data['version'] ?? 0,
      'isDeleted': data['isDeleted'] ?? 0,
      'createdAt': data['createdAt'] ?? '',
      'updatedAt': data['updatedAt'] ?? '',
      'groupNo': data['groupNo'] ?? '',
      'avatar': data['avatar'] ?? '',
      'type': data['type'] ?? 0,
      'token': data['token'] ?? '',
      'channelRemark': data['channelRemark'] ?? '',
      'forbidden': data['forbidden'] ?? 0,
      'invite': data['invite'] ?? 0,
      'channelType': data['channelType'] ?? 0,
      'channelName': data['channelName'] ?? '',
      'read': data['read'] ?? 0,
      'subTitle': data['subTitle'] ?? '',
      'channelId': data['channelId'] ?? '',
      'remoteExtraMap': data['remoteExtraMap'], // 已经序列化为 JSON
      'localExtra': data['localExtra'], // 已经序列化为 JSON
    };
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
    friend['created_at'] ??= DateTime
        .now()
        .millisecondsSinceEpoch;
    friend['updated_at'] = DateTime
        .now()
        .millisecondsSinceEpoch;
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
    final result = await db.rawQuery(
        'SELECT COUNT(*) as count FROM friend_info WHERE readed = 0');
    return result.first['count'] as int? ?? 0;
  }

  /// 获取指定好友请求（通过 UID）
  Future<Map<String, dynamic>?> getFriendRequest(String uid) async {
    final db = await getDatabase(); // 获取数据库实例
    final result = await db.query(
        'friend_info', where: 'uid = ?', whereArgs: [uid]);
    if (result.isEmpty) return null;
    return result.first;
  }

// 创建两个联合索引
  Future<void> createIndexes(Database db) async {
    // 创建索引 idx_name_groupNo
    await db.execute('''
    CREATE INDEX IF NOT EXISTS idx_name_groupNo ON friend_info (name, groupNo);
  ''');

    // 创建索引 idx_name_shortNo
    await db.execute('''
    CREATE INDEX IF NOT EXISTS idx_name_shortNo ON friend_info (name, shortNo);
  ''');
  }

  /// 通用查询接口，根据 name、shortNo 或 groupNo 进行模糊查询，返回泛型 T 类型的列表
  Future<List<T>> queryByChannelTypeAndNameOrShortNoOrGroupNo<T>(
      String keyword,
      int channelType,
      T Function(Map<String, dynamic>) fromMap,
      ) async {
    print("查询关键字: $keyword, channelType: $channelType");
    final db = await getDatabase();

    // 模糊查询条件
    final String likeQuery = '%$keyword%';

    if (channelType == 1) {
      // channelType 为 1 的逻辑
      // 先按 name 模糊查询
      final List<Map<String, dynamic>> nameResults = await db.query(
        'friend_info',
        where: 'channelType = ? AND name LIKE ?',
        whereArgs: [channelType, likeQuery],
      );

      if (nameResults.isNotEmpty) {
        print("根据 name 查到了结果: ${nameResults.length} 条");
        return nameResults.map((map) => fromMap(map)).toList();
      }

      // 如果没查到 name，再按 shortNo 查询
      final List<Map<String, dynamic>> shortNoResults = await db.query(
        'friend_info',
        where: 'channelType = ? AND shortNo LIKE ?',
        whereArgs: [channelType, likeQuery],
      );

      print("根据 shortNo 查到了结果: ${shortNoResults.length} 条");
      return shortNoResults.map((map) => fromMap(map)).toList();
    } else if (channelType == 2) {
      print("群组查询");
      // channelType 为 2 的逻辑
      // 先按 name 模糊查询
      final List<Map<String, dynamic>> nameResults = await db.query(
        'friend_info',
        where: 'channelType = ? AND name LIKE ?',
        whereArgs: [channelType, likeQuery],
      );

      if (nameResults.isNotEmpty) {
        print("根据 name 查到了结果: ${nameResults.length} 条");
        return nameResults.map((map) => fromMap(map)).toList();
      }

      // 如果没查到 name，再按 groupNo 查询
      final List<Map<String, dynamic>> groupNoResults = await db.query(
        'friend_info',
        where: 'channelType = ? AND groupNo LIKE ?',
        whereArgs: [channelType, likeQuery],
      );

      print("根据 groupNo 查到了结果: ${groupNoResults.length} 条");
      return groupNoResults.map((map) => fromMap(map)).toList();
    }

    // 如果 channelType 不支持，抛出异常
    throw ArgumentError('Unsupported channelType: $channelType');
  }

// 检查字段名是否有效
  bool _isValidField(String field) {
    const validFields = [
      'uid', 'name', 'shortNo', 'groupNo', 'avatar', 'remark', 'type', 'token',
      'status', 'follow', 'isDeleted', 'online', 'robot', 'receipt',
      'channelRemark', 'mute', 'forbidden', 'invite', 'lastOffline',
      'deviceFlag', 'channelType', 'channelName', 'read', 'created_at',
      'updated_at', 'subTitle', 'channelId', 'remoteExtraMap', 'localExtra',
    ];
    return validFields.contains(field);
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
    ''', [status, DateTime
        .now()
        .millisecondsSinceEpoch, uid]);
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
