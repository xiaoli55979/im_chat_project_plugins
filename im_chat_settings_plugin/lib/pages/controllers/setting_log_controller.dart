import 'dart:io';

import 'package:get/get.dart';
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

import '../../api/api_provider_setting.dart';

class SettingLogController extends GetxController {
  SettingLogController({required this.api});
  final ApiProviderSetting api;
  int selectIndex = 4;
  List<FileSystemEntity> logFileList = [];

  @override
  void onReady() {
    super.onReady();
    loadLogFeils(); // 在页面初始化时加载日志文件
  }

  Future<void> loadLogFeils() async {
    List<FileSystemEntity> logList = await LogManager.getLogFiles();
    logFileList = logList;
    update(); // 通知UI更新
  }

  // 删除指定日志文件
  Future<void> deleteLogFile(FileSystemEntity file) async {
    try {
      if (file is File && await file.exists()) {
        await file.delete(); // 删除文件
        logFileList.remove(file); // 更新本地文件列表
        update(); // 通知UI更新
      }
    } catch (e) {
      print("Failed to delete log file: $e");
    }
  }

  // 获取文件大小
  Future<int> getFileSize(FileSystemEntity file) async {
    try {
      if (file is File) {
        final stat = await file.stat();
        return stat.size;
      }
    } catch (e) {
      print("Error getting file size: $e");
    }
    return 0;
  }

  // 格式化文件大小
  String formatSize(int bytes) {
    if (bytes <= 0) return "0 KB";
    const kb = 1024;
    const mb = kb * 1024;
    if (bytes >= mb) {
      return "${(bytes / mb).toStringAsFixed(2)} MB";
    } else {
      return "${(bytes / kb).toStringAsFixed(2)} KB";
    }
  }

  // 打开日志文件
  Future<void> openLogFileWithSystemApp(FileSystemEntity file) async {
    try {
      final documentsDir = (await getApplicationDocumentsDirectory()).path;
      print("Can't open the documentsDir: $documentsDir");

      if (file is File) {
        final filePath = file.path; // 直接使用文件的路径

        // 使用 open_filex 打开本地文件
        final result = await OpenFilex.open(filePath);
        if (result.type != ResultType.done) {
          print("Can't open the file: $filePath");
        }
      }
    } catch (e) {
      print("Error opening log file with open_filex: $e");
    }
  }

  void compressLogFolder() {
    LogManager.compressLogFolder((double progress) {
      LogManager.log("progress:$progress");
    });
  }
}
