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

  // 获取 对应uid和cmdType 的redCount 值
  Future<int?> getRedCount(String toUid, String cmdType) async {
    final db = await instance.database;
    final result = await db.query(
      'cmd_msg_table',
      columns: ['redCount'],
      where: 'toUid = ? AND cmdType = ?',
      whereArgs: [toUid, cmdType],
    );

    // 如果查询有结果，返回 redCount 值，否则返回 null
    if (result.isNotEmpty) {
      print("查询到红点的值，并传给外面更新${result.first['redCount']}");
      return result.first['redCount'] as int?;
    }
    return null;
  }

  // 获取 redCount 的累加值
  Future<int> getTotalRedCount(String toUid) async {
    final db = await instance.database;

    // 使用 SUM 函数计算 redCount 的总和
    final result = await db.rawQuery(
      'SELECT SUM(redCount) as totalRedCount FROM cmd_msg_table WHERE toUid = ?',
      [toUid],
    );

    // 返回累加值，如果查询结果为空或为 null，则返回 0
    if (result.isNotEmpty && result.first['totalRedCount'] != null) {
      print("查询到红点的累加值，并传给外面更新${result.first['totalRedCount']}");
      return result.first['totalRedCount'] as int;
    }
    return 0;
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
    print("查询到的cmd消息结果result$result");
    // 将查询结果映射为实体列表
    return result.map((json) {  print("查询到的cmd消息结果json$json"); return ConversationCmdMsgEntity.fromJson(json);}).toList();
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

    print("将要插入的cmdmodel：${cmdMsg.toJson()}");
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
