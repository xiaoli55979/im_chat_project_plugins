import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/api/user_provider.dart';
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';

class LaunchPageController extends GetxController {
  final UserProvider api;

  // 定义输入框控制器
  TextEditingController projectIdController = TextEditingController();
  LaunchPageController({required this.api});
  JtpComponentsInit jtpInit = JtpComponentsInit();
  @override
  void onClose() {
    projectIdController.dispose();
    super.onClose();
  }

  /// 验证密码逻辑
  void validatePassword() {
    final enteredPassword = projectIdController.text.trim();
    if (enteredPassword == "14725800") {
      MySharedPref.setProjectIdKey(enteredPassword);
      Get.offAllNamed("/login");
    }
  }
}
