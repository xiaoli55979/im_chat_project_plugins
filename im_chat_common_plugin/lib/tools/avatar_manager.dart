import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

import '../immanager/http_utils.dart';

class AvatarManager {
  /// 获取头像的本地存储路径
  static Future<String> getLocalAvatarPath(String avatar) async {
    final directory = await getApplicationDocumentsDirectory();
    String avatarBack = "${directory.path}/${avatar}";
    return avatarBack;
  }

  /// 下载并保存头像（如果已存在，则删除后再下载）
  static Future<void> saveAvatar(String avatar) async {
    final imageUrl = "${HttpUtils.getBaseUrl()}/$avatar"; // 生成完整URL
    final localPath = await getLocalAvatarPath(avatar);
    final file = File(localPath);

    // 如果文件已存在，先删除
    if (await file.exists()) {
      await file.delete();
    }

    try {
      await Dio().download(imageUrl, localPath);
      // print("头像已保存到: $localPath");
    } catch (e) {
      // print("下载头像失败: $e");
    }
  }

  /// 清除本地缓存的头像
  static Future<void> clearAvatarCache(String avatar) async {
    final localPath = await getLocalAvatarPath(avatar);
    final file = File(localPath);

    if (await file.exists()) {
      await file.delete();
      print("头像缓存已清除: $localPath");
    }
  }
}
