import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/components/basic_view.dart';

import '../controllers/chat_frequency_limit_controller.dart';

class ChatFrequencyLimitView extends GetView<ChatFrequencyLimitController> {
  const ChatFrequencyLimitView({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicView(
      title: "发言频率限制",
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRadioContainer(
              child: Obx(() => RadioListTile<int>(
                    title: const Text("不限制"),
                    value: 0,
                    activeColor: Colors.green,
                    groupValue: controller.selectedLimit.value,
                    onChanged: (value) => controller.setLimit(value!),
                    controlAffinity: ListTileControlAffinity.trailing,
                  )),
            ),
            const SizedBox(height: 10),
            _buildRadioContainer(
              child: Column(
                children: controller.limits
                    .where((limit) => limit > 0) // 过滤掉“不限制”选项
                    .map((limit) => Obx(() => RadioListTile<int>(
                          title: Text("每分钟 $limit 条"),
                          value: limit,
                          activeColor: Colors.green,
                          groupValue: controller.selectedLimit.value,
                          onChanged: (value) => controller.setLimit(value!),
                          controlAffinity: ListTileControlAffinity.trailing,
                        )))
                    .toList(),
              ),
            ),
            const SizedBox(height: 10),
            _buildBottomTip(),
          ],
        ),
      ),
    );
  }

  /// ** 圆角背景容器**
  Widget _buildRadioContainer({required Widget child}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10), // 圆角
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: child,
    );
  }

  /// **底部提示文本**
  Widget _buildBottomTip() {
    return const Padding(
      padding: EdgeInsets.only(top: 10, bottom: 20),
      child: Text(
        '选择"后台控制"时，根据后台的角色权限，限制群用户的发言频率；\n'
        '选择其他选项时，限制普通群成员发言频率，群主和群管理员不受限制。',
        style: TextStyle(fontSize: 14, color: Colors.grey),
        textAlign: TextAlign.start,
      ),
    );
  }
}
