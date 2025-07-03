import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/api/provider/user_provider.dart';
import 'package:im_chat_common_plugin/models/conversation_sync_data.dart';
import 'package:im_chat_common_plugin/services/global_service.dart';
import 'package:im_chat_common_plugin/tools/link_utils.dart';
import 'package:im_chat_common_plugin/tools/my_shared_pref.dart';
import 'package:im_chat_common_plugin/tools/tools_utils.dart';
import 'package:wukongimfluttersdk/entity/channel.dart';
import 'package:wukongimfluttersdk/entity/conversation.dart';
import 'package:wukongimfluttersdk/entity/msg.dart';
import 'package:wukongimfluttersdk/type/const.dart';
import 'package:wukongimfluttersdk/wkim.dart';

class HttpUtils {
  static UserProvider get api => Get.find<UserProvider>();

  static String getBaseUrl() {
    var appUrl = ToolsUtils.instance.isDebugModel
        ? LinkUtils.testBaseUrl
        : MySharedPref.getBaseUrl() ?? LinkUtils.prodBaseUrl;
    return "$appUrl/api/v1";
  }

  /// 同步会话列表
  static syncConversation(String lastSsgSeqs, int msgCount, int version,
      Function(WKSyncConversation) back) async {
    final result = await api.conversationSync(
      version: 0,
      lastMsgSeqs: "0",
      msgCount: msgCount,
      deviceUuid: ToolsUtils.instance.deviceInfo!.deviceId,
    );

    WKSyncConversation conversation = WKSyncConversation();
    conversation.conversations = [];
    if (result.isSuccess) {
      try {
        final conversationSyncData = result.responseData?.data;
        var list = conversationSyncData?.conversations ?? [];
        for (int i = 0; i < list.length; i++) {
          var conversations = list[i];
          WKSyncConvMsg convMsg = WKSyncConvMsg();
          convMsg.channelID = conversations.channelId ?? '';
          convMsg.channelType = conversations.channelType ?? 0;
          convMsg.unread = conversations.unread ?? 0;
          convMsg.timestamp = conversations.timestamp ?? 0;
          convMsg.lastMsgSeq = conversations.lastMsgSeq ?? 0;
          convMsg.lastClientMsgNO = conversations.lastClientMsgNo ?? '';
          convMsg.version = conversations.version ?? 0;
          var msgListJson = conversations.recents ?? [];
          List<WKSyncMsg> msgList = [];
          if (msgListJson.isNotEmpty) {
            for (int j = 0; j < msgListJson.length; j++) {
              var msgJson = msgListJson[j];
              msgList.add(getWKSyncMsg(msgJson));
            }
          }
          convMsg.recents = msgList;
          conversation.conversations!.add(convMsg);
        }

        // 更新wkim的群组信息
        var groups = conversationSyncData?.groups ?? [];
        for (var group in groups) {
          final channel = WKChannel(group.groupNo ?? '', 2);
          channel.channelName = group.name ?? '';
          channel.channelRemark = group.remark ?? '';
          channel.showNick = group.showNick ?? 0;
          channel.top = group.top ?? 0;
          channel.save = group.save ?? 0;
          channel.mute = group.mute ?? 0;
          channel.forbidden = group.forbidden ?? 0;
          channel.invite = group.invite ?? 0;
          channel.status = group.status ?? 1;
          channel.createdAt = group.createdAt ?? '';
          channel.updatedAt = group.updatedAt ?? '';
          channel.avatar = group.avatar ?? '';
          channel.version = group.version ?? 0;
          channel.remoteExtraMap = {
            'group_no': '',
          };
          channel.category = group.category ?? '';
          channel.receipt = group.receipt ?? 0;
          WKIM.shared.channelManager.addOrUpdateChannel(channel);
        }

        // 更新wkim的用户信息
        var listChannelUser = conversationSyncData?.users ?? [];
        for (var channelUser in listChannelUser) {
          final channel = WKChannel(channelUser.uid ?? '', 1);
          channel.channelName = channelUser.name ?? '';
          channel.channelRemark = channelUser.remark ?? '';
          channel.category = channelUser.category ?? '';
          channel.username = channelUser.username ?? '';
          channel.top = channelUser.top ?? 0;
          channel.mute = channelUser.mute ?? 0;
          channel.follow = channelUser.follow ?? 0;
          channel.isDeleted = channelUser.beDeleted ?? 0;
          channel.online = channelUser.online ?? 0;
          channel.lastOffline = channelUser.lastOffline ?? 0;
          channel.deviceFlag = channelUser.deviceFlag ?? 0;
          channel.robot = channelUser.robot ?? 0;
          channel.status = channelUser.status ?? 1;
          channel.avatar = channelUser.avatar ?? '';
          channel.remoteExtraMap = {
            'email': channelUser.email,
            'phone': channelUser.phone,
            'sex': channelUser.sex,
            'short_no': channelUser.shortNo
          };
          channel.receipt = channelUser.receipt ?? 0;
          WKIM.shared.channelManager.addOrUpdateChannel(channel);
        }
      } catch (e) {
        print('同步最近会话错误');
      }
      // Future.delayed(Duration(milliseconds: 2000), () {
        back(conversation);
      // });
    }
  }

