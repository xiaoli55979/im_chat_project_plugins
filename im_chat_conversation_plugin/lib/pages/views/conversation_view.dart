import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';
import 'package:im_chat_common_plugin/util/asset_util.dart';
import 'package:im_chat_resource_plugin/generated/assets.dart';

import '../../models/chat_message_model_entity.dart';
import '../../models/conversation_msg.dart';
import '../controllers/conversation_controller.dart';

class ConversationView extends GetView<ConversationController> {
  const ConversationView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConversationController>(builder: (controller) {
      return BasicView(
        title: "消息",
        actions: [
          DropdownUtils.buildAddButtonDropdown(
            onChanged: (DropdownOption? newValue) {
              if (newValue != null && newValue.index == 3) {
                ToolsUtils.onQrcodeScan();
              }
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("你选择了: ${newValue?.text}")),
              );
            },
          ),
          SizedBox(width: 10),
        ],
        body: Column(
          children: [
            // 顶部搜索框
            SearchBarView(),
            // 消息列表
            Expanded(
              child: ListView.separated(
                itemCount: controller.msgList.length,
                separatorBuilder: (context, index) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  // final message = controller.messages[index];
                  final msgModel = controller.msgList[0];
                  return Container(
                    color: Colors.white,
                    child: ListTile(
                      leading: Stack(
                        children: [
                          AdvancedAvatar(
                            size: 45,
                            animated: true,
                            statusColor: Colors.green,
                            image: CachedNetworkImageProvider(
                              controller.getChannelAvatarURL(msgModel),
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: ImageTools.getImageProvider("default_avatar.png", isCommon: true)!,
                                fit: BoxFit.fill,
                              ),
                            ),
                            children: [
                              if (msgModel.msg.unreadCount > 0)
                                AlignCircular(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 0.5,
                                      ),
                                      color: Colors.red,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Text(
                                      '${msgModel.msg.unreadCount}',
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          // CircleAvatar(
                          //   backgroundImage: NetworkImage(message.avatar),
                          //   radius: 24,
                          // ),
                        ],
                      ),
                      title: Row(
                        children: [
                          Text(
                            "标题",
                            // controller.getChannelName(msgModel),
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Visibility(
                              visible: true,
                              child: SizedBox(width: 6,)),
                          Visibility(
                              visible: true,
                              child: AssetUtil.asset(Assets.conversationSystemMsg, width: 20))
                        ],
                      ),
                      subtitle: Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Row(
                          children: [
                            Text(
                              "上次推荐的房子满意吗",
                              // controller.getReminderText(msgModel),
                              style: const TextStyle(color: Colors.grey, fontSize: 14),
                              maxLines: 1,
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                "yes",
                                // controller.getShowContent(msgModel),
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      trailing: Text(
                        "20:20",
                        // ToolsUtils.formatDateTime(msgModel.msg.lastMsgTimestamp),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      onTap: () {
                        // 处理消息点击事件
                        controller.openChat(msgModel);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
