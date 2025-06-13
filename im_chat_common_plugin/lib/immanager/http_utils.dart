import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/api/provider/user_provider.dart';
import 'package:im_chat_common_plugin/immanager/user_info.dart';
import 'package:im_chat_common_plugin/tools/link_utils.dart';
import 'package:im_chat_common_plugin/tools/my_shared_pref.dart';
import 'package:im_chat_common_plugin/tools/tools_utils.dart';
import 'package:wukongimfluttersdk/entity/channel.dart';
import 'package:wukongimfluttersdk/entity/conversation.dart';
import 'package:wukongimfluttersdk/entity/msg.dart';
import 'package:wukongimfluttersdk/type/const.dart';
import 'package:wukongimfluttersdk/wkim.dart';

import '../api/provider/im_provider.dart';
import '../services/global_service.dart';


class HttpUtils {
  static UserProvider get api => Get.find<UserProvider>();

  static String getBaseUrl() {
    var appUrl = ToolsUtils.instance.isDebugModel ? LinkUtils.testBaseUrl : MySharedPref.getBaseUrl() ?? LinkUtils.prodBaseUrl;
    return "$appUrl/api/v1";
  }

  /// 获取用户头像
  static getAvatarUrl(String uid) {
    var appUrl = ToolsUtils.instance.isDebugModel ? LinkUtils.testBaseUrl : MySharedPref.getBaseUrl() ?? LinkUtils.prodBaseUrl;
    return "users/$uid/avatar";
  }

  /// 获取群组头像
  static getGroupAvatarUrl(String gid) {
    var appUrl = ToolsUtils.instance.isDebugModel ? LinkUtils.testBaseUrl : MySharedPref.getBaseUrl() ?? LinkUtils.prodBaseUrl;
    return "groups/$gid/avatar";
  }

