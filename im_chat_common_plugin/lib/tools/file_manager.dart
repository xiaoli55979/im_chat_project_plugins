import 'dart:io';

import 'package:path_provider/path_provider.dart';

class ChatFile {
  String fileId;
  String fileName;
  String fileType; // 图片、视频、文件等
  DateTime date;
  String chatId; // 聊天ID
  String localPath; // 文件在本地的存储路径

  ChatFile({
    required this.fileId,
    required this.fileName,
    required this.fileType,
    required this.date,
    required this.chatId,
    required this.localPath,
  });
}

class FileManager {
  List<ChatFile> _files = [];

  // 获取本地存储目录
  Future<String> _getLocalDirectory() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  // 将文件保存到本地
  Future<void> saveFileToLocal(File file, String fileName, String chatId, String groupId) async {
    final directoryPath = await _getLocalDirectory();
    final localPath = '$directoryPath/$fileName';

    // 将文件复制到本地目录
    await file.copy(localPath);

    // 创建文件元数据并添加到文件列表
    ChatFile newFile = ChatFile(
      fileId: DateTime.now().millisecondsSinceEpoch.toString(),
      fileName: fileName,
      fileType: file.path.split('.').last, // 通过扩展名来判断文件类型
      date: DateTime.now(),
      chatId: chatId,
      localPath: localPath,
    );

    _files.add(newFile);
  }

  // 从本地获取文件
  Future<File> getFileFromLocal(String fileId) async {
    final file = _files.firstWhere((file) => file.fileId == fileId);
    return File(file.localPath);
  }

  // 获取某个聊天的所有文件
  List<ChatFile> getFilesByChatId(String chatId) {
    return _files.where((file) => file.chatId == chatId).toList();
  }

  // 根据聊天 ID、群组 ID 和文件名获取文件路径
  Future<String?> getFilePathByName(String chatId, String groupId, String fileName) async {
    try {
      final file = _files.firstWhere((file) => file.chatId == chatId && file.fileName == fileName);
      return file.localPath;
    } catch (e) {
      return null; // 如果没有找到文件，返回 null
    }
  }

  // 删除文件
  void deleteFile(String fileId) {
    final file = _files.firstWhere((file) => file.fileId == fileId);
    final filePath = file.localPath;
    File(filePath).deleteSync(); // 删除本地文件
    _files.removeWhere((file) => file.fileId == fileId);
  }

  // 获取所有文件
  List<ChatFile> getAllFiles() {
    return _files;
  }

}
