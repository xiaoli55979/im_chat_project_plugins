import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';

import '../controllers/privacy_setting_controller.dart';

class PrivacySettingView extends GetView<PrivacySettingController> {
  const PrivacySettingView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<PrivacySettingController>(builder: (controller) {
      return BasicView(
        title: "隐私设置",
        body: ListView(
          padding: EdgeInsets.all(10),
          children: [
            MenuItem(
              radiusTop: true,
              radiusBottom: true,
              hideLine: true,
              title: '发送消息已收和已读回执',
              hideRightArrow: true,
              tingObject: CupertinoSwitch(
                value: true,
                onChanged: (v) {
                  // controller.updateNoticeStatus(v);
                },
              ),
            ),
            SizedBox(height: 10),
            MenuItem(
              radiusTop: true,
              radiusBottom: true,
              hideLine: true,
              title: '显示手机号码给好友',
              hideRightArrow: true,
              tingObject: CupertinoSwitch(
                value: true,
                onChanged: (v) {
                  // controller.updateNoticeStatus(v);
                },
              ),
            ),
            SizedBox(height: 10),
            _buildSectionTitle("加我为好友的方式"),
            MenuItem(
              radiusTop: true,
              title: '通过账号加我',
            ),
            MenuItem(
              radiusBottom: true,
              hideLine: true,
              title: '通过手机号搜索到我',
              hideRightArrow: true,
              tingObject: CupertinoSwitch(
                value: true,
                onChanged: (v) {
                  // controller.updateNoticeStatus(v);
                },
              ),
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
