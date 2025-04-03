import 'dart:convert';

import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:uuid/uuid.dart';
import 'package:wukongimfluttersdk/entity/msg.dart';

import 'message_content_type.dart';

class MessageSystemMessage {
  // {"content":"{0}修改群名为黑熊精、库特、你是什么时候救命我婆婆所以体力静音婆婆说我朋友","data":{"name":"黑熊精、库特、你是什么时候救命我婆婆所以体力静音婆婆说我朋友"},"extra":[{"name":"张鲁","uid":"17eb4""98e3c684643b912e86bbc67a7d4",}],"type":1005,} contentType:1005
  /// 处理群信息提示处理
  static types.Message groupMemberUpdate(WKMsg msg) {
    return types.SystemMessage(
      id: const Uuid().v4(),
      createdAt: msg.timestamp * 1000,
      metadata: {"type": msg.channelType, "payload": msg.content, "wkMsg": msg},
      status: MessageContentType.getMsgStatus(msg),
      text: processJsonString(msg.content),
    );
  }

  /// 处理占位符信息
  static String processJsonString(String jsonString) {
    // 解析 JSON
    final Map<String, dynamic> jsonData = json.decode(jsonString);

    // 获取 content
    String content = jsonData['content'];

    // 获取 extra 列表
    final List<dynamic> extraList = jsonData['extra'];

    // 替换占位符
    for (int i = 0; i < extraList.length; i++) {
      final Map<String, dynamic> extraItem = extraList[i];
      if (extraItem.containsKey('name')) {
        content = content.replaceAll('{$i}', extraItem['name']);
      }
    }
    return content;
  }
}
