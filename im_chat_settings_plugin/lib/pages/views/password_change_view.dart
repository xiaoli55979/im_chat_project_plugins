import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/password_change_controller.dart';

class PasswordChangeView extends GetView<PasswordChangeController> {
  const PasswordChangeView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text("修改密码")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 旧密码输入框 + 忘记密码
              Column(
                children: [
                  TextFormField(
                    controller: controller.oldPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "请输入旧密码",
                    ),
                    validator: controller.validateOldPassword,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        onPressed: controller.onForgotPassword,
                        child: const Text("忘记密码？", style: TextStyle(color: Colors.blue)),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // 新密码输入框
              TextFormField(
                controller: controller.newPasswordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: "请输入新密码（不少于8位）"),
                validator: controller.validateNewPassword,
              ),
              const SizedBox(height: 10),

              // 密码要求提示
              const Text(
                "密码 8-30 位，至少包含字母和数字，不能使用空格",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 20),

              // 确认新密码输入框
              TextFormField(
                controller: controller.confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: "确认新密码"),
                validator: controller.validateConfirmPassword,
              ),
              const SizedBox(height: 40),

              // 确认修改按钮
              Obx(() => ElevatedButton(
                    onPressed: controller.isLoading.value ? null : controller.onConfirmChange,
                    style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 48)),
                    child: controller.isLoading.value ? const CircularProgressIndicator(color: Colors.white) : const Text("确认修改"),
                  )),

              // 错误提示
              Obx(() {
                if (controller.errorMessage.value.isNotEmpty) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      controller.errorMessage.value,
                      style: const TextStyle(color: Colors.red, fontSize: 14),
                    ),
                  );
                }
                return const SizedBox();
              }),
            ],
          ),
        ),
      ),
    );
  }
}
