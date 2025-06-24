import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToastUtil {

  ///SnackBart提示
  static showSnackBar({
    required String content,
    BuildContext? context,
    Duration? duration,
    Color? backgroundColor,
  }) {
    ScaffoldMessenger.of(context ?? Get.context!).showSnackBar(
      SnackBar(
        content: Text(content),
        duration: duration ?? Duration(seconds: 1),
        backgroundColor: backgroundColor ?? Colors.black,
      ),
    );
  }
}