import 'package:im_chat_conversation_plugin/generated/json/base/json_field.dart';
import 'package:im_chat_conversation_plugin/generated/json/chat_file_entity.g.dart';
import 'dart:convert';
export 'package:im_chat_conversation_plugin/generated/json/chat_file_entity.g.dart';

@JsonSerializable()
class ChatFileEntity {
	late String sendTime;

	ChatFileEntity();

	factory ChatFileEntity.fromJson(Map<String, dynamic> json) => $ChatFileEntityFromJson(json);

	Map<String, dynamic> toJson() => $ChatFileEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}