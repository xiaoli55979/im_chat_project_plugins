import 'dart:math';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/api/provider.dart';
import 'package:im_chat_common_plugin/tools/apputil_handle.dart';

class MyShareController extends GetxController {
  MyShareController({required this.api});
  final ApiProvider api;
  final GlobalKey qrCodeScreenshotKey = GlobalKey();

  bool autoAddFriend = false;
  DateTime qrCodeExpiry = DateTime(2025, 2, 4, 15, 45);
  DateTime qrNewCodeExpiry = DateTime(2025, 2, 4, 15, 45);

  void toggleAutoAddFriend() {
    autoAddFriend = !autoAddFriend;
    update(); // 刷新 UI
  }

  void updateQrCodeExpiry(DateTime newDateTime) {
    qrCodeExpiry = newDateTime;
    update(); // 刷新 UI
  }

  String generateRandomString(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    Random random = Random();
    String result = '';

    for (int i = 0; i < length; i++) {
      result += chars[random.nextInt(chars.length)];
    }

    return "$result${DateUtil.formatDate(qrCodeExpiry, format: 'yyyy年MM月dd日 HH:mm')}";
  }

  String getQrCodeData() {
    String randomString = generateRandomString(8); // 生成8位随机字符串
    return "邀请码: $randomString 已保存";
  }

  void save() {
    ApputilHandle().saveScreenshotWithMargin(qrCodeScreenshotKey);
    // Get.snackbar("提示", "邀请码已保存", snackPosition: SnackPosition.bottom);
  }
}