  /// 同步会话列表
  static syncConversation(String lastSsgSeqs, int msgCount, int version, Function(WKSyncConversation) back) async {

      print("tongbujinlaile");
      final response = await api.conversationSync(
        version: version,
        lastMsgSeqs: lastSsgSeqs,
        msgCount: msgCount,
        deviceUuid: ToolsUtils.instance.deviceInfo!.deviceId,
      );
// print(response.data);
      WKSyncConversation conversation = WKSyncConversation();
      conversation.conversations = [];
if (response['code'] == 0) {
  try {
      var list = response['data']['conversations'];
      // var list = jsonDecode(response.data);
      for (int i = 0; i < list.length; i++) {
        var json = list[i];
        WKSyncConvMsg convMsg = WKSyncConvMsg();
        print("同步全部会话列表循环第$i次${json['channel_id']}");
        convMsg.channelID = json['channel_id'];
        convMsg.channelType = json['channel_type'];
        convMsg.unread = json['unread'] ?? 0;
        convMsg.timestamp = json['timestamp'];
        convMsg.lastMsgSeq = json['last_msg_seq'];
        convMsg.lastClientMsgNO = json['last_client_msg_no'];
        convMsg.version = json['version'];
        var msgListJson = json['recents'] as List<dynamic>;
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
      print("tongbuchenggong, uid:${GlobalService.to.uid}");
      // conversation.uid = GlobalService.to.uid;

  } catch (e) {
    print('同步最近会话错误');
  }
  back(conversation);
}


  }

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
      final data = await api.channelSync(
        uid: UserInfo.uid,
        channelID: channelID,
        channelType: channelType,
        startMsgSeq: startMsgSeq,
        endMsgSeq: endMsgSeq,
        limit: limit,
        pullMode: pullMode,
      );
      msg.startMessageSeq = data['start_message_seq'];
      msg.endMessageSeq = data['end_message_seq'];
      msg.more = data['more'];
      var messages = data['messages'];

      List<WKSyncMsg> msgList = [];
      for (int i = 0; i < messages.length; i++) {
        dynamic json = messages[i];
        msgList.add(getWKSyncMsg(json));
      }
      print('同步channel消息数量：${msgList.length}');
      msg.messages = msgList;
      back(msg);
    } catch (e) {
      back(msg);
    }
  }

  static WKSyncMsg getWKSyncMsg(dynamic json) {
    WKSyncMsg msg = WKSyncMsg();
    msg.channelID = json['channel_id'];
    msg.messageID = json['message_id'].toString();
    msg.channelType = json['channel_type'];
    msg.clientMsgNO = json['client_msg_no'];
    msg.messageSeq = json['message_seq'];
    msg.fromUID = json['from_uid'];
    msg.isDeleted = json['is_deleted'];
    msg.timestamp = json['timestamp'];
    //  msg.payload = json['payload'];

    // String payload = json['payload'];
    try {
      // msg.payload = json['payload'];
      msg.payload = jsonDecode(utf8.decode(base64Decode(json['payload'])));
    } catch (e) {
      print('payload异常了');
    }
    // 解析扩展
    var extraJson = json['message_extra'];
    if (extraJson != null) {
      var extra = getMsgExtra(extraJson);
      msg.messageExtra = extra;
    }
    return msg;
  }

  static WKSyncExtraMsg getMsgExtra(dynamic extraJson) {
    var extra = WKSyncExtraMsg();
    extra.messageID = extraJson['message_id'];
    extra.messageIdStr = extraJson['message_id_str'];
    extra.revoke = extraJson['revoke'] ?? 0;
    extra.revoker = extraJson['revoker'] ?? '';
    extra.readed = extraJson['readed'] ?? 0;
    extra.readedCount = extraJson['readed_count'] ?? 0;
    extra.isMutualDeleted = extraJson['is_mutual_deleted'] ?? 0;
    return extra;
  }

  static getGroupInfo(String groupId) async {
    try {
      final response = await api.getGroupInfo(groupId: groupId);
      var channel = WKChannel(groupId, WKChannelType.group);
      channel.channelName = response['name'] ?? "";
      channel.avatar = "${getGroupAvatarUrl(groupId)}?t=${DateTime.now().millisecondsSinceEpoch}";

      /// 清空缓存
      // ToolsUtils.clearSpecificImageCache("${HttpUtils.getBaseUrl()}/${channel.avatar}");
      // AvatarManager.saveAvatar(channel.avatar);
      WKIM.shared.channelManager.addOrUpdateChannel(channel);
    } catch (e) {
      print("object_获取群组消息异常");
    }
  }

  static getUserInfo(String uid) async {
    try {
      final response = await api.getUserInfo(uid: uid);
      // var json = response.data;
      var channel = WKChannel(uid, WKChannelType.personal);
      channel.channelName = response['name'] ?? "";
      // channel.avatar = getAvatarUrl(uid);
      channel.avatar = "${getAvatarUrl(uid)}?t=${DateTime.now().millisecondsSinceEpoch}";

      /// 清空缓存
      // ToolsUtils.clearSpecificImageCache("${HttpUtils.getBaseUrl()}/${channel.avatar}");
      // AvatarManager.saveAvatar(channel.avatar);
      WKIM.shared.channelManager.addOrUpdateChannel(channel);
    } catch (e) {
      print('获取用户信息失败$e');
    }
  }

  static revokeMsg(String clientMsgNo, String channelId, int channelType, int msgSeq, String msgId) async {
    final httpClient = HttpClient();
    httpClient.badCertificateCallback = (X509Certificate cert, String host, int port) {
      // 信任所有证书
      return true;
    };
    final dio = Dio();
    dio.httpClientAdapter = DefaultHttpClientAdapter()
      ..onHttpClientCreate = (client) {
        return httpClient;
      };
    try {
      // final response = await dio.post('$apiURL/message/revoke', data: {
      //   'login_uid': UserInfo.uid,
      //   'channel_id': channelId,
      //   'channel_type': channelType,
      //   'client_msg_no': clientMsgNo,
      //   'message_seq': msgSeq,
      //   'message_id': msgId,
      // });
      final response = null;
      if (response.statusCode == HttpStatus.ok) {
        print('撤回消息成功');
      }
    } catch (e) {
      print('获取用户信息失败$e');
    }
  }

  static deleteMsg(String clientMsgNo, String channelId, int channelType, int msgSeq, String msgId) async {
    final httpClient = HttpClient();
    httpClient.badCertificateCallback = (X509Certificate cert, String host, int port) {
      // 信任所有证书
      return true;
    };
    final dio = Dio();
    dio.httpClientAdapter = DefaultHttpClientAdapter()
      ..onHttpClientCreate = (client) {
        return httpClient;
      };
    try {
      // final response = await dio.post('$apiURL/message/delete', data: {
      //   'login_uid': UserInfo.uid,
      //   'channel_id': channelId,
      //   'channel_type': channelType,
      //   'message_seq': msgSeq,
      //   'message_id': msgId,
      // });
      final response = null;
      if (response.statusCode == HttpStatus.ok) {
        WKIM.shared.messageManager.deleteWithClientMsgNo(clientMsgNo);
      }
    } catch (e) {
      print('删除消息失败$e');
    }
  }

  static syncMsgExtra(String channelId, int channelType, int version) async {
    final httpClient = HttpClient();
    httpClient.badCertificateCallback = (X509Certificate cert, String host, int port) {
      // 信任所有证书
      return true;
    };
    final dio = Dio();
    dio.httpClientAdapter = DefaultHttpClientAdapter()
      ..onHttpClientCreate = (client) {
        return httpClient;
      };
    try {
      // final response = await dio.post('$apiURL/message/extra/sync', data: {
      //   'login_uid': UserInfo.uid,
      //   'channel_id': channelId,
      //   'channel_type': channelType,
      //   'source': UserInfo.uid,
      //   'limit': 100,
      //   'extra_version': version,
      // });
      final response = null;
      if (response.statusCode == HttpStatus.ok) {
        var arrJson = response.data;
        if (arrJson != null && arrJson.length > 0) {
          List<WKMsgExtra> list = [];
          for (int i = 0; i < arrJson.length; i++) {
            var extraJson = arrJson[i];
            WKMsgExtra extra = WKMsgExtra();
            extra.messageID = extraJson['message_id_str'];
            extra.revoke = extraJson['revoke'] ?? 0;
            extra.revoker = extraJson['revoker'] ?? '';
            extra.readed = extraJson['readed'] ?? 0;
            extra.readedCount = extraJson['readed_count'] ?? 0;
            extra.isMutualDeleted = extraJson['is_mutual_deleted'] ?? 0;
            extra.extraVersion = extraJson['extra_version'] ?? 0;
            list.add(extra);
          }
          WKIM.shared.messageManager.saveRemoteExtraMsg(list);
        }
      }
    } catch (e) {
      print('同步消息扩展失败$e');
    }
  }

  // 清空红点
  static clearUnread(String channelId, int channelType) async {
    final httpClient = HttpClient();
    httpClient.badCertificateCallback = (X509Certificate cert, String host, int port) {
      // 信任所有证书
      return true;
    };
    final dio = Dio();
    dio.httpClientAdapter = DefaultHttpClientAdapter()
      ..onHttpClientCreate = (client) {
        return httpClient;
      };
    try {
      // final response = await dio.put('$apiURL/conversation/clearUnread', data: {
      //   'login_uid': UserInfo.uid,
      //   'channel_id': channelId,
      //   'channel_type': channelType,
      //   'unread': 0,
      // });
      final response = null;
      if (response.statusCode == HttpStatus.ok) {
        print('清空红点成功');
      }
    } catch (e) {
      print('清空红点失败$e');
    }
  }

  // 清除频道消息
  static clearChannelMsg(String channelId, int channelType) async {
    final httpClient = HttpClient();
    httpClient.badCertificateCallback = (X509Certificate cert, String host, int port) {
      // 信任所有证书
      return true;
    };
    final dio = Dio();
    dio.httpClientAdapter = DefaultHttpClientAdapter()
      ..onHttpClientCreate = (client) {
        return httpClient;
      };
    try {
      int maxSeq = await WKIM.shared.messageManager.getMaxMessageSeq(channelId, channelType);
      // final response = await dio.post('$apiURL/message/offset', data: {
      //   'login_uid': UserInfo.uid,
      //   'channel_id': channelId,
      //   'channel_type': channelType,
      //   'message_seq': maxSeq,
      // });
      final response = null;
      if (response.statusCode == HttpStatus.ok) {
        WKIM.shared.messageManager.clearWithChannel(channelId, channelType);
      }
    } catch (e) {
      print('清除频道消息失败$e');
    }
  }

  // 创建群
  static Future<bool> createGroup(String groupNo) async {
    final httpClient = HttpClient();
    httpClient.badCertificateCallback = (X509Certificate cert, String host, int port) {
      // 信任所有证书
      return true;
    };
    final dio = Dio();
    dio.httpClientAdapter = DefaultHttpClientAdapter()
      ..onHttpClientCreate = (client) {
        return httpClient;
      };
    try {
      // final response = await dio.post('$apiURL/group/create', data: {
      //   'login_uid': UserInfo.uid,
      //   'group_no': groupNo,
      // });
      final response = null;
      if (response.statusCode == HttpStatus.ok) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('创建群失败$e');
      return false;
    }
  }

  // 修改群名称
  static Future<bool> updateGroupName(String groupNo, String groupName) async {
    final httpClient = HttpClient();
    httpClient.badCertificateCallback = (X509Certificate cert, String host, int port) {
      // 信任所有证书
      return true;
    };
    final dio = Dio();
    dio.httpClientAdapter = DefaultHttpClientAdapter()
      ..onHttpClientCreate = (client) {
        return httpClient;
      };
    try {
      // final response = await dio.put('$apiURL/groups/$groupNo', data: {
      //   'login_uid': UserInfo.uid,
      //   'name': groupName,
      // });
      final response = null;
      if (response.statusCode == HttpStatus.ok) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('修改群名称失败$e');
      return false;
    }
  }
}
