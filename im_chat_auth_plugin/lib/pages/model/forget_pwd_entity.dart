import 'package:im_chat_auth_plugin/generated/json/base/json_field.dart';
import 'package:im_chat_auth_plugin/generated/json/forget_pwd_entity.g.dart';
import 'dart:convert';
export 'package:im_chat_auth_plugin/generated/json/forget_pwd_entity.g.dart';

@JsonSerializable()
class ForgetPwdEntity {
	late String additionalProp1;
	late String additionalProp2;
	late String additionalProp3;

	ForgetPwdEntity();

	factory ForgetPwdEntity.fromJson(Map<String, dynamic> json) => $ForgetPwdEntityFromJson(json);

	Map<String, dynamic> toJson() => $ForgetPwdEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}