import 'package:sqflite/sqflite.dart';
import 'database_manager.dart';

class InviteNoticeManager extends DatabaseManager {
  static final InviteNoticeManager _instance = InviteNoticeManager._internal();
  factory InviteNoticeManager() => _instance;
  // static InviteNoticeManager get shared => _instance;
  InviteNoticeManager._internal() {
    DatabaseManager.registerTableCreator(_createTable);
  }

  /// 创建 `invite_notice` 表
  Future<void> _createTable(Database db) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS invite_notice (
        id INTEGER PRIMARY KEY,
        avatar TEXT,
        chnl_type INTEGER,
        created_at TEXT,
        created_at_int INTEGER,
        group_name TEXT,
        group_no TEXT,
        remark TEXT,
        server_id TEXT,
        sign TEXT,
        status INTEGER,
        to_name TEXT,
        to_uid TEXT,
        token TEXT,
        uid TEXT
      )
    ''');
  }

  /// 插入或更新邀请通知
  Future<void> addOrUpdateInviteNotice(Map<String, dynamic> invite) async {
    final db = await getDatabase(); // 获取数据库实例
    invite['created_at_int'] ??= DateTime.now().millisecondsSinceEpoch;

    // 更新或插入记录
    await db.insert(
      'invite_notice',
      invite,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// 分页获取邀请通知（根据 chnl_type）
  Future<List<Map<String, dynamic>>> getInviteNoticesByChnlType(int chnlType, int offset, int limit) async {
    final db = await getDatabase(); // 获取数据库实例
    return await db.query(
      'invite_notice',
      where: 'chnl_type = ?',
      whereArgs: [chnlType],
      orderBy: 'created_at_int DESC',
      limit: limit,
      offset: offset,
    );
  }

  /// 获取指定 ID 的邀请通知
  Future<Map<String, dynamic>?> getInviteNoticeById(int id) async {
    final db = await getDatabase(); // 获取数据库实例
    final result = await db.query('invite_notice', where: 'id = ?', whereArgs: [id]);
    if (result.isEmpty) return null;
    return result.first;
  }

  /// 批量插入或更新数据
  Future<void> batchInsertOrUpdate(List<Map<String, dynamic>> notices) async {
    final db = await getDatabase();

    await db.transaction((txn) async {
      for (var notice in notices) {
        final existingNotice = await txn.query(
          'invite_notice',
          where: 'id = ?',
          whereArgs: [notice['id']],
        );

        if (existingNotice.isEmpty) {
          // 插入新记录
          await txn.insert('invite_notice', notice);
        } else {
          // 更新已有记录
          await txn.update(
            'invite_notice',
            notice,
            where: 'id = ?',
            whereArgs: [notice['id']],
          );
        }
      }
    });
  }

  /// 更新邀请通知的字段
  Future<void> updateInviteNotice(int id, Map<String, dynamic> updatedFields) async {
    final db = await getDatabase(); // 获取数据库实例
    updatedFields['created_at_int'] = DateTime.now().millisecondsSinceEpoch;
    await db.update(
      'invite_notice',
      updatedFields,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// 删除指定 ID 的邀请通知
  Future<void> deleteInviteNotice(int id) async {
    final db = await getDatabase(); // 获取数据库实例
    await db.delete('invite_notice', where: 'id = ?', whereArgs: [id]);
  }

  /// 清空 `invite_notice` 表
  Future<void> clearInviteNotices() async {
    final db = await getDatabase(); // 获取数据库实例
    await db.delete('invite_notice');
  }

  /// 获取数据库实例
  Future<Database> getDatabase() {
    return database;
  }
}
