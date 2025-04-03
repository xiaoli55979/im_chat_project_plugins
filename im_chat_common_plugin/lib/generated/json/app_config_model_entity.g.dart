import 'package:im_chat_common_plugin/generated/json/base/json_convert_content.dart';
import 'package:im_chat_common_plugin/models/app_config_model_entity.dart';

AppConfigModelEntity $AppConfigModelEntityFromJson(Map<String, dynamic> json) {
  final AppConfigModelEntity appConfigModelEntity = AppConfigModelEntity();
  final int? version = jsonConvert.convert<int>(json['version']);
  if (version != null) {
    appConfigModelEntity.version = version;
  }
  final String? webUrl = jsonConvert.convert<String>(json['web_url']);
  if (webUrl != null) {
    appConfigModelEntity.webUrl = webUrl;
  }
  final int? phoneSearchOff = jsonConvert.convert<int>(json['phone_search_off']);
  if (phoneSearchOff != null) {
    appConfigModelEntity.phoneSearchOff = phoneSearchOff;
  }
  final int? shortnoEditOff = jsonConvert.convert<int>(json['shortno_edit_off']);
  if (shortnoEditOff != null) {
    appConfigModelEntity.shortnoEditOff = shortnoEditOff;
  }
  final int? revokeSecond = jsonConvert.convert<int>(json['revoke_second']);
  if (revokeSecond != null) {
    appConfigModelEntity.revokeSecond = revokeSecond;
  }
  final int? appleSignIn = jsonConvert.convert<int>(json['apple_sign_in']);
  if (appleSignIn != null) {
    appConfigModelEntity.appleSignIn = appleSignIn;
  }
  final int? registerInviteOn = jsonConvert.convert<int>(json['register_invite_on']);
  if (registerInviteOn != null) {
    appConfigModelEntity.registerInviteOn = registerInviteOn;
  }
  final int? sendWelcomeMessageOn = jsonConvert.convert<int>(json['send_welcome_message_on']);
  if (sendWelcomeMessageOn != null) {
    appConfigModelEntity.sendWelcomeMessageOn = sendWelcomeMessageOn;
  }
  final int? inviteSystemAccountJoinGroupOn = jsonConvert.convert<int>(json['invite_system_account_join_group_on']);
  if (inviteSystemAccountJoinGroupOn != null) {
    appConfigModelEntity.inviteSystemAccountJoinGroupOn = inviteSystemAccountJoinGroupOn;
  }
  final int? registerUserMustCompleteInfoOn = jsonConvert.convert<int>(json['register_user_must_complete_info_on']);
  if (registerUserMustCompleteInfoOn != null) {
    appConfigModelEntity.registerUserMustCompleteInfoOn = registerUserMustCompleteInfoOn;
  }
  final int? canModifyApiUrl = jsonConvert.convert<int>(json['can_modify_api_url']);
  if (canModifyApiUrl != null) {
    appConfigModelEntity.canModifyApiUrl = canModifyApiUrl;
  }
  return appConfigModelEntity;
}

Map<String, dynamic> $AppConfigModelEntityToJson(AppConfigModelEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['version'] = entity.version;
  data['web_url'] = entity.webUrl;
  data['phone_search_off'] = entity.phoneSearchOff;
  data['shortno_edit_off'] = entity.shortnoEditOff;
  data['revoke_second'] = entity.revokeSecond;
  data['apple_sign_in'] = entity.appleSignIn;
  data['register_invite_on'] = entity.registerInviteOn;
  data['send_welcome_message_on'] = entity.sendWelcomeMessageOn;
  data['invite_system_account_join_group_on'] = entity.inviteSystemAccountJoinGroupOn;
  data['register_user_must_complete_info_on'] = entity.registerUserMustCompleteInfoOn;
  data['can_modify_api_url'] = entity.canModifyApiUrl;
  return data;
}

extension AppConfigModelEntityExtension on AppConfigModelEntity {
  AppConfigModelEntity copyWith({
    int? version,
    String? webUrl,
    int? phoneSearchOff,
    int? shortnoEditOff,
    int? revokeSecond,
    int? appleSignIn,
    int? registerInviteOn,
    int? sendWelcomeMessageOn,
    int? inviteSystemAccountJoinGroupOn,
    int? registerUserMustCompleteInfoOn,
    int? canModifyApiUrl,
  }) {
    return AppConfigModelEntity()
      ..version = version ?? this.version
      ..webUrl = webUrl ?? this.webUrl
      ..phoneSearchOff = phoneSearchOff ?? this.phoneSearchOff
      ..shortnoEditOff = shortnoEditOff ?? this.shortnoEditOff
      ..revokeSecond = revokeSecond ?? this.revokeSecond
      ..appleSignIn = appleSignIn ?? this.appleSignIn
      ..registerInviteOn = registerInviteOn ?? this.registerInviteOn
      ..sendWelcomeMessageOn = sendWelcomeMessageOn ?? this.sendWelcomeMessageOn
      ..inviteSystemAccountJoinGroupOn = inviteSystemAccountJoinGroupOn ?? this.inviteSystemAccountJoinGroupOn
      ..registerUserMustCompleteInfoOn = registerUserMustCompleteInfoOn ?? this.registerUserMustCompleteInfoOn
      ..canModifyApiUrl = canModifyApiUrl ?? this.canModifyApiUrl;
  }
}
