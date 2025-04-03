import 'package:im_chat_common_plugin/generated/json/base/json_convert_content.dart';
import 'package:im_chat_common_plugin/models/user_info_model_entity.dart';

UserInfoModelEntity $UserInfoModelEntityFromJson(Map<String, dynamic> json) {
  final UserInfoModelEntity userInfoModelEntity = UserInfoModelEntity();
  final String? uid = jsonConvert.convert<String>(json['uid']);
  if (uid != null) {
    userInfoModelEntity.uid = uid;
  }
  final String? appId = jsonConvert.convert<String>(json['app_id']);
  if (appId != null) {
    userInfoModelEntity.appId = appId;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    userInfoModelEntity.name = name;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    userInfoModelEntity.username = username;
  }
  final int? sex = jsonConvert.convert<int>(json['sex']);
  if (sex != null) {
    userInfoModelEntity.sex = sex;
  }
  final String? category = jsonConvert.convert<String>(json['category']);
  if (category != null) {
    userInfoModelEntity.category = category;
  }
  final String? shortNo = jsonConvert.convert<String>(json['short_no']);
  if (shortNo != null) {
    userInfoModelEntity.shortNo = shortNo;
  }
  final String? zone = jsonConvert.convert<String>(json['zone']);
  if (zone != null) {
    userInfoModelEntity.zone = zone;
  }
  final String? phone = jsonConvert.convert<String>(json['phone']);
  if (phone != null) {
    userInfoModelEntity.phone = phone;
  }
  final String? token = jsonConvert.convert<String>(json['token']);
  if (token != null) {
    userInfoModelEntity.token = token;
  }
  final String? chatPwd = jsonConvert.convert<String>(json['chat_pwd']);
  if (chatPwd != null) {
    userInfoModelEntity.chatPwd = chatPwd;
  }
  final String? lockScreenPwd = jsonConvert.convert<String>(json['lock_screen_pwd']);
  if (lockScreenPwd != null) {
    userInfoModelEntity.lockScreenPwd = lockScreenPwd;
  }
  final int? lockAfterMinute = jsonConvert.convert<int>(json['lock_after_minute']);
  if (lockAfterMinute != null) {
    userInfoModelEntity.lockAfterMinute = lockAfterMinute;
  }
  final String? role = jsonConvert.convert<String>(json['role']);
  if (role != null) {
    userInfoModelEntity.role = role;
  }
  final String? lang = jsonConvert.convert<String>(json['lang']);
  if (lang != null) {
    userInfoModelEntity.lang = lang;
  }
  final UserInfoModelSetting? setting = jsonConvert.convert<UserInfoModelSetting>(json['setting']);
  if (setting != null) {
    userInfoModelEntity.setting = setting;
  }
  final String? rsaPublicKey = jsonConvert.convert<String>(json['rsa_public_key']);
  if (rsaPublicKey != null) {
    userInfoModelEntity.rsaPublicKey = rsaPublicKey;
  }
  final int? shortStatus = jsonConvert.convert<int>(json['short_status']);
  if (shortStatus != null) {
    userInfoModelEntity.shortStatus = shortStatus;
  }
  final int? msgExpireSecond = jsonConvert.convert<int>(json['msg_expire_second']);
  if (msgExpireSecond != null) {
    userInfoModelEntity.msgExpireSecond = msgExpireSecond;
  }
  return userInfoModelEntity;
}

Map<String, dynamic> $UserInfoModelEntityToJson(UserInfoModelEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['uid'] = entity.uid;
  data['app_id'] = entity.appId;
  data['name'] = entity.name;
  data['username'] = entity.username;
  data['sex'] = entity.sex;
  data['category'] = entity.category;
  data['short_no'] = entity.shortNo;
  data['zone'] = entity.zone;
  data['phone'] = entity.phone;
  data['token'] = entity.token;
  data['chat_pwd'] = entity.chatPwd;
  data['lock_screen_pwd'] = entity.lockScreenPwd;
  data['lock_after_minute'] = entity.lockAfterMinute;
  data['role'] = entity.role;
  data['lang'] = entity.lang;
  data['setting'] = entity.setting.toJson();
  data['rsa_public_key'] = entity.rsaPublicKey;
  data['short_status'] = entity.shortStatus;
  data['msg_expire_second'] = entity.msgExpireSecond;
  return data;
}

