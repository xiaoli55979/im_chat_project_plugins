import 'package:im_chat_common_plugin/generated/json/base/json_field.dart';
import 'package:im_chat_common_plugin/generated/json/test_entity.g.dart';
import 'dart:convert';
export 'package:im_chat_common_plugin/generated/json/test_entity.g.dart';

@JsonSerializable()
class TestEntity {
	String test = '';

	TestEntity();

	factory TestEntity.fromJson(Map<String, dynamic> json) => $TestEntityFromJson(json);

	Map<String, dynamic> toJson() => $TestEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}