import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';

import '../../components/group_announcement_view.dart';
import '../../components/group_members_view.dart';
import '../../routes/app_routes_conversation.dart';
import '../controllers/chat_personal_setting_controller.dart';

class ChatGroupSettingView extends GetView<ChatPersonalSettingController> {
  const ChatGroupSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvokedWithResult: (back, result) {
          if (!back) {
            Get.back();
          }
        },
        child: BasicView(
          title: "群设置",
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      _buildUserInfoSection(),
                      SizedBox(height: 10),
                      GroupMembersView(
                        currentCount: 12,
                        totalCount: 123,
                        avatars: [
                          "https://i.pravatar.cc/150?img=4",
                          "https://i.pravatar.cc/150?img=2",
                          "https://i.pravatar.cc/150?img=9",
                          "https://i.pravatar.cc/150?img=4",
                          "https://i.pravatar.cc/150?img=2",
                          "https://i.pravatar.cc/150?img=9",
                          "https://i.pravatar.cc/150?img=4",
                          "https://i.pravatar.cc/150?img=2",
                          "https://i.pravatar.cc/150?img=9",
                          "https://i.pravatar.cc/150?img=4",
                          "https://i.pravatar.cc/150?img=2",
                          "https://i.pravatar.cc/150?img=9",
                          "https://i.pravatar.cc/150?img=4",
                          "https://i.pravatar.cc/150?img=2",
                          "https://i.pravatar.cc/150?img=9",
                          "https://i.pravatar.cc/150?img=4",
                          "https://i.pravatar.cc/150?img=2",
                          "https://i.pravatar.cc/150?img=9",
                        ],
                        onArrowTap: () {},
                        onAddTap: () {},
                      ),
                      SizedBox(height: 10),
                      _buildGroupSettingsSection(context),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              _buildDeleteFriendButton(),
            ],
          ),
        ));
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

  /// **群设置**
  Widget _buildGroupSettingsSection(BuildContext context) {
    return Column(
      children: [
        MenuItem(
          radiusTop: true,
          title: '群主',
          value: "大军",
          hideRightArrow: true,
        ),
        // 群公告
        GroupAnnouncementView(announcement: '国家级非遗“跳马伕”、省级非遗“钟馗戏蝠”等依次亮相登场，还有当地富有特色的“马塘锣鼓”“泼花篮”等民俗表演，令围观的市民们目不暇接、流连忘返'),
        MenuItem(
          title: '群号',
          value: "1245662398",
          hideRightArrow: true,
        ),
        MenuItem(
          title: '群文件',
        ),
        MenuItem(
          title: '群签到',
          value: "未开启",
        ),
        MenuItem(
          title: '截屏惩罚',
          hideRightArrow: true,
          tingObject: CupertinoSwitch(
            value: true,
            onChanged: (v) {
              // controller.updateNoticeStatus(v);
            },
          ),
        ),
        MenuItem(
          title: '消息免打扰',
          hideRightArrow: true,
          tingObject: CupertinoSwitch(
            value: true,
            onChanged: (v) {
              // controller.updateNoticeStatus(v);
            },
          ),
        ),
        MenuItem(
          title: '群成员禁言',
          hideRightArrow: true,
          tingObject: CupertinoSwitch(
            value: true,
            onChanged: (v) {
              // controller.updateNoticeStatus(v);
            },
          ),
        ),
        MenuItem(
          title: '免审批入群',
          hideRightArrow: true,
          tingObject: CupertinoSwitch(
            value: true,
            onChanged: (v) {
              // controller.updateNoticeStatus(v);
            },
          ),
        ),
        MenuItem(
          title: '禁止查看群成员消息',
          hideRightArrow: true,
          tingObject: CupertinoSwitch(
            value: true,
            onChanged: (v) {
              // controller.updateNoticeStatus(v);
            },
          ),
        ),
        MenuItem(
          title: '允许群成员发送名片',
          hideRightArrow: true,
          tingObject: CupertinoSwitch(
            value: true,
            onChanged: (v) {
              // controller.updateNoticeStatus(v);
            },
          ),
        ),
        MenuItem(
          title: '允许群成员发起投票',
          hideRightArrow: true,
          tingObject: CupertinoSwitch(
            value: true,
            onChanged: (v) {
              // controller.updateNoticeStatus(v);
            },
          ),
        ),
        MenuItem(
          title: '允许群成员撤回',
          hideRightArrow: true,
          tingObject: CupertinoSwitch(
            value: true,
            onChanged: (v) {
              // controller.updateNoticeStatus(v);
            },
          ),
        ),
        MenuItem(
          title: '通过群号/群组名搜索到群组',
          hideRightArrow: true,
          tingObject: CupertinoSwitch(
            value: true,
            onChanged: (v) {
              // controller.updateNoticeStatus(v);
            },
          ),
        ),
        MenuItem(
          title: '禁止查看群消息',
          hideRightArrow: true,
          tingObject: CupertinoSwitch(
            value: true,
            onChanged: (v) {
              // controller.updateNoticeStatus(v);
            },
          ),
        ),
        MenuItem(
          title: '禁止群成员设置群昵称',
          hideRightArrow: true,
          tingObject: CupertinoSwitch(
            value: true,
            onChanged: (v) {
              // controller.updateNoticeStatus(v);
            },
          ),
        ),
        MenuItem(
          title: '群成员不可见',
          hideRightArrow: true,
          tingObject: CupertinoSwitch(
            value: true,
            onChanged: (v) {
              // controller.updateNoticeStatus(v);
            },
          ),
        ),
        MenuItem(
          title: '退群提醒群管理',
          hideRightArrow: true,
          tingObject: CupertinoSwitch(
            value: true,
            onChanged: (v) {
              // controller.updateNoticeStatus(v);
            },
          ),
        ),
        MenuItem(
          title: '发言频率限制',
          url: AppRoutesConversation.chatFrequency,
        ),
        MenuItem(
          title: '我的群昵称',
          value: "大军",
        ),
        MenuItem(
          title: '转让群组身份',
        ),
        MenuItem(
          title: '复制群组',
        ),
        MenuItem(
          title: '投诉',
        ),
        MenuItem(
          title: '群消息保存天数',
          radiusBottom: true,
          hideLine: true,
        ),
      ],
    );
  }

  /// **删除好友按钮**
  Widget _buildDeleteFriendButton() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          children: [
            ElevatedButton(
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
              child: Text("撤回全部消息"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
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
              child: Text("解散群组"),
            )
          ],
        ),
      ),
    );
  }
}
