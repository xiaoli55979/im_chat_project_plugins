import 'package:im_chat_common_plugin/models/response/base_response_entity.dart';

enum UserOnlineStatus {
  app(0),
  web(1),
  pc(2);

  const UserOnlineStatus(this.value);

  final int value;

  static UserOnlineStatus userOnlineStatus(int deviceFlag) {
    if (deviceFlag == web.value) {
      return web;
    } else if (deviceFlag == pc.value) {
      return pc;
    }
    return app;
  }

  String get name {
    switch (this) {
      case web:
        return 'Web';
      case pc:
        return 'PC';
      default:
        return '手机';
    }
  }
}

class UserInfoData extends BaseData {
  String? appId;
  String? avatar;
  String? baseAvatar;
  String? category;
  String? chatPwd;
  String? lang;
  int? lockAfterMinute;
  String? lockScreenPwd;
  int? msgExpireSecond;
  String? name;
  String? phone;
  int? role;
  String? rsaPublicKey;
  String? serverId;
  UserInfoSetting? setting;
  int? sex;
  String? shortNo;
  int? shortStatus;
  String? sign;
  String? token;
  String? uid;
  String? username;
  String? zone;

  UserInfoData(
      {appId,
        avatar,
        baseAvatar,
        category,
        chatPwd,
        lang,
        lockAfterMinute,
        lockScreenPwd,
        msgExpireSecond,
        name,
        phone,
        role,
        rsaPublicKey,
        serverId,
        setting,
        sex,
        shortNo,
        shortStatus,
        sign,
        token,
        uid,
        username,
        zone});

  @override
  UserInfoData.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      appId = json['app_id'];
      avatar = json['avatar'];
      baseAvatar = json['base_avatar'];
      category = json['category'];
      chatPwd = json['chat_pwd'];
      lang = json['lang'];
      lockAfterMinute = json['lock_after_minute'];
      lockScreenPwd = json['lock_screen_pwd'];
      msgExpireSecond = json['msg_expire_second'];
      name = json['name'];
      phone = json['phone'];
      role = json['role'];
      rsaPublicKey = json['rsa_public_key'];
      serverId = json['server_id'];
      setting = json['setting'] != null ? UserInfoSetting.fromJson(json['setting']) : null;
      sex = json['sex'];
      shortNo = json['short_no'];
      shortStatus = json['short_status'];
      sign = json['sign'];
      token = json['token'];
      uid = json['uid'];
      username = json['username'];
      zone = json['zone'];
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['app_id'] = appId;
    data['avatar'] = avatar;
    data['base_avatar'] = baseAvatar;
    data['category'] = category;
    data['chat_pwd'] = chatPwd;
    data['lang'] = lang;
    data['lock_after_minute'] = lockAfterMinute;
    data['lock_screen_pwd'] = lockScreenPwd;
    data['msg_expire_second'] = msgExpireSecond;
    data['name'] = name;
    data['phone'] = phone;
    data['role'] = role;
    data['rsa_public_key'] = rsaPublicKey;
    data['server_id'] = serverId;
    data['setting'] = setting?.toJson();
    data['sex'] = sex;
    data['short_no'] = shortNo;
    data['short_status'] = shortStatus;
    data['sign'] = sign;
    data['token'] = token;
    data['uid'] = uid;
    data['username'] = username;
    data['zone'] = zone;
    return data;
  }
}

class UserInfoSetting {
  int? deviceLock;
  int? msgShowDetail;
  int? muteOfApp;
  int? newMsgNotice;
  int? offlineProtection;
  int? searchByPhone;
  int? searchByShort;
  int? shockOn;
  int? voiceOn;

  UserInfoSetting(
      {deviceLock,
        msgShowDetail,
        muteOfApp,
        newMsgNotice,
        offlineProtection,
        searchByPhone,
        searchByShort,
        shockOn,
        voiceOn});

  @override
  UserInfoSetting.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      deviceLock = json['device_lock'];
      msgShowDetail = json['msg_show_detail'];
      muteOfApp = json['mute_of_app'];
      newMsgNotice = json['new_msg_notice'];
      offlineProtection = json['offline_protection'];
      searchByPhone = json['search_by_phone'];
      searchByShort = json['search_by_short'];
      shockOn = json['shock_on'];
      voiceOn = json['voice_on'];
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['device_lock'] = deviceLock;
    data['msg_show_detail'] = msgShowDetail;
    data['mute_of_app'] = muteOfApp;
    data['new_msg_notice'] = newMsgNotice;
    data['offline_protection'] = offlineProtection;
    data['search_by_phone'] = searchByPhone;
    data['search_by_short'] = searchByShort;
    data['shock_on'] = shockOn;
    data['voice_on'] = voiceOn;
    return data;
  }
}
