import 'dart:io';

import 'package:archive/archive.dart';
import 'package:flutter/foundation.dart'; // 引入 kReleaseMode
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

class LogManager {
  static bool enableConsoleLog = !kReleaseMode; // 开发模式开启控制台日志，生产模式关闭
  static bool enableFileLog = true; // 是否保存日志到文件
  static String logFilePath = ''; // 日志文件路径
  static int maxLogDays = 7; // 日志最大保存天数

  // 设置日志文件路径
  static Future<void> initialize() async {
    if (enableFileLog) {
      final directory = await getApplicationDocumentsDirectory(); // 获取文档目录
      final logsDir = Directory('${directory.path}/logs'); // 创建 logs 目录
      if (!await logsDir.exists()) {
        await logsDir.create(); // 如果 logs 目录不存在，则创建
      }

      // 删除过期的日志文件
      await _deleteOldLogFiles(logsDir);

      // 按日期生成日志文件名
      final currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
      logFilePath = '${logsDir.path}/log_$currentDate.txt'; // 日志文件路径
    }
  }

  // 打印日志
  static void log(String message, {LogManagerLevel level = LogManagerLevel.INFO}) async {
    String formattedMessage = _formatMessage(message, level);

    // 打印到控制台
    if (enableConsoleLog) {
      print(formattedMessage);
    }

    // 打印到文件
    if (enableFileLog) {
      await _writeToFile(formattedMessage);
    }
  }

  // 写入日志到文件
  static Future<void> _writeToFile(String message) async {
    try {
      final file = File(logFilePath);
      if (!await file.exists()) {
        await file.create(); // 如果文件不存在，创建文件
      }
      await file.writeAsString('$message\n', mode: FileMode.append); // 写入日志，追加模式
    } catch (e) {
      print("Failed to write log to file: $e");
    }
  }

  // 格式化日志消息
  static String _formatMessage(String message, LogManagerLevel level) {
    String timestamp = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()); // 时间戳
    String stackTraceInfo = _getStackTraceInfo(); // 获取堆栈信息

    return '[$timestamp] [${level.toString().split('.').last}] - $message [$stackTraceInfo]';
  }

  // 获取当前堆栈信息
  static String _getStackTraceInfo() {
    var stackTrace = StackTrace.current.toString();
    List<String> stackTraceLines = stackTrace.split('\n');

    // 取第二行堆栈信息（第一行一般是当前日志方法）
    if (stackTraceLines.length > 1) {
      String line = stackTraceLines[1].trim();
      // 解析类名和方法名，格式: ClassName.methodName
      RegExp regExp = RegExp(r"(\S+)\.(\S+)\(");
      var match = regExp.firstMatch(line);
      if (match != null) {
        String className = match.group(1) ?? '';
        String methodName = match.group(2) ?? '';
        return '$className.$methodName';
      }
    }
    return ''; // 如果没有找到堆栈信息，返回空字符串
  }

  /// 删除超过最大保存天数的日志文件
  static Future<void> _deleteOldLogFiles(Directory logDir) async {
    try {
      final now = DateTime.now();
      final files = logDir.listSync();
      for (var file in files) {
        if (file is File) {
          // 获取文件的最后修改时间
          final fileStat = await file.stat();
          final lastModified = fileStat.modified;
          if (lastModified != null) {
            final difference = now.difference(lastModified).inDays;
            if (difference > maxLogDays) {
              // 如果文件超过最大保存天数，删除文件
              await file.delete();
              print("Deleted old log file: ${file.path}");
            }
          }
        }
      }
    } catch (e) {
      print("Error deleting old log files: $e");
    }
  }

  /// 获取日志文件列表
  static Future<List<FileSystemEntity>> getLogFiles() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final logDir = Directory('${directory.path}/logs');
      if (await logDir.exists()) {
        return logDir.listSync(); // 返回文件列表
      } else {
        return [];
      }
    } catch (e) {
      print("Error getting log files: $e");
      return [];
    }
  }

  /// 删除指定日志文件
  static Future<void> deleteLogFile(String filePath) async {
    try {
      final file = File(filePath);
      if (await file.exists()) {
        await file.delete();
        print("Log file deleted: $filePath");
      }
    } catch (e) {
      print("Error deleting log file: $e");
    }
  }

  /// 压缩日志文件夹为 zip 格式，包含进度回调
  static Future<String?> compressLogFolder(Function(double progress) onProgress) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final logDir = Directory('${directory.path}/logs');

      if (!await logDir.exists()) {
        print("Log directory does not exist.");
        return null;
      }

      // 创建一个 Archive 对象
      final archive = Archive();
      final files = logDir.listSync();
      final totalFiles = files.length;
      int processedFiles = 0;

      for (var fileEntity in files) {
        if (fileEntity is File) {
          final fileBytes = await fileEntity.readAsBytes();
          archive.addFile(ArchiveFile(fileEntity.path.split('/').last, fileBytes.length, fileBytes));

          // 更新进度
          processedFiles++;
          onProgress(processedFiles / totalFiles); // 调用回调函数，传递进度百分比
        }
      }

      // 保存压缩文件
      final zipFilePath = '${directory.path}/logs_${DateTime.now().millisecondsSinceEpoch}.zip';
      final zipFile = File(zipFilePath);
      await zipFile.writeAsBytes(ZipEncoder().encode(archive));

      print('Logs compressed into: $zipFilePath');
      return zipFilePath;
    } catch (e) {
      print("Error compressing log files: $e");
      return null;
    }
  }
}

enum LogManagerLevel { INFO, DEBUG, ERROR, WARNING }
