import 'dart:convert';

import 'package:crypto/crypto.dart';

String switchKey = "switchKey";

class SyncCodeGenerator {
  // 生成同步码
  String generateSyncCode() {
    DateTime now = DateTime.now();
    String timestamp = now.millisecondsSinceEpoch.toString();
    var bytes = utf8.encode(timestamp);
    var digest = sha256.convert(bytes);

    // 将时间戳和哈希值结合成一个字符串
    return "${digest.toString()}|$timestamp"; // 使用"|"分隔
  }

  // 验证同步码的有效性
  bool isSyncCodeValid(String syncCode) {
    // 分割同步码以获取生成的时间戳
    var parts = syncCode.split('|');
    if (parts.length != 2) return false; // 确保格式正确

    // 解析生成时间
    DateTime generatedTime = DateTime.fromMillisecondsSinceEpoch(int.parse(parts[1]));
    DateTime now = DateTime.now();
    final duration = now.difference(generatedTime);

    return duration.inMinutes < 10; // 检查是否在10分钟内
  }

  String getSwitchKey() {
    return switchKey;
  }
}
