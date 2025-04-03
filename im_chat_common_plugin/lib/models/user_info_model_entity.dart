import 'dart:convert';

import 'package:im_chat_common_plugin/generated/json/base/json_field.dart';
import 'package:im_chat_common_plugin/generated/json/user_info_model_entity.g.dart';

export 'package:im_chat_common_plugin/generated/json/user_info_model_entity.g.dart';

@JsonSerializable()
class UserInfoModelEntity {
  late String uid = '';
  @JSONField(name: 'app_id')
  late String appId = '';
  late String name = '';
  late String username = '';
  late int sex = 0;
  late String category = '';
  @JSONField(name: 'short_no')
  late String shortNo = '';
  late String zone = '';
  late String phone = '';
  late String token = '';
  @JSONField(name: 'chat_pwd')
  late String chatPwd = '';
  @JSONField(name: 'lock_screen_pwd')
  late String lockScreenPwd = '';
  @JSONField(name: 'lock_after_minute')
  late int lockAfterMinute = 0;
  late String role = '';
  late String lang = '';
  late UserInfoModelSetting setting;
  @JSONField(name: 'rsa_public_key')
  late String rsaPublicKey = '';
  @JSONField(name: 'short_status')
  late int shortStatus = 0;
  @JSONField(name: 'msg_expire_second')
  late int msgExpireSecond = 0;

  UserInfoModelEntity();

  factory UserInfoModelEntity.fromJson(Map<String, dynamic> json) => $UserInfoModelEntityFromJson(json);

  Map<String, dynamic> toJson() => $UserInfoModelEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserInfoModelSetting {
  @JSONField(name: 'search_by_phone')
  late int searchByPhone = 0;
  @JSONField(name: 'search_by_short')
  late int searchByShort = 0;
  @JSONField(name: 'new_msg_notice')
  late int newMsgNotice = 0;
  @JSONField(name: 'msg_show_detail')
  late int msgShowDetail = 0;
  @JSONField(name: 'voice_on')
  late int voiceOn = 0;
  @JSONField(name: 'shock_on')
  late int shockOn = 0;
  @JSONField(name: 'offline_protection')
  late int offlineProtection = 0;
  @JSONField(name: 'device_lock')
  late int deviceLock = 0;
  @JSONField(name: 'mute_of_app')
  late int muteOfApp = 0;

  UserInfoModelSetting();

  factory UserInfoModelSetting.fromJson(Map<String, dynamic> json) => $UserInfoModelSettingFromJson(json);

  Map<String, dynamic> toJson() => $UserInfoModelSettingToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
