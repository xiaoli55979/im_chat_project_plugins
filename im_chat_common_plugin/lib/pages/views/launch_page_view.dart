import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';

class LaunchPageView extends GetView<LaunchPageController> {
  const LaunchPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [controller.jtpInit.commonConfig.themeColor, controller.jtpInit.commonConfig.themeColor.withValues(alpha: 0.2)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              Center(
                child: Obx(() => Text(
                      '${SlocalCommon.getLocalizaContent(SlocalCommon.of(context).welcome)}${controller.jtpInit.commonConfig.appName.value}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    )),
              ),
              const SizedBox(height: 50), // 间距
              Text(
                SlocalCommon.getLocalizaContent(SlocalCommon.of(context).inputPassword),
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller.projectIdController,
                keyboardType: TextInputType.number,
                // obscureText: true, // 隐藏输入内容
                decoration: InputDecoration(
                  hintText: "${SlocalCommon.getLocalizaContent(SlocalCommon.of(context).inputPasswordHit)}",
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.green, width: 1.5),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Center(
                child: SizedBox(
                  width: 350,
                  child: MainButton(
                      onPressed: controller.validatePassword, text: SlocalCommon.getLocalizaContent(SlocalCommon.of(context).confirm)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
