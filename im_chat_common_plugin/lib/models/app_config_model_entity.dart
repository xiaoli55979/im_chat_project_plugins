import 'dart:convert';

import 'package:im_chat_common_plugin/generated/json/app_config_model_entity.g.dart';
import 'package:im_chat_common_plugin/generated/json/base/json_field.dart';

export 'package:im_chat_common_plugin/generated/json/app_config_model_entity.g.dart';

@JsonSerializable()
class AppConfigModelEntity {
  late int version = 0;
  @JSONField(name: 'web_url')
  late String webUrl = '';
  @JSONField(name: 'phone_search_off')
  late int phoneSearchOff = 0;
  @JSONField(name: 'shortno_edit_off')
  late int shortnoEditOff = 0;
  @JSONField(name: 'revoke_second')
  late int revokeSecond = 0;
  @JSONField(name: 'apple_sign_in')
  late int appleSignIn = 0;
  @JSONField(name: 'register_invite_on')
  late int registerInviteOn = 0;
  @JSONField(name: 'send_welcome_message_on')
  late int sendWelcomeMessageOn = 0;
  @JSONField(name: 'invite_system_account_join_group_on')
  late int inviteSystemAccountJoinGroupOn = 0;
  @JSONField(name: 'register_user_must_complete_info_on')
  late int registerUserMustCompleteInfoOn = 0;
  @JSONField(name: 'can_modify_api_url')
  late int canModifyApiUrl = 0;

  AppConfigModelEntity();

  factory AppConfigModelEntity.fromJson(Map<String, dynamic> json) => $AppConfigModelEntityFromJson(json);

  Map<String, dynamic> toJson() => $AppConfigModelEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
