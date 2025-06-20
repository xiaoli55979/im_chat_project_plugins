import 'package:im_chat_common_plugin/generated/json/base/json_convert_content.dart';
import 'package:im_chat_common_plugin/models/conversation_cmd_msg_entity.dart';

ConversationCmdMsgEntity $ConversationCmdMsgEntityFromJson(
    Map<String, dynamic> json) {
  final ConversationCmdMsgEntity conversationCmdMsgEntity = ConversationCmdMsgEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    conversationCmdMsgEntity.id = id;
  }
  final String? cmdType = jsonConvert.convert<String>(json['cmdType']);
  if (cmdType != null) {
    conversationCmdMsgEntity.cmdType = cmdType;
  }
  final String? applyName = jsonConvert.convert<String>(json['applyName']);
  if (applyName != null) {
    conversationCmdMsgEntity.applyName = applyName;
  }
  final String? applyUid = jsonConvert.convert<String>(json['applyUid']);
  if (applyUid != null) {
    conversationCmdMsgEntity.applyUid = applyUid;
  }
  final String? remark = jsonConvert.convert<String>(json['remark']);
  if (remark != null) {
    conversationCmdMsgEntity.remark = remark;
  }
  final String? to_uid = jsonConvert.convert<String>(json['to_uid']);
  if (to_uid != null) {
    conversationCmdMsgEntity.to_uid = to_uid;
  }
  final String? toUid = jsonConvert.convert<String>(json['toUid']);
  if (toUid != null) {
    conversationCmdMsgEntity.toUid = toUid;
  }
  final String? token = jsonConvert.convert<String>(json['token']);
  if (token != null) {
    conversationCmdMsgEntity.token = token;
  }
  final String? channelId = jsonConvert.convert<String>(json['channelId']);
  if (channelId != null) {
    conversationCmdMsgEntity.channelId = channelId;
  }
  final int? channelType = jsonConvert.convert<int>(json['channelType']);
  if (channelType != null) {
    conversationCmdMsgEntity.channelType = channelType;
  }
  final int? redCount = jsonConvert.convert<int>(json['redCount']);
  if (redCount != null) {
    conversationCmdMsgEntity.redCount = redCount;
  }
  final String? content = jsonConvert.convert<String>(json['content']);
  if (content != null) {
    conversationCmdMsgEntity.content = content;
  }
  final int? timeStamp = jsonConvert.convert<int>(json['timeStamp']);
  if (timeStamp != null) {
    conversationCmdMsgEntity.timeStamp = timeStamp;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    conversationCmdMsgEntity.title = title;
  }
  return conversationCmdMsgEntity;
}

Map<String, dynamic> $ConversationCmdMsgEntityToJson(
    ConversationCmdMsgEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['cmdType'] = entity.cmdType;
  data['applyName'] = entity.applyName;
  data['applyUid'] = entity.applyUid;
  data['remark'] = entity.remark;
  data['to_uid'] = entity.to_uid;
  data['toUid'] = entity.toUid;
  data['token'] = entity.token;
  data['channelId'] = entity.channelId;
  data['channelType'] = entity.channelType;
  data['redCount'] = entity.redCount;
  data['content'] = entity.content;
  data['timeStamp'] = entity.timeStamp;
  data['title'] = entity.title;
  return data;
}

extension ConversationCmdMsgEntityExtension on ConversationCmdMsgEntity {
  ConversationCmdMsgEntity copyWith({
    int? id,
    String? cmdType,
    String? applyName,
    String? applyUid,
    String? remark,
    String? to_uid,
    String? toUid,
    String? token,
    String? channelId,
    int? channelType,
    int? redCount,
    String? content,
    int? timeStamp,
    String? title,
  }) {
    return ConversationCmdMsgEntity()
      ..id = id ?? this.id
      ..cmdType = cmdType ?? this.cmdType
      ..applyName = applyName ?? this.applyName
      ..applyUid = applyUid ?? this.applyUid
      ..remark = remark ?? this.remark
      ..to_uid = to_uid ?? this.to_uid
      ..toUid = toUid ?? this.toUid
      ..token = token ?? this.token
      ..channelId = channelId ?? this.channelId
      ..channelType = channelType ?? this.channelType
      ..redCount = redCount ?? this.redCount
      ..content = content ?? this.content
      ..timeStamp = timeStamp ?? this.timeStamp
      ..title = title ?? this.title;
  }
}