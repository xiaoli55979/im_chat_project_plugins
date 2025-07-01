import 'package:im_chat_common_plugin/generated/json/base/json_convert_content.dart';
import 'package:im_chat_common_plugin/models/user_info_model_entity.dart';

UserInfoModelEntity $UserInfoModelEntityFromJson(Map<String, dynamic> json) {
  final UserInfoModelEntity userInfoModelEntity = UserInfoModelEntity();
  final String? appId = jsonConvert.convert<String>(json['app_id']);
  if (appId != null) {
    userInfoModelEntity.appId = appId;
  }
  final int? appLock = jsonConvert.convert<int>(json['app_lock']);
  if (appLock != null) {
    userInfoModelEntity.appLock = appLock;
  }
  final String? avatar = jsonConvert.convert<String>(json['avatar']);
  if (avatar != null) {
    userInfoModelEntity.avatar = avatar;
  }
  final String? baseAvatar = jsonConvert.convert<String>(json['base_avatar']);
  if (baseAvatar != null) {
    userInfoModelEntity.baseAvatar = baseAvatar;
  }
  final String? category = jsonConvert.convert<String>(json['category']);
  if (category != null) {
    userInfoModelEntity.category = category;
  }
  final int? chatNotice = jsonConvert.convert<int>(json['chat_notice']);
  if (chatNotice != null) {
    userInfoModelEntity.chatNotice = chatNotice;
  }
  final String? chatPwd = jsonConvert.convert<String>(json['chat_pwd']);
  if (chatPwd != null) {
    userInfoModelEntity.chatPwd = chatPwd;
  }
  final String? lang = jsonConvert.convert<String>(json['lang']);
  if (lang != null) {
    userInfoModelEntity.lang = lang;
  }
  final int? lockAfterMinute = jsonConvert.convert<int>(
      json['lock_after_minute']);
  if (lockAfterMinute != null) {
    userInfoModelEntity.lockAfterMinute = lockAfterMinute;
  }
  final String? lockScreenPwd = jsonConvert.convert<String>(
      json['lock_screen_pwd']);
  if (lockScreenPwd != null) {
    userInfoModelEntity.lockScreenPwd = lockScreenPwd;
  }
  final int? msgExpireSecond = jsonConvert.convert<int>(
      json['msg_expire_second']);
  if (msgExpireSecond != null) {
    userInfoModelEntity.msgExpireSecond = msgExpireSecond;
  }
  final int? msgReadReceipt = jsonConvert.convert<int>(
      json['msg_read_receipt']);
  if (msgReadReceipt != null) {
    userInfoModelEntity.msgReadReceipt = msgReadReceipt;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    userInfoModelEntity.name = name;
  }
  final String? phone = jsonConvert.convert<String>(json['phone']);
  if (phone != null) {
    userInfoModelEntity.phone = phone;
  }
  final int? phoneByFriend = jsonConvert.convert<int>(json['phone_by_friend']);
  if (phoneByFriend != null) {
    userInfoModelEntity.phoneByFriend = phoneByFriend;
  }
  final int? pwdType = jsonConvert.convert<int>(json['pwd_type']);
  if (pwdType != null) {
    userInfoModelEntity.pwdType = pwdType;
  }
  final int? role = jsonConvert.convert<int>(json['role']);
  if (role != null) {
    userInfoModelEntity.role = role;
  }
  final String? rsaPublicKey = jsonConvert.convert<String>(
      json['rsa_public_key']);
  if (rsaPublicKey != null) {
    userInfoModelEntity.rsaPublicKey = rsaPublicKey;
  }
  final int? searchByPhone = jsonConvert.convert<int>(json['search_by_phone']);
  if (searchByPhone != null) {
    userInfoModelEntity.searchByPhone = searchByPhone;
  }
  final String? serverId = jsonConvert.convert<String>(json['server_id']);
  if (serverId != null) {
    userInfoModelEntity.serverId = serverId;
  }
  final UserInfoModelSetting? setting = jsonConvert.convert<
      UserInfoModelSetting>(json['setting']);
  if (setting != null) {
    userInfoModelEntity.setting = setting;
  }
  final int? sex = jsonConvert.convert<int>(json['sex']);
  if (sex != null) {
    userInfoModelEntity.sex = sex;
  }
  final int? shockOn = jsonConvert.convert<int>(json['shock_on']);
  if (shockOn != null) {
    userInfoModelEntity.shockOn = shockOn;
  }
  final String? shortNo = jsonConvert.convert<String>(json['short_no']);
  if (shortNo != null) {
    userInfoModelEntity.shortNo = shortNo;
  }
  final int? shortStatus = jsonConvert.convert<int>(json['short_status']);
  if (shortStatus != null) {
    userInfoModelEntity.shortStatus = shortStatus;
  }
  final String? sign = jsonConvert.convert<String>(json['sign']);
  if (sign != null) {
    userInfoModelEntity.sign = sign;
  }
  final String? token = jsonConvert.convert<String>(json['token']);
  if (token != null) {
    userInfoModelEntity.token = token;
  }
  final int? topConversation = jsonConvert.convert<int>(
      json['top_conversation']);
  if (topConversation != null) {
    userInfoModelEntity.topConversation = topConversation;
  }
  final String? uid = jsonConvert.convert<String>(json['uid']);
  if (uid != null) {
    userInfoModelEntity.uid = uid;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    userInfoModelEntity.username = username;
  }
  final int? voiceNotice = jsonConvert.convert<int>(json['voice_notice']);
  if (voiceNotice != null) {
    userInfoModelEntity.voiceNotice = voiceNotice;
  }
  final int? voiceOn = jsonConvert.convert<int>(json['voice_on']);
  if (voiceOn != null) {
    userInfoModelEntity.voiceOn = voiceOn;
  }
  final String? zone = jsonConvert.convert<String>(json['zone']);
  if (zone != null) {
    userInfoModelEntity.zone = zone;
  }
  return userInfoModelEntity;
}

Map<String, dynamic> $UserInfoModelEntityToJson(UserInfoModelEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['app_id'] = entity.appId;
  data['app_lock'] = entity.appLock;
  data['avatar'] = entity.avatar;
  data['base_avatar'] = entity.baseAvatar;
  data['category'] = entity.category;
  data['chat_notice'] = entity.chatNotice;
  data['chat_pwd'] = entity.chatPwd;
  data['lang'] = entity.lang;
  data['lock_after_minute'] = entity.lockAfterMinute;
  data['lock_screen_pwd'] = entity.lockScreenPwd;
  data['msg_expire_second'] = entity.msgExpireSecond;
  data['msg_read_receipt'] = entity.msgReadReceipt;
  data['name'] = entity.name;
  data['phone'] = entity.phone;
  data['phone_by_friend'] = entity.phoneByFriend;
  data['pwd_type'] = entity.pwdType;
  data['role'] = entity.role;
  data['rsa_public_key'] = entity.rsaPublicKey;
  data['search_by_phone'] = entity.searchByPhone;
  data['server_id'] = entity.serverId;
  data['setting'] = entity.setting.toJson();
  data['sex'] = entity.sex;
  data['shock_on'] = entity.shockOn;
  data['short_no'] = entity.shortNo;
  data['short_status'] = entity.shortStatus;
  data['sign'] = entity.sign;
  data['token'] = entity.token;
  data['top_conversation'] = entity.topConversation;
  data['uid'] = entity.uid;
  data['username'] = entity.username;
  data['voice_notice'] = entity.voiceNotice;
  data['voice_on'] = entity.voiceOn;
  data['zone'] = entity.zone;
  return data;
}

extension UserInfoModelEntityExtension on UserInfoModelEntity {
  UserInfoModelEntity copyWith({
    String? appId,
    int? appLock,
    String? avatar,
    String? baseAvatar,
    String? category,
    int? chatNotice,
    String? chatPwd,
    String? lang,
    int? lockAfterMinute,
    String? lockScreenPwd,
    int? msgExpireSecond,
    int? msgReadReceipt,
    String? name,
    String? phone,
    int? phoneByFriend,
    int? pwdType,
    int? role,
    String? rsaPublicKey,
    int? searchByPhone,
    String? serverId,
    UserInfoModelSetting? setting,
    int? sex,
    int? shockOn,
    String? shortNo,
    int? shortStatus,
    String? sign,
    String? token,
    int? topConversation,
    String? uid,
    String? username,
    int? voiceNotice,
    int? voiceOn,
    String? zone,
  }) {
    return UserInfoModelEntity()
      ..appId = appId ?? this.appId
      ..appLock = appLock ?? this.appLock
      ..avatar = avatar ?? this.avatar
      ..baseAvatar = baseAvatar ?? this.baseAvatar
      ..category = category ?? this.category
      ..chatNotice = chatNotice ?? this.chatNotice
      ..chatPwd = chatPwd ?? this.chatPwd
      ..lang = lang ?? this.lang
      ..lockAfterMinute = lockAfterMinute ?? this.lockAfterMinute
      ..lockScreenPwd = lockScreenPwd ?? this.lockScreenPwd
      ..msgExpireSecond = msgExpireSecond ?? this.msgExpireSecond
      ..msgReadReceipt = msgReadReceipt ?? this.msgReadReceipt
      ..name = name ?? this.name
      ..phone = phone ?? this.phone
      ..phoneByFriend = phoneByFriend ?? this.phoneByFriend
      ..pwdType = pwdType ?? this.pwdType
      ..role = role ?? this.role
      ..rsaPublicKey = rsaPublicKey ?? this.rsaPublicKey
      ..searchByPhone = searchByPhone ?? this.searchByPhone
      ..serverId = serverId ?? this.serverId
      ..setting = setting ?? this.setting
      ..sex = sex ?? this.sex
      ..shockOn = shockOn ?? this.shockOn
      ..shortNo = shortNo ?? this.shortNo
      ..shortStatus = shortStatus ?? this.shortStatus
      ..sign = sign ?? this.sign
      ..token = token ?? this.token
      ..topConversation = topConversation ?? this.topConversation
      ..uid = uid ?? this.uid
      ..username = username ?? this.username
      ..voiceNotice = voiceNotice ?? this.voiceNotice
      ..voiceOn = voiceOn ?? this.voiceOn
      ..zone = zone ?? this.zone;
  }
}