  /// 同步频道消息
  static syncChannelMsg(
    String channelID,
    int channelType,
    int startMsgSeq,
    int endMsgSeq,
    int limit,
    int pullMode,
    Function(WKSyncChannelMsg) back,
  ) async {
    WKSyncChannelMsg msg = WKSyncChannelMsg();
    try {
      final result = await api.channelMsgSync(
        uid: '',
        channelID: channelID,
        channelType: channelType,
        startMsgSeq: startMsgSeq,
        endMsgSeq: endMsgSeq,
        limit: limit,
        pullMode: pullMode,
      );
      if(result.isSuccess) {
        final channelMsgSyncData = result.responseData?.data;
        msg.startMessageSeq = channelMsgSyncData?.startMessageSeq ?? 0;
        msg.endMessageSeq = channelMsgSyncData?.endMessageSeq ?? 0;
        msg.more = channelMsgSyncData?.more ?? 0;
        final messages = channelMsgSyncData?.messages ?? [];
        List<WKSyncMsg> msgList = [];
        for (int i = 0; i < messages.length; i++) {
          var json = messages[i];
          msgList.add(getWKSyncMsg(json));
        }
        msg.messages = msgList;
        back(msg);
      }
    } catch (e) {
      back(msg);
    }
  }

  /// 同步消息扩展信息
  static syncMsgExtra(String channelId, int channelType, int version) async {
    final httpClient = HttpClient();
    httpClient.badCertificateCallback =
        (X509Certificate cert, String host, int port) {
      // 信任所有证书
      return true;
    };
    final dio = Dio();
    dio.httpClientAdapter = DefaultHttpClientAdapter()
      ..onHttpClientCreate = (client) {
        return httpClient;
      };
    try {
      final result = await api.msgExtraSync(
        channelID: channelId,
        channelType: channelType,
        extraVersion: version,
        limit: 100,
        source: GlobalService.to.userInfo!.uid ?? '',
      );
      if (result.isSuccess) {
        var msgExtraList = result.responseData?.data ?? [];
        if (msgExtraList != null && msgExtraList.isNotEmpty) {
          List<WKMsgExtra> list = [];
          for (int i = 0; i < msgExtraList.length; i++) {
            final msgExtra = msgExtraList[i];
            WKMsgExtra extra = WKMsgExtra();
            extra.messageID = msgExtra.messageId?.toString() ?? '';
            extra.revoke = msgExtra.revoke ?? 0;
            extra.revoker = msgExtra.revoker ?? '';
            extra.readed = msgExtra.readed ?? 0;
            extra.readedCount = msgExtra.readedCount ?? 0;
            extra.isMutualDeleted = msgExtra.isMutualDeleted ?? 0;
            extra.extraVersion = msgExtra.extraVersion ?? 0;
            list.add(extra);
          }
          WKIM.shared.messageManager.saveRemoteExtraMsg(list);
        }
      }
    } catch (e) {
      print('同步消息扩展失败$e');
    }
  }

