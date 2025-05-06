import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';
import 'package:screenshot_callback_plus/screenshot_callback_plus.dart';
import 'package:uuid/uuid.dart';
import 'package:wukongimfluttersdk/entity/channel.dart';
import 'package:wukongimfluttersdk/entity/msg.dart';
import 'package:wukongimfluttersdk/wkim.dart';

import '../../handle/message_content_type.dart';
import '../../handle/message_handle_manager.dart';
import '../../handle/message_type_handle.dart';
import '../../models/conversation_msg.dart';
import '../../routes/app_routes_conversation.dart';
import '../../tools/chat_send_message_tools.dart';
import 'msg.dart';

enum ChannelType {
  private(1),
  group(2);

  final int value;
  const ChannelType(this.value);

  /// 根据整数值获取对应的枚举类型
  static ChannelType? fromValue(int value) {
    return ChannelType.values.firstWhereOrNull((e) => e.value == value);
  }
}

class ChatController extends GetxController {
  ChatController({required this.api});
  final ApiProvider api;

  /// 当前频道名称
  String channelName = "";

  /// 截屏检测
  late ScreenshotCallbackPlus screenshotCallback;

  /// 消息列表
  List<types.Message> messages = [];

  /// 存储引用的消息
  types.Message? quotedMessage;

  /// 请求焦点
  bool requestFocus = false;

  /// 焦点变化了
  bool focusChange = false;

  /// 是否是多选
  bool isMultiple = false;
  /// isSelectedMultiple 是否选中多选
  bool isSelectedMultiple = true;

  /// 是否回复
  bool isReply = false;

  /// 消息
  UIConversation? messageModel;

  List<UIMsg> msgList = [];

  List<types.Message> didSelectedMsgs = [];

  String channelID = "";
  int channelType = 0;

  @override
  void onReady() {
    super.onReady();
    initLoad();
    initListener();
  }

  @override
  void onClose() {
    // 移除监听
    WKIM.shared.messageManager.removeNewMsgListener('chat');
    WKIM.shared.messageManager.removeOnRefreshMsgListener('chat');
    WKIM.shared.messageManager.removeDeleteMsgListener('chat');
    WKIM.shared.channelManager.removeOnRefreshListener('chat');
    super.onClose();
  }

  Future<void> initLoad() async {
    initScreenshotCallback();

    final arguments = Get.arguments as Map<String, dynamic>?; // 先解析成 Map
    if (arguments != null) {
      final channelid = arguments["channelID"] as String?;
      final channeltype = arguments["channelType"] as int?;
      print("object_channeltype:$channeltype");

      if (channelid != null && channeltype != null) {
        channelID = channelid;
        channelType = channeltype;
        WKIM.shared.channelManager.getChannel(channelID, channelType).then((channel) {
          WKIM.shared.channelManager.fetchChannelInfo(channelID, channelType);
          channelName = '${channel?.channelName}';
          update();
        });
      }
    }

    /// 获取群信息
    var res = await api.getGroupInfo(groupId: channelID);
  }

  void initListener() {
    WKIM.shared.messageManager.getOrSyncHistoryMessages(
      channelID,
      channelType,
      0,
      true,
      1,
      100,
      0,
      (List<WKMsg> list) {
        messages = MessageHandleManager.transferMessage(list);
        print("object_getOrSyncHistoryMessages_messages:${messages.length}");
        update();
      },
      () {
        print("object_getOrSyncHistoryMessages");
      },
    );

    // 监听刷新频道
    WKIM.shared.channelManager.addOnRefreshListener('chat', (channel) {
      if (channelID == channel.channelID) {
        channelName = channel.channelName;
      }
      for (var i = 0; i < msgList.length; i++) {
        if (msgList[i].wkMsg.fromUID == channel.channelID) {
          msgList[i].wkMsg.setFrom(channel);
          print("object_addOnRefreshListener:${channel.channelName} channelId:${channel.channelID}");
        }
      }
      update();
    });

    // 监听发送消息入库返回
    WKIM.shared.messageManager.addOnMsgInsertedListener((wkMsg) {
      print("object_addOnMsgInsertedListener:${wkMsg.content}");
      msgList.add(UIMsg(wkMsg));
      update();
      // Future.delayed(const Duration(milliseconds: 500), () {
      //   _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      // });
    });

    // 监听新消息
    WKIM.shared.messageManager.addOnNewMsgListener('chat', (msgs) {
      print('收到${msgs.length}条新消息');
      for (var i = 0; i < msgs.length; i++) {
        if (msgs[i].channelID != channelID) {
          continue;
        }
        if (msgs[i].setting.receipt == 1) {
          // 消息需要回执
          // testReceipt(msgs[i]);
        }

        if (msgs[i].isDeleted == 0) {
          // msgList.add(UIMsg(msgs[i]));
          print('收到${msgs[i].content}消息');
          messages.insert(0, MessageTypeHandle.transferMessage(msgs[i]));
          print('messages_count:${messages.length}');
        }
      }
      update();
      // Future.delayed(const Duration(milliseconds: 500), () {
      //   _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      // });
    });

    // 监听消息刷新
    WKIM.shared.messageManager.addOnRefreshMsgListener('chat', (wkMsg) {
      print('addOnRefreshMsgListener:${wkMsg.content}');
      for (var i = 0; i < msgList.length; i++) {
        if (msgList[i].wkMsg.clientMsgNO == wkMsg.clientMsgNO) {
          msgList[i].wkMsg.messageID = wkMsg.messageID;
          msgList[i].wkMsg.messageSeq = wkMsg.messageSeq;
          msgList[i].wkMsg.status = wkMsg.status;
          msgList[i].wkMsg.wkMsgExtra = wkMsg.wkMsgExtra;
          break;
        }
      }
      // setState(() {});
      update();
    });

    // 监听删除消息
    WKIM.shared.messageManager.addOnDeleteMsgListener('chat', (clientMsgNo) {
      print('addOnDeleteMsgListener:${clientMsgNo}');
      for (var i = 0; i < msgList.length; i++) {
        if (msgList[i].wkMsg.clientMsgNO == clientMsgNo) {
          msgList.removeAt(i);
          update();
          break;
        }
      }
    });

    // 清除聊天记录
    WKIM.shared.messageManager.addOnClearChannelMsgListener("chat", (channelId, channelType) {
      print('addOnClearChannelMsgListener:${channelId}');
      if (channelID == channelId) {
        msgList.clear();
        // setState(() {});
        update();
      }
    });
  }

  static Future<void> initScreenshotCallback() async {
    ScreenshotCallbackPlus screenshotCallback = ScreenshotCallbackPlus();
    screenshotCallback.addListener(() {
      print("object_screenshotCallback");
    });

    screenshotCallback.addListener(() {
      print("object_screenshotCallback2");
    });
  }

  /// 获取当前用户信息
  types.User getUser() {
    return types.User(id: "1234");
  }


  bool isOwner(types.Message msg) {
    final currentId = getUser().id;
    if (currentId == msg.id) { return true; } else {
      return false;
    }
  }

  /// 添加一条消息
  void addMessage(types.Message message) {
    messages.insert(0, message);
    update();
  }

  /// 工具栏快捷入口
  void handleToolsPressed(int index) {
    print("object_handleToolsPressed");
    ChatSendMessageTools().handleToolsPressed(
      index,
      user: getUser(),
      onMessageCreated: (types.Message message) {
        addMessage(message);
      },
    );
  }

  /// 点击背景
  void backgroundTap() {
    focusChange = !focusChange;
    isSelectedMultiple != isSelectedMultiple;
    isMultiple != isMultiple;
    update();
  }

  /// 点击消息
  void handleMessageTap(BuildContext _, types.Message message) async {
    backgroundTap();
    print("object_handleMessageTap");
    try {
      int type = int.tryParse('${message.metadata?["type"]}') ?? -1;

      /// 文件消息
      if (message is types.FileMessage) {
        ChatSendMessageTools.openFileMessage(message, messages, () {});
      } else if (type == MessageContentType.CARD) {
        WKMsg? msg = message.metadata?["wkMsg"];
        WKChannel? channel = msg?.getFrom();
        showUserInfo(channel!.channelID);
      }
    } catch (_) {}
  }

  /// 显示用户详情
  void showUserInfo(String uid) {
    print("object_showUserInfo:$uid");
    Get.toNamed(AppRoutesCommon.userInfo, arguments: {"uid": uid});
  }

  ///
  void handlePreviewDataFetched(types.TextMessage message, types.PreviewData previewData) {
    print("object_handlePreviewDataFetched");
  }

  /// 发送文本消息
  void handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: getUser(),
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
      status: types.Status.sent,
    );
    addMessage(textMessage);
  }

  /// 到群设置
  void gotoGroupSetting() {
    final route = switch (ChannelType.fromValue(channelType)) {
      ChannelType.private => AppRoutesConversation.chatSetting,
      ChannelType.group => AppRoutesConversation.chatGroupSetting,
      _ => null, // 防止传入无效的 channelType
    };

    if (route != null) {
      Get.toNamed(route, arguments: {"channelID": channelID, "channelType": channelType});
    }
  }

  /// 已选择消息
  void didSelectedMsg(types.Message msg) {
    if (didSelectedMsgs.contains(msg)) {
      didSelectedMsgs.remove(msg);
    } else {
      didSelectedMsgs.add(msg);
    }
  }
}
