import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

abstract class DatabaseManager {
  static Database? _database;
  static final List<Future<void> Function(Database)> _tableCreators = [];

  /// 获取数据库实例
  Future<Database> get database async {
    if (_database == null) {
      _database = await initDB();
    }
    return _database!;
  }

  /// 注册表创建函数（在数据库初始化时调用）
  static void registerTableCreator(Future<void> Function(Database) creator) {
    _tableCreators.add(creator);
  }

  /// 初始化数据库（首次打开时创建表）
  static Future<Database> initDB() async {
    final documentsDir = await getApplicationDocumentsDirectory();
    final path = join(documentsDir.path, 'app_database.db');

    return await openDatabase(
      path,
      version: 3,
      onCreate: (db, version) async {
        for (var creator in _tableCreators) {
          await creator(db);
        }
      },
    );
  }

  /// 插入数据
  Future<int> insert(String table, Map<String, dynamic> data) async {
    final db = await database;
    return await db.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  /// 查询数据
  Future<List<Map<String, dynamic>>> query(String table, {String? where, List<Object?>? whereArgs}) async {
    final db = await database;
    return await db.query(table, where: where, whereArgs: whereArgs);
  }

  /// 更新数据
  Future<int> update(String table, Map<String, dynamic> data, String where, List<Object?> whereArgs) async {
    final db = await database;
    return await db.update(table, data, where: where, whereArgs: whereArgs);
  }

  /// 删除数据
  Future<int> delete(String table, String where, List<Object?> whereArgs) async {
    final db = await database;
    return await db.delete(table, where: where, whereArgs: whereArgs);
  }

  /// 清空表
  Future<void> clearTable(String table) async {
    final db = await database;
    await db.delete(table);
  }

  /// 导出数据库
  Future<void> copyDatabaseToDownloads() async {
    try {
      // 获取数据库路径
      final dbPath = await getDatabasesPath();
      final sourcePath = join(dbPath, 'user_info.db');

      // 获取 iOS 设备的 Downloads 目录
      final downloadsDir = await getApplicationDocumentsDirectory(); // iOS 只能存 Documents
      final targetPath = join(downloadsDir.path, 'user_info.db');

      // 拷贝数据库文件
      await File(sourcePath).copy(targetPath);
      print('数据库已复制到: $targetPath');
    } catch (e) {
      print('数据库导出失败: $e');
    }
  }
}
