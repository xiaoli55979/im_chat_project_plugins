import 'dart:convert';

import 'package:im_chat_conversation_plugin/generated/json/base/json_field.dart';
import 'package:im_chat_conversation_plugin/generated/json/chat_message_model_entity.g.dart';

export 'package:im_chat_conversation_plugin/generated/json/chat_message_model_entity.g.dart';

@JsonSerializable()
class ChatMessageModelEntity {
  late String userId = '';
  late String avatar = '';
  late String username = '';
  late String preview = '';
  late String time = '';
  late bool isGroup = false;
  late int unreadCount = 0;
  late int onLine = 0;

  ChatMessageModelEntity();

  factory ChatMessageModelEntity.fromJson(Map<String, dynamic> json) => $ChatMessageModelEntityFromJson(json);

  Map<String, dynamic> toJson() => $ChatMessageModelEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
