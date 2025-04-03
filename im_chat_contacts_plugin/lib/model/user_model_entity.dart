import 'dart:convert';

import 'package:im_chat_contacts_plugin/generated/json/base/json_field.dart';
import 'package:im_chat_contacts_plugin/generated/json/user_model_entity.g.dart';

export 'package:im_chat_contacts_plugin/generated/json/user_model_entity.g.dart';

@JsonSerializable()
class UserModelEntity {
  late String id = '';
  late String userName = '';
  late String avatar = '';
  late String nickname = '';
  late String account = '';

  UserModelEntity();

  factory UserModelEntity.fromJson(Map<String, dynamic> json) => $UserModelEntityFromJson(json);

  Map<String, dynamic> toJson() => $UserModelEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
