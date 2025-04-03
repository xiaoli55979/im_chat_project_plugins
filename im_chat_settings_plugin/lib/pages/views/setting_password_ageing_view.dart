import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';

import '../controllers/setting_password_ageing_controller.dart';

class SettingPasswordAgeingView extends GetView<SettingPasswordAgeingController> {
  const SettingPasswordAgeingView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<SettingPasswordAgeingController>(builder: (controller) {
      return BasicView(
        title: '密码保存时效',
        body: ListView(
          padding: EdgeInsets.all(10),
          children: [
            MenuItem(
              radiusTop: true,
              title: '不保存',
              hideRightArrow: true,
              tingObject: Icon(
                controller.selectIndex == 1 ? Icons.check_circle : Icons.circle_outlined,
                color: controller.selectIndex == 1 ? theme.primaryColor : Colors.grey,
              ),
              onPressed: () {
                controller.updateSelect(1);
              },
            ),
            MenuItem(
              title: '保存七天',
              hideRightArrow: true,
              tingObject: Icon(
                controller.selectIndex == 2 ? Icons.check_circle : Icons.circle_outlined,
                color: controller.selectIndex == 2 ? theme.primaryColor : Colors.grey,
              ),
              onPressed: () {
                controller.updateSelect(2);
              },
            ),
            MenuItem(
              title: '保存30天',
              hideRightArrow: true,
              tingObject: Icon(
                controller.selectIndex == 3 ? Icons.check_circle : Icons.circle_outlined,
                color: controller.selectIndex == 3 ? theme.primaryColor : Colors.grey,
              ),
              onPressed: () {
                controller.updateSelect(3);
              },
            ),
            MenuItem(
              radiusBottom: true,
              hideLine: true,
              title: "永久",
              hideRightArrow: true,
              tingObject: Icon(
                controller.selectIndex == 4 ? Icons.check_circle : Icons.circle_outlined,
                color: controller.selectIndex == 4 ? theme.primaryColor : Colors.grey,
              ),
              onPressed: () {
                controller.updateSelect(4);
              },
            ),
          ],
        ),
      );
    });
  }

  // 分组标题构建函数
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey,
        ),
      ),
    );
  }
}
