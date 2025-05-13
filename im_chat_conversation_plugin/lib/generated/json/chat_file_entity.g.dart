import 'package:im_chat_conversation_plugin/generated/json/base/json_convert_content.dart';
import 'package:im_chat_conversation_plugin/models/chat_file_entity.dart';

ChatFileEntity $ChatFileEntityFromJson(Map<String, dynamic> json) {
  final ChatFileEntity chatFileEntity = ChatFileEntity();
  final String? sendTime = jsonConvert.convert<String>(json['sendTime']);
  if (sendTime != null) {
    chatFileEntity.sendTime = sendTime;
  }
  return chatFileEntity;
}

Map<String, dynamic> $ChatFileEntityToJson(ChatFileEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['sendTime'] = entity.sendTime;
  return data;
}

extension ChatFileEntityExtension on ChatFileEntity {
  ChatFileEntity copyWith({
    String? sendTime,
  }) {
    return ChatFileEntity()
      ..sendTime = sendTime ?? this.sendTime;
  }
}