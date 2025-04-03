import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:path_provider/path_provider.dart';

class CacheManagerTool {
  /// 获取缓存大小
  static Future<String> getCacheSize() async {
    final tempDir = await getTemporaryDirectory();
    final cacheDir = Directory(tempDir.path);
    final size = await _getDirectorySize(cacheDir);
    return _formatSize(size);
  }

  /// 清理缓存
  static Future<void> clearCache() async {
    try {
      final tempDir = await getTemporaryDirectory();
      final cacheDir = Directory(tempDir.path);

      if (await cacheDir.exists()) {
        // 遍历并删除缓存目录中的所有文件和子目录
        for (var file in cacheDir.listSync()) {
          try {
            if (file is File) {
              await file.delete();
            } else if (file is Directory) {
              await file.delete(recursive: true);
            }
          } catch (e) {
            // 忽略某些无法删除的文件
            debugPrint("Failed to delete: ${file.path}, $e");
          }
        }
      }

      // 清理 flutter_cache_manager 管理的缓存
      await DefaultCacheManager().emptyCache();
    } catch (e) {
      debugPrint("Clear cache error: $e");
      rethrow;
    }
  }

  /// 私有方法：获取目录大小
  static Future<int> _getDirectorySize(Directory directory) async {
    int totalSize = 0;
    if (await directory.exists()) {
      final files = directory.listSync(recursive: true, followLinks: false);
      for (var file in files) {
        if (file is File) {
          totalSize += await file.length();
        }
      }
    }
    return totalSize;
  }

  /// 私有方法：格式化大小为 KB/MB
  static String _formatSize(int bytes) {
    if (bytes <= 0) return "0 KB";
    const kb = 1024;
    const mb = kb * 1024;
    if (bytes >= mb) {
      return "${(bytes / mb).toStringAsFixed(2)} MB";
    } else {
      return "${(bytes / kb).toStringAsFixed(2)} KB";
    }
  }
}
