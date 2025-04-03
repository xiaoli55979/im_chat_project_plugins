import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';

import '../controllers/chat_personal_setting_controller.dart';

class ChatPersonalSettingView extends GetView<ChatPersonalSettingController> {
  const ChatPersonalSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicView(
      title: "聊天设置",
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  _buildUserInfoSection(),
                  SizedBox(height: 10),
                  _buildChatFilesSection(context),
                  SizedBox(height: 10),
                  _buildPrivacySettingsSection(context),
                  SizedBox(height: 10),
                  _buildReportSection(),
                ],
              ),
            ),
          ),
          _buildDeleteFriendButton(),
        ],
      ),
    );
  }

  /// **用户信息模块**
  Widget _buildUserInfoSection() {
    return MenuItem(
      radiusTop: true,
      radiusBottom: true,
      title: '用户名称',
      hideLine: true,
      object: AdvancedAvatar(
        size: 50,
        statusColor: Colors.green,
        image: NetworkImage("https://i.pravatar.cc/150?img=3"),
      ),
    );
  }

  /// **聊天文件模块**
  Widget _buildChatFilesSection(BuildContext context) {
    return MenuItem(
      radiusTop: true,
      radiusBottom: true,
      title: '聊天文件',
      hideLine: true,
      icon: Icons.folder,
    );
  }

  /// **隐私 & 通知设置**
  Widget _buildPrivacySettingsSection(BuildContext context) {
    return Column(
      children: [
        MenuItem(
          radiusTop: true,
          title: '分享名片',
          icon: Icons.share,
        ),
        MenuItem(
          title: '消息免打扰',
          icon: Icons.notifications_off,
        ),
        MenuItem(
          radiusBottom: true,
          title: '截屏惩罚',
          hideLine: true,
          icon: Icons.screenshot,
        ),
      ],
    );
  }

  /// **投诉模块**
  Widget _buildReportSection() {
    return MenuItem(
      radiusTop: true,
      radiusBottom: true,
      title: '投诉',
      hideLine: true,
      icon: Icons.report,
    );
  }

  /// **删除好友按钮**
  Widget _buildDeleteFriendButton() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: ElevatedButton(
          onPressed: () {
            print("object_buildDelete");
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            minimumSize: Size(double.infinity, 48), // 按钮撑满
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text("删除好友"),
        ),
      ),
    );
  }
}
