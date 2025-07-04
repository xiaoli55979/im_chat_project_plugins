import 'package:im_chat_common_plugin/generated/json/base/json_field.dart';
import 'package:im_chat_common_plugin/generated/json/conversation_cmd_msg_entity.g.dart';
import 'dart:convert';
export 'package:im_chat_common_plugin/generated/json/conversation_cmd_msg_entity.g.dart';

@JsonSerializable()
class ConversationCmdMsgEntity {
	late int id = 0;
	late String cmdType = "";
	late String applyName = "";
	late String applyUid = "";
	late String remark = "";
	late String to_uid = "";
	late String toUid = "";
	late String token = "";
	late String channelId = "";
	late int channelType = 0;
	late int redCount = 0;
	late String content = "";
	late int timeStamp = 0;
	late String title = "";

	ConversationCmdMsgEntity();

	factory ConversationCmdMsgEntity.fromJson(Map<String, dynamic> json) => $ConversationCmdMsgEntityFromJson(json);

	Map<String, dynamic> toJson() => $ConversationCmdMsgEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}