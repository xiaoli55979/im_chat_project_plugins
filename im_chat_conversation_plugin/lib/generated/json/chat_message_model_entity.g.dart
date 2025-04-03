import 'package:im_chat_conversation_plugin/generated/json/base/json_convert_content.dart';
import 'package:im_chat_conversation_plugin/models/chat_message_model_entity.dart';

ChatMessageModelEntity $ChatMessageModelEntityFromJson(Map<String, dynamic> json) {
  final ChatMessageModelEntity chatMessageModelEntity = ChatMessageModelEntity();
  final String? userId = jsonConvert.convert<String>(json['userId']);
  if (userId != null) {
    chatMessageModelEntity.userId = userId;
  }
  final String? avatar = jsonConvert.convert<String>(json['avatar']);
  if (avatar != null) {
    chatMessageModelEntity.avatar = avatar;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    chatMessageModelEntity.username = username;
  }
  final String? preview = jsonConvert.convert<String>(json['preview']);
  if (preview != null) {
    chatMessageModelEntity.preview = preview;
  }
  final String? time = jsonConvert.convert<String>(json['time']);
  if (time != null) {
    chatMessageModelEntity.time = time;
  }
  final bool? isGroup = jsonConvert.convert<bool>(json['isGroup']);
  if (isGroup != null) {
    chatMessageModelEntity.isGroup = isGroup;
  }
  final int? unreadCount = jsonConvert.convert<int>(json['unreadCount']);
  if (unreadCount != null) {
    chatMessageModelEntity.unreadCount = unreadCount;
  }
  final int? onLine = jsonConvert.convert<int>(json['onLine']);
  if (onLine != null) {
    chatMessageModelEntity.onLine = onLine;
  }
  return chatMessageModelEntity;
}

Map<String, dynamic> $ChatMessageModelEntityToJson(ChatMessageModelEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['userId'] = entity.userId;
  data['avatar'] = entity.avatar;
  data['username'] = entity.username;
  data['preview'] = entity.preview;
  data['time'] = entity.time;
  data['isGroup'] = entity.isGroup;
  data['unreadCount'] = entity.unreadCount;
  data['onLine'] = entity.onLine;
  return data;
}

extension ChatMessageModelEntityExtension on ChatMessageModelEntity {
  ChatMessageModelEntity copyWith({
    String? userId,
    String? avatar,
    String? username,
    String? preview,
    String? time,
    bool? isGroup,
    int? unreadCount,
    int? onLine,
  }) {
    return ChatMessageModelEntity()
      ..userId = userId ?? this.userId
      ..avatar = avatar ?? this.avatar
      ..username = username ?? this.username
      ..preview = preview ?? this.preview
      ..time = time ?? this.time
      ..isGroup = isGroup ?? this.isGroup
      ..unreadCount = unreadCount ?? this.unreadCount
      ..onLine = onLine ?? this.onLine;
  }
}
