import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarUtil {
  /// 通用 Snackbar 方法，可自定义颜色、时长、位置
  static void show({
    required String title,
    required String message,
    Color textColor = Colors.white,
    Color backgroundColor = Colors.black,
    SnackPosition position = SnackPosition.bottom,
    Duration duration = const Duration(seconds: 1),
    Duration animationDuration = const Duration(milliseconds: 300),
  }) {
    Get.snackbar(
      title,
      message,
      colorText: textColor,
      backgroundColor: backgroundColor,
      snackPosition: position,
      duration: duration,
      animationDuration: animationDuration,
      instantInit: true,
    );
  }

  /// 成功提示（默认黑色背景）
  static void showSuccess(String title, String message, {Duration? duration}) {
    show(
      title: title,
      message: message,
      backgroundColor: Colors.green,
      duration: duration ?? Duration(seconds: 1),
    );
  }

  /// 错误提示（默认红色背景）
  static void showError(String title, String message, {Duration? duration}) {
    show(
      title: title,
      message: message,
      backgroundColor: Colors.red,
      duration: duration ?? Duration(seconds: 2),
    );
  }

  /// 警告提示（默认橙色背景）
  static void showWarning(String title, String message, {Duration? duration}) {
    show(
      title: title,
      message: message,
      backgroundColor: Colors.orange,
      duration: duration ?? Duration(seconds: 2),
    );
  }
}
