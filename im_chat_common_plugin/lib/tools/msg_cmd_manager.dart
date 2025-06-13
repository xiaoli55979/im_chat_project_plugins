import 'package:im_chat_common_plugin/models/conversation_cmd_msg_entity.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CmdMsgDBHelper {
  static final CmdMsgDBHelper instance = CmdMsgDBHelper._init();
  static Database? _database;

  CmdMsgDBHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('cmd_msg_table.db');
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE cmd_msg_table (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        cmdType TEXT NOT NULL,
        applyName TEXT,
        applyUid TEXT,
        remark TEXT,
        toUid TEXT NOT NULL,
        token TEXT,
        channelId TEXT,
        channelType TEXT,
        redCount INTEGER,
        content TEXT,
        timeStamp INTEGER
      );
    ''');
  }

  // Insert record
  Future<int> insert(ConversationCmdMsgEntity cmdMsg) async {
    final db = await instance.database;
    return await db.insert('cmd_msg_table', cmdMsg.toJson());
  }

  // Query all records
  Future<List<ConversationCmdMsgEntity>> queryAllByToUid(String toUid) async {
    final db = await instance.database;

    // 根据 toUid 查询所有记录
    final result = await db.query(
      'cmd_msg_table',
      where: 'toUid = ?',
      whereArgs: [toUid],
    );

    // 将查询结果映射为实体列表
    return result.map((json) => ConversationCmdMsgEntity.fromJson(json)).toList();
  }


  // Query specific record by cmdType and toUid
  Future<ConversationCmdMsgEntity?> queryByCmdTypeAndToUid(String cmdType, String toUid) async {
    final db = await instance.database;
    final result = await db.query(
      'cmd_msg_table',
      where: 'cmdType = ? AND toUid = ?',
      whereArgs: [cmdType, toUid],
    );
    if (result.isNotEmpty) {
      return ConversationCmdMsgEntity.fromJson(result.first);
    }
    return null;
  }

  // Update redCount by cmdType and toUid
  Future<int> updateRedCountByCmdTypeAndToUid({
    required String cmdType,
    required String toUid,
    required int redCount,
  }) async {
    final db = await instance.database;

    // 执行更新操作
    return await db.update(
      'cmd_msg_table',
      {'redCount': redCount},
      where: 'cmdType = ? AND toUid = ?',
      whereArgs: [cmdType, toUid],
    );
  }

  // Update record by cmdType and toUid
  Future<int> updateOrInsertByCmdTypeAndToUid(ConversationCmdMsgEntity cmdMsg) async {
    final db = await instance.database;

    // 尝试更新
    int affectedRows = await db.update(
      'cmd_msg_table',
      cmdMsg.toJson(),
      where: 'cmdType = ? AND toUid = ?',
      whereArgs: [cmdMsg.cmdType, cmdMsg.toUid],
    );

    // 如果没有匹配到数据，则插入新记录
    if (affectedRows == 0) {
      return await db.insert('cmd_msg_table', cmdMsg.toJson());
    }

    return affectedRows;
  }

  // Delete record by id
  Future<int> deleteById(int id) async {
    final db = await instance.database;
    return await db.delete(
      'cmd_msg_table',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Close the database
  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
