import 'dart:convert';

import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:im_chat_common_plugin/immanager/http_utils.dart';
import 'package:uuid/uuid.dart';
import 'package:wukongimfluttersdk/entity/channel.dart';
import 'package:wukongimfluttersdk/entity/msg.dart';
import 'package:wukongimfluttersdk/model/wk_image_content.dart';
import 'package:wukongimfluttersdk/model/wk_video_content.dart';
import 'package:wukongimfluttersdk/type/const.dart';
import 'package:wukongimfluttersdk/wkim.dart';

import 'message_content_type.dart';
import 'message_system_message.dart';

/// 消息类型转换
class MessageTypeHandle {
  /// 消息类型转换汇总
  static types.Message transferMessage(WKMsg msg) {
    return transferSystemMessage(msg);
  }

  /// 系统消息转换
  static types.Message transferSystemMessage(WKMsg msg) {
    print("object_transferSystemMessage:${msg.contentType}");

    /// 邀请群成员通知信息
    if (msg.contentType == MessageContentType.GROUP_MEMBER_ADD_SUCCESS ||
        msg.contentType == MessageContentType.GROUP_UPDATE ||
        msg.contentType == MessageContentType.GROUP_MEMBER_SCAN_JOIN) {
      return MessageSystemMessage.groupMemberUpdate(msg);
    } else if (msg.contentType == MessageContentType.TEXT) {
      return createTextMessage(msg);
    } else if (msg.contentType == MessageContentType.IMAGE) {
      return createImageMessage(msg);
    } else if (msg.contentType == MessageContentType.IMAGE) {
      return handleVideoMessage(msg);
    } else if (msg.contentType == MessageContentType.CARD) {
      return handleCardMessage(msg);
    } else if (msg.contentType == MessageContentType.AUDIO) {
      return handleAudioMessage(msg);
    } else {
      return unSupportMessage(msg);
    }

    return types.SystemMessage(
      id: const Uuid().v4(),
      createdAt: msg.timestamp * 1000,
      metadata: {"type": msg.channelType, "payload": msg.content, "wkMsg": msg},
      status: MessageContentType.getMsgStatus(msg),
      text: '',
    );
  }

  /// 文本消息转换
  static types.TextMessage createTextMessage(WKMsg msg) {
    Map<String, dynamic> jsonData = json.decode(msg.content);
    String content = jsonData['content'];
    return types.TextMessage(
      id: msg.messageID,
      createdAt: msg.timestamp * 1000,
      text: content,
      author: types.User(
        id: msg.fromUID,
        imageUrl: getChannelAvatarURL(msg),
        lastName: getChannelName(msg),
      ),
      status: MessageContentType.getMsgStatus(msg),
      metadata: {"type": msg.channelType, "wkMsg": msg},
    );
  }

  /// 处理图片消息
  static types.Message createImageMessage(WKMsg msg) {
    final imageContent = msg.messageContent as WKImageContent;
    return types.ImageMessage(
      author: types.User(
        id: msg.fromUID,
        imageUrl: getChannelAvatarURL(msg),
        lastName: getChannelName(msg),
      ),
      createdAt: msg.timestamp * 1000,
      id: msg.messageID,
      name: "image",
      size: 1024,
      uri: "${HttpUtils.getBaseUrl()}/${imageContent.url}",
      width: imageContent.width.toDouble(),
      height: imageContent.height.toDouble(),
      status: MessageContentType.getMsgStatus(msg),
      metadata: {"wkMsg": msg, 'type': msg.contentType},
    );
  }

  /// 处理视频消息
  static types.Message handleVideoMessage(WKMsg msg) {
    final videoContent = msg.messageContent as WKVideoContent;
    return types.VideoMessage(
      author: types.User(
        id: msg.fromUID,
        imageUrl: getChannelAvatarURL(msg),
        lastName: getChannelName(msg),
      ),
      createdAt: msg.timestamp * 1000,
      id: msg.messageID,
      name: "",
      size: videoContent.size,
      uri: "${HttpUtils.getBaseUrl()}/${videoContent.url}",
      width: videoContent.width.toDouble(),
      height: videoContent.height.toDouble(),
      status: MessageContentType.getMsgStatus(msg),
      metadata: {"wkMsg": msg, 'type': msg.contentType},
    );
  }

  /// 处理名片消息
  static types.Message handleCardMessage(WKMsg msg) {
    // final videoContent = msg.messageContent as WKVideoContent;
    types.Message message = types.CustomMessage(
      author: types.User(
        id: msg.fromUID,
        imageUrl: getChannelAvatarURL(msg),
        lastName: getChannelName(msg),
      ),
      createdAt: msg.timestamp * 1000,
      id: msg.messageID,
      type: types.MessageType.custom,
      status: MessageContentType.getMsgStatus(msg),
      metadata: {"wkMsg": msg, 'type': msg.contentType},
    );
    return message;
  }

  /// 处理语音消息
  static types.Message handleAudioMessage(WKMsg msg) {
    // 解析 msg.content
    final Map<String, dynamic> content = jsonDecode(msg.content);

    types.AudioMessage message = types.AudioMessage(
      author: types.User(
        id: msg.fromUID,
        imageUrl: getChannelAvatarURL(msg),
        lastName: getChannelName(msg),
      ),
      createdAt: msg.timestamp * 1000,
      id: msg.messageID,
      type: types.MessageType.audio,
      status: MessageContentType.getMsgStatus(msg),
      metadata: {
        "wkMsg": msg,
        "type": msg.contentType,
        "waveform": content["waveform"],
        "timeTrad": content["timeTrad"],
      },
      duration: Duration(seconds: content["timeTrad"] ?? 0),
      name: '',
      size: 0,
      uri: content["url"] != null ? "${HttpUtils.getBaseUrl()}/${content["url"]}" : "",
    );
    return message;
  }

  /// 自定义消息
  static types.UnsupportedMessage unSupportMessage(WKMsg msg) {
    return types.UnsupportedMessage(
      author: types.User(
        id: msg.fromUID,
        imageUrl: getChannelAvatarURL(msg),
        lastName: getChannelName(msg),
      ),
      createdAt: msg.timestamp * 1000,
      id: msg.messageID,
      type: types.MessageType.unsupported,
      status: MessageContentType.getMsgStatus(msg),
      metadata: {"wkMsg": msg, 'type': msg.contentType},
    );
  }

  static String getChannelAvatarURL(WKMsg msg) {
    // print("object_channelId:${msg.channelID}");
    String imagesUrl = "";
    var fromChannel = msg.getFrom();
    // print("object_fromChannel_avatar:${fromChannel?.avatar}");
    if (fromChannel != null && fromChannel.avatar.isNotEmpty) {
      imagesUrl = fromChannel.avatar;
    } else if (fromChannel != null && fromChannel.avatar.isEmpty) {
      imagesUrl = HttpUtils.getAvatarUrl(fromChannel.channelID);
    }

    if (imagesUrl.isNotEmpty) {
      imagesUrl = "${HttpUtils.getBaseUrl()}/$imagesUrl";
    }

    WKIM.shared.channelManager.fetchChannelInfo(msg.fromUID, WKChannelType.personal);
    return imagesUrl;
  }

  /// 获取用户名
  static String getChannelName(WKMsg msg) {
    WKChannel? channel = msg.getFrom();
    String name = channel?.channelName ?? "";
    return name;
  }
}
