import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';

class PasswordChangeController extends GetxController {
  PasswordChangeController({required this.api});
  final ApiProvider api;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final RxBool isLoading = false.obs;
  final RxString errorMessage = "".obs;

  @override
  void onReady() {
    super.onReady();
  }

  /// 校验旧密码
  String? validateOldPassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "请输入旧密码";
    }
    return null;
  }

  /// 校验新密码
  String? validateNewPassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "请输入新密码";
    }
    if (value.length < 8 || value.length > 30) {
      return "密码长度必须在 8-30 位之间";
    }
    if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]+$').hasMatch(value)) {
      return "密码必须包含字母和数字，不能使用空格";
    }
    return null;
  }

  /// 校验确认密码
  String? validateConfirmPassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "请确认新密码";
    }
    if (value != newPasswordController.text) {
      return "两次输入的新密码不一致";
    }
    return null;
  }

  /// 确认修改密码
  Future<void> onConfirmChange() async {
    if (!formKey.currentState!.validate()) {
      return; // 如果表单验证失败，则不继续
    }

    isLoading.value = true;
    errorMessage.value = "";

    try {
      // final response = await api.changePassword(
      //   oldPasswordController.text.trim(),
      //   newPasswordController.text.trim(),
      // );
      //
      // if (response.success) {
      //   Get.snackbar("成功", "密码修改成功，请重新登录");
      //   Get.offAllNamed("/login"); // 修改成功后跳转到登录页
      // } else {
      //   errorMessage.value = response.message ?? "密码修改失败";
      // }
    } catch (e) {
      errorMessage.value = "网络错误，请稍后再试";
    } finally {
      isLoading.value = false;
    }
  }

  /// 处理“忘记密码”按钮逻辑
  void onForgotPassword() {
    Get.toNamed("/forgot-password");
  }

  @override
  void onClose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