UserInfoModelSetting $UserInfoModelSettingFromJson(Map<String, dynamic> json) {
  final UserInfoModelSetting userInfoModelSetting = UserInfoModelSetting();
  final int? deviceLock = jsonConvert.convert<int>(json['device_lock']);
  if (deviceLock != null) {
    userInfoModelSetting.deviceLock = deviceLock;
  }
  final int? msgShowDetail = jsonConvert.convert<int>(json['msg_show_detail']);
  if (msgShowDetail != null) {
    userInfoModelSetting.msgShowDetail = msgShowDetail;
  }
  final int? muteOfApp = jsonConvert.convert<int>(json['mute_of_app']);
  if (muteOfApp != null) {
    userInfoModelSetting.muteOfApp = muteOfApp;
  }
  final int? newMsgNotice = jsonConvert.convert<int>(json['new_msg_notice']);
  if (newMsgNotice != null) {
    userInfoModelSetting.newMsgNotice = newMsgNotice;
  }
  final int? offlineProtection = jsonConvert.convert<int>(
      json['offline_protection']);
  if (offlineProtection != null) {
    userInfoModelSetting.offlineProtection = offlineProtection;
  }
  final int? searchByPhone = jsonConvert.convert<int>(json['search_by_phone']);
  if (searchByPhone != null) {
    userInfoModelSetting.searchByPhone = searchByPhone;
  }
  final int? searchByShort = jsonConvert.convert<int>(json['search_by_short']);
  if (searchByShort != null) {
    userInfoModelSetting.searchByShort = searchByShort;
  }
  final int? shockOn = jsonConvert.convert<int>(json['shock_on']);
  if (shockOn != null) {
    userInfoModelSetting.shockOn = shockOn;
  }
  final int? voiceOn = jsonConvert.convert<int>(json['voice_on']);
  if (voiceOn != null) {
    userInfoModelSetting.voiceOn = voiceOn;
  }
  return userInfoModelSetting;
}

Map<String, dynamic> $UserInfoModelSettingToJson(UserInfoModelSetting entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['device_lock'] = entity.deviceLock;
  data['msg_show_detail'] = entity.msgShowDetail;
  data['mute_of_app'] = entity.muteOfApp;
  data['new_msg_notice'] = entity.newMsgNotice;
  data['offline_protection'] = entity.offlineProtection;
  data['search_by_phone'] = entity.searchByPhone;
  data['search_by_short'] = entity.searchByShort;
  data['shock_on'] = entity.shockOn;
  data['voice_on'] = entity.voiceOn;
  return data;
}

extension UserInfoModelSettingExtension on UserInfoModelSetting {
  UserInfoModelSetting copyWith({
    int? deviceLock,
    int? msgShowDetail,
    int? muteOfApp,
    int? newMsgNotice,
    int? offlineProtection,
    int? searchByPhone,
    int? searchByShort,
    int? shockOn,
    int? voiceOn,
  }) {
    return UserInfoModelSetting()
      ..deviceLock = deviceLock ?? this.deviceLock
      ..msgShowDetail = msgShowDetail ?? this.msgShowDetail
      ..muteOfApp = muteOfApp ?? this.muteOfApp
      ..newMsgNotice = newMsgNotice ?? this.newMsgNotice
      ..offlineProtection = offlineProtection ?? this.offlineProtection
      ..searchByPhone = searchByPhone ?? this.searchByPhone
      ..searchByShort = searchByShort ?? this.searchByShort
      ..shockOn = shockOn ?? this.shockOn
      ..voiceOn = voiceOn ?? this.voiceOn;
  }
}