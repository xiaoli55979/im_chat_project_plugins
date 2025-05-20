import 'package:get/get.dart';
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';
import 'package:wukongimfluttersdk/entity/conversation.dart';
import 'package:wukongimfluttersdk/entity/reminder.dart';
import 'package:wukongimfluttersdk/type/const.dart';
import 'package:wukongimfluttersdk/wkim.dart';

import '../../models/chat_message_model_entity.dart';
import '../../models/conversation_msg.dart';
import '../../routes/app_routes_conversation.dart';

class ConversationController extends GetxController {
  ConversationController({required this.api});
  final ApiProvider api;

  String _connectionStatusStr = "";
  int nodeId = 0;

  /// 消息列表
  var messages = <ChatMessageModelEntity>[];
  List<UIConversation> msgList = [];
  @override
  void onReady() {
    super.onReady();
    _getDataList();
    // 构造测试数据
    final conversation = UIConversation(WKUIConversationMsg());
    msgList.add(conversation);
    _initListener();
  }

  /// 加载历史消息列表
  void _getDataList() {
    Future<List<WKUIConversationMsg>> list = WKIM.shared.conversationManager.getAll();
    list.then((result) {
      // print("object_getDataList:${result.length}");
      for (var i = 0; i < result.length; i++) {
        msgList.add(UIConversation(result[i]));
      }
      update();
    });
  }

  /// 加载消息列表
  _initListener() {
    // 监听连接状态事件
    WKIM.shared.connectionManager.addOnConnectionStatus('home', (status, reason, connInfo) {
      if (status == WKConnectStatus.connecting) {
        _connectionStatusStr = '连接中...';
      } else if (status == WKConnectStatus.success) {
        if (connInfo != null) {
          nodeId = connInfo.nodeId;
        }
        _connectionStatusStr = '连接成功(节点:${connInfo?.nodeId})';
      } else if (status == WKConnectStatus.noNetwork) {
        _connectionStatusStr = '网络异常';
      } else if (status == WKConnectStatus.syncMsg) {
        _connectionStatusStr = '同步消息中...';
      } else if (status == WKConnectStatus.kicked) {
        _connectionStatusStr = '未连接，在其他设备登录';
      } else if (status == WKConnectStatus.fail) {
        _connectionStatusStr = '未连接';
      } else if (status == WKConnectStatus.syncCompleted) {
        _connectionStatusStr = '连接成功(节点:)';
      }
      // if (mounted) {
      //   setState(() {});
      // }
    });

    WKIM.shared.conversationManager.addOnClearAllRedDotListener("chat_conversation", () {
      // print("object_addOnClearAllRedDotListener");
      for (var i = 0; i < msgList.length; i++) {
        msgList[i].msg.unreadCount = 0;
      }
      update();
    });
    WKIM.shared.conversationManager.addOnRefreshMsgListListener('chat_conversation', (msgs) async {
      print("object_addOnRefreshMsgListListener_messages:${msgs.length}");
      if (msgs.isEmpty) {
        return;
      }
      List<UIConversation> list = [];
      for (WKUIConversationMsg msg in msgs) {
        bool isAdd = true;
        for (var i = 0; i < msgList.length; i++) {
          if (msgList[i].msg.channelID == msg.channelID) {
            msgList[i].msg = msg;
            msgList[i].lastContent = '';
            msgList[i].reminders = null;
            isAdd = false;
            break;
          }
        }
        if (isAdd) {
          list.add(UIConversation(msg));
        }
      }
      if (list.isNotEmpty) {
        msgList.addAll(list);
      }
      update();
    });

    // 监听刷新channel资料事件
    WKIM.shared.channelManager.addOnRefreshListener("cover_chat", (channel) {
      // print("object_addOnRefreshListener");
      for (var i = 0; i < msgList.length; i++) {
        if (msgList[i].msg.channelID == channel.channelID && msgList[i].msg.channelType == channel.channelType) {
          msgList[i].msg.setWkChannel(channel);
          msgList[i].channelAvatar = "${HttpUtils.getBaseUrl()}/${channel.avatar}";
          msgList[i].channelName = channel.channelName;
          update();
          break;
        }
      }
    });
  }

  // void _loadMessages() async {
  //   try {
  //     await Future.delayed(const Duration(milliseconds: 200));
  //     var uuid = const Uuid();
  //
  //     /// **生成 8 个单聊数据**
  //     for (int i = 2; i <= 3; i++) {
  //       ChatMessageModelEntity messageModel = ChatMessageModelEntity();
  //       messageModel.userId = uuid.v4();
  //       messageModel.avatar = "https://i.pravatar.cc/150?img=$i";
  //       messageModel.username = "User $i";
  //       messageModel.preview = "Hello from User $i!";
  //       messageModel.time = "10:0$i AM";
  //       messageModel.isGroup = false;
  //       messageModel.unreadCount = i % 3;
  //       messageModel.onLine = i % 2;
  //       messages.add(messageModel);
  //     }
  //
  //     /// **生成 5 个群聊数据**
  //     for (int i = 1; i <= 3; i++) {
  //       ChatMessageModelEntity messageModel = ChatMessageModelEntity();
  //       messageModel.userId = uuid.v4();
  //       messageModel.avatar = _generateGroupAvatar(i); // 生成群组头像
  //       messageModel.username = "Group Chat $i";
  //       messageModel.preview = "New message in Group $i!";
  //       messageModel.time = "11:0$i AM";
  //       messageModel.isGroup = true;
  //       messageModel.unreadCount = i % 4;
  //       messageModel.onLine = i % 2;
  //       messages.add(messageModel);
  //     }
  //   } catch (e) {
  //     Get.snackbar('错误', '加载消息失败，请稍后重试', snackPosition: SnackPosition.bottom);
  //   }
  //
  //   update();
  // }

  // **生成群组头像**
  String _generateGroupAvatar(int groupId) {
    List<int> avatars = List.generate(3, (index) => (groupId * 2 + index) % 10 + 1);
    return avatars.map((id) => "https://i.pravatar.cc/150?img=$id").join(",");
  }

  String getChannelAvatarURL(UIConversation uiConversation) {
    if (uiConversation.channelAvatar == '') {
      uiConversation.msg.getWkChannel().then((channel) {
        if (channel != null) {
          uiConversation.channelAvatar = "${HttpUtils.getBaseUrl()}/${channel.avatar}";
        }
      });
    }
    return uiConversation.channelAvatar;
  }

  void getChannelOnlineStatus(UIConversation uiConversation) {
    uiConversation.msg.getWkChannel().then((channel) {
      if (channel != null) {}
    });
  }

  String getChannelName(UIConversation uiConversation) {
    if (uiConversation.channelName == '') {
      uiConversation.msg.getWkChannel().then((channel) {
        if (channel != null) {
          if (channel.channelRemark == '') {
            uiConversation.channelName = channel.channelName;
          } else {
            uiConversation.channelName = channel.channelRemark;
          }
          if (uiConversation.channelName.isNotEmpty && channel.channelType == WKChannelType.group) {
            uiConversation.channelName = "👥${uiConversation.channelName}";
          }
          if (uiConversation.channelName == '') {
            WKIM.shared.channelManager.fetchChannelInfo(uiConversation.msg.channelID, uiConversation.msg.channelType);
          }
        } else {
          WKIM.shared.channelManager.fetchChannelInfo(uiConversation.msg.channelID, uiConversation.msg.channelType);
        }
      });
    }
    return uiConversation.channelName;
  }

  String getReminderText(UIConversation uiConversation) {
    String content = "";
    // print("object_reminders:${uiConversation.reminders?.length}");
    if (uiConversation.reminders == null) {
      uiConversation.msg.getReminderList().then((value) {
        uiConversation.reminders = value;
        update();
      });
      return content;
    }
    if (uiConversation.reminders!.isNotEmpty) {
      for (var i = 0; i < uiConversation.reminders!.length; i++) {
        if (uiConversation.reminders![i].type == WKMentionType.wkReminderTypeMentionMe && uiConversation.reminders![i].done == 0) {
          content = uiConversation.reminders![i].data;
          content = '[有人@你]';
          break;
        }
      }
    }
    return content;
  }

  String getShowContent(UIConversation uiConversation) {
    if (uiConversation.lastContent == '') {
      uiConversation.msg.getWkMsg().then((value) {
        if (value != null && value.messageContent != null) {
          uiConversation.lastContent = value.messageContent!.displayText();
          update();
        }
      });
      return '';
    }
    return uiConversation.lastContent;
  }

  /// 打开聊天页面
  void openChat(UIConversation message) {
    // 跳转到聊天页面，并传递消息数据
    // Get.toNamed('/chat', arguments: message);
    String channelID = message.msg.channelID;
    int channelType = message.msg.channelType;
    Get.toNamed(AppRoutesConversation.chat, arguments: {"channelID": channelID, "channelType": channelType});
  }

  /// 打开搜索页面
  void openSearch() {
    Get.toNamed(AppRoutesCommon.search);
  }
}