  static WKSyncMsg getWKSyncMsg(Recents recents) {
    WKSyncMsg msg = WKSyncMsg();
    msg.channelID = recents.channelId ?? '';
    msg.messageID = recents.messageId?.toString() ?? '';
    msg.channelType = recents.channelType ?? 0;
    msg.clientMsgNO = recents.clientMsgNo ?? '';
    msg.messageSeq = recents.messageSeq ?? 0;
    msg.fromUID = recents.fromUid ?? '';
    msg.isDeleted = recents.isDeleted ?? 0;
    msg.timestamp = recents.timestamp ?? 0;
    try {
      msg.payload = jsonDecode(utf8.decode(base64Decode(recents.payload ?? '')));
    } catch (e) {
      print('payload异常了');
    }
    // 解析扩展
    var messageExtra = recents.messageExtra;
    if (messageExtra != null) {
      var wkSyncExtraMsg = getMsgExtra(messageExtra);
      msg.messageExtra = wkSyncExtraMsg;
    }
    return msg;
  }

  /// 扩展信息
  static WKSyncExtraMsg getMsgExtra(MessageExtra messageExtra) {
    var extra = WKSyncExtraMsg();
    extra.messageID = messageExtra.messageId ?? 0;
    extra.messageIdStr = messageExtra.messageIdStr ?? '';
    extra.revoke = messageExtra.revoke ?? 0;
    extra.revoker = messageExtra.revoker ?? '';
    extra.readed = messageExtra.readed ?? 0;
    extra.readedCount = messageExtra.readedCount ?? 0;
    extra.isMutualDeleted = messageExtra.isMutualDeleted ?? 0;
    return extra;
  }

  /// 获取IM群组信息
  static getGroupInfo(String groupId) async {
    try {
      final result = await api.getIMGroupInfo(groupId: groupId);
      if (result.isSuccess) {
        var wkGroupInfoData = result.responseData?.data;
        var channel = await WKIM.shared.channelManager.getChannel(groupId, WKChannelType.group);
        channel ??= WKChannel(groupId, WKChannelType.group);
        channel.channelName = wkGroupInfoData?.name ?? '';
        channel.channelRemark = wkGroupInfoData?.remark ?? '';
        channel.avatar = wkGroupInfoData?.avatar ?? '';
        /// 清空缓存
        // ToolsUtils.clearSpecificImageCache("${HttpUtils.getBaseUrl()}/${channel.avatar}");
        // AvatarManager.saveAvatar(channel.avatar);
        WKIM.shared.channelManager.addOrUpdateChannel(channel);
      }
    } catch (e) {
      print("object_获取群组消息异常");
    }
  }

  /// 获取IM用户信息
  static getUserInfo(String uid) async {
    try {
      final result = await api.getIMUserInfo(uid: uid);
      if (result.isSuccess) {
        var wkUserInfoData = result.responseData?.data;
        var channel = await WKIM.shared.channelManager.getChannel(uid, WKChannelType.personal);
        channel ??= WKChannel(uid, WKChannelType.personal);
        channel.channelName = wkUserInfoData?.name ?? "";
        channel.avatar = wkUserInfoData?.avatar ?? '';
        channel.channelRemark = wkUserInfoData?.remark ?? '';
        channel.remoteExtraMap = {
          'phone': wkUserInfoData?.phone,
          'sign': wkUserInfoData?.sign,
          'short_no': wkUserInfoData?.shortNo,
          'email': wkUserInfoData?.email,
          'sex': wkUserInfoData?.sex,
        };
        /// 清空缓存
        // ToolsUtils.clearSpecificImageCache("${HttpUtils.getBaseUrl()}/${channel.avatar}");
        // AvatarManager.saveAvatar(channel.avatar);
        WKIM.shared.channelManager.addOrUpdateChannel(channel);
      }
    } catch (e) {
      print('获取用户信息失败$e');
    }
  }
}