extension UserInfoModelEntityExtension on UserInfoModelEntity {
  UserInfoModelEntity copyWith({
    String? uid,
    String? appId,
    String? name,
    String? username,
    int? sex,
    String? category,
    String? shortNo,
    String? zone,
    String? phone,
    String? token,
    String? chatPwd,
    String? lockScreenPwd,
    int? lockAfterMinute,
    String? role,
    String? lang,
    UserInfoModelSetting? setting,
    String? rsaPublicKey,
    int? shortStatus,
    int? msgExpireSecond,
  }) {
    return UserInfoModelEntity()
      ..uid = uid ?? this.uid
      ..appId = appId ?? this.appId
      ..name = name ?? this.name
      ..username = username ?? this.username
      ..sex = sex ?? this.sex
      ..category = category ?? this.category
      ..shortNo = shortNo ?? this.shortNo
      ..zone = zone ?? this.zone
      ..phone = phone ?? this.phone
      ..token = token ?? this.token
      ..chatPwd = chatPwd ?? this.chatPwd
      ..lockScreenPwd = lockScreenPwd ?? this.lockScreenPwd
      ..lockAfterMinute = lockAfterMinute ?? this.lockAfterMinute
      ..role = role ?? this.role
      ..lang = lang ?? this.lang
      ..setting = setting ?? this.setting
      ..rsaPublicKey = rsaPublicKey ?? this.rsaPublicKey
      ..shortStatus = shortStatus ?? this.shortStatus
      ..msgExpireSecond = msgExpireSecond ?? this.msgExpireSecond;
  }
}

UserInfoModelSetting $UserInfoModelSettingFromJson(Map<String, dynamic> json) {
  final UserInfoModelSetting userInfoModelSetting = UserInfoModelSetting();
  final int? searchByPhone = jsonConvert.convert<int>(json['search_by_phone']);
  if (searchByPhone != null) {
    userInfoModelSetting.searchByPhone = searchByPhone;
  }
  final int? searchByShort = jsonConvert.convert<int>(json['search_by_short']);
  if (searchByShort != null) {
    userInfoModelSetting.searchByShort = searchByShort;
  }
  final int? newMsgNotice = jsonConvert.convert<int>(json['new_msg_notice']);
  if (newMsgNotice != null) {
    userInfoModelSetting.newMsgNotice = newMsgNotice;
  }
  final int? msgShowDetail = jsonConvert.convert<int>(json['msg_show_detail']);
  if (msgShowDetail != null) {
    userInfoModelSetting.msgShowDetail = msgShowDetail;
  }
  final int? voiceOn = jsonConvert.convert<int>(json['voice_on']);
  if (voiceOn != null) {
    userInfoModelSetting.voiceOn = voiceOn;
  }
  final int? shockOn = jsonConvert.convert<int>(json['shock_on']);
  if (shockOn != null) {
    userInfoModelSetting.shockOn = shockOn;
  }
  final int? offlineProtection = jsonConvert.convert<int>(json['offline_protection']);
  if (offlineProtection != null) {
    userInfoModelSetting.offlineProtection = offlineProtection;
  }
  final int? deviceLock = jsonConvert.convert<int>(json['device_lock']);
  if (deviceLock != null) {
    userInfoModelSetting.deviceLock = deviceLock;
  }
  final int? muteOfApp = jsonConvert.convert<int>(json['mute_of_app']);
  if (muteOfApp != null) {
    userInfoModelSetting.muteOfApp = muteOfApp;
  }
  return userInfoModelSetting;
}

Map<String, dynamic> $UserInfoModelSettingToJson(UserInfoModelSetting entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['search_by_phone'] = entity.searchByPhone;
  data['search_by_short'] = entity.searchByShort;
  data['new_msg_notice'] = entity.newMsgNotice;
  data['msg_show_detail'] = entity.msgShowDetail;
  data['voice_on'] = entity.voiceOn;
  data['shock_on'] = entity.shockOn;
  data['offline_protection'] = entity.offlineProtection;
  data['device_lock'] = entity.deviceLock;
  data['mute_of_app'] = entity.muteOfApp;
  return data;
}

extension UserInfoModelSettingExtension on UserInfoModelSetting {
  UserInfoModelSetting copyWith({
    int? searchByPhone,
    int? searchByShort,
    int? newMsgNotice,
    int? msgShowDetail,
    int? voiceOn,
    int? shockOn,
    int? offlineProtection,
    int? deviceLock,
    int? muteOfApp,
  }) {
    return UserInfoModelSetting()
      ..searchByPhone = searchByPhone ?? this.searchByPhone
      ..searchByShort = searchByShort ?? this.searchByShort
      ..newMsgNotice = newMsgNotice ?? this.newMsgNotice
      ..msgShowDetail = msgShowDetail ?? this.msgShowDetail
      ..voiceOn = voiceOn ?? this.voiceOn
      ..shockOn = shockOn ?? this.shockOn
      ..offlineProtection = offlineProtection ?? this.offlineProtection
      ..deviceLock = deviceLock ?? this.deviceLock
      ..muteOfApp = muteOfApp ?? this.muteOfApp;
  }
}
