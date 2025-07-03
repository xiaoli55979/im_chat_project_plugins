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
  String? appId = ""; // 应用ID
  int? appLock = 0; // 应用锁定状态(0-未锁定,1-锁定)
  String? avatar = ""; // 用户头像URL
  String? baseAvatar = ""; // 基础头像URL
  String? category = ""; // 用户分类
  int? chatNotice = 0; // 聊天通知设置(0-关闭,1-开启)
  String? chatPwd = ""; // 聊天密码
  String? lang = ""; // 用户语言设置
  int? lockAfterMinute = 0; // 自动锁屏时间(分钟)
  String? lockScreenPwd = ""; // 锁屏密码
  int? msgExpireSecond = 0; // 消息过期时间(秒)
  int? msgReadReceipt = 0; // 消息已读回执设置(0-关闭,1-开启)
  String? name = ""; // 用户昵称
  String? phone = ""; // 手机号码
  int? phoneByFriend = 0; // 是否允许好友查看手机号(0-不允许,1-允许)
  int? pwdType = 0; // 密码类型
  int? role = 0; // 用户角色
  String? rsaPublicKey = ""; // RSA公钥
  int? searchByPhone = 0; // 是否允许通过手机号搜索(0-不允许,1-允许)
  String? serverId = ""; // 服务器ID
  UserInfoSetting? setting = UserInfoSetting(); // 用户设置
  int? sex = 0; // 性别(0-未知,1-男,2-女)
  int? shockOn = 0; // 震动提醒设置(0-关闭,1-开启)
  String? shortNo = ""; // 短号
  int? shortStatus = 0; // 短号状态
  String? sign = ""; // 个性签名
  String? token = ""; // 用户令牌
  int? topConversation = 0; // 置顶会话设置
  String? uid = ""; // 用户唯一ID
  String? username = ""; // 用户名
  int? voiceNotice = 0; // 语音通知设置(0-关闭,1-开启)
  int? voiceOn = 0; // 语音消息设置(0-关闭,1-开启)
  String? zone = ""; // 时区

  UserInfoData(
      {appId,
        appLock,
        avatar,
        baseAvatar,
        category,
        chatNotice,
        chatPwd,
        lang,
        lockAfterMinute,
        lockScreenPwd,
        msgExpireSecond,
        msgReadReceipt,
        name,
        phone,
        phoneByFriend,
        pwdType,
        role,
        rsaPublicKey,
        searchByPhone,
        serverId,
        setting,
        sex,
        shockOn,
        shortNo,
        shortStatus,
        sign,
        token,
        topConversation,
        uid,
        username,
        voiceNotice,
        voiceOn,
        zone});

  @override
  UserInfoData.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      appId = json['app_id'];
      appLock = json['app_lock'];
      avatar = json['avatar'];
      baseAvatar = json['base_avatar'];
      category = json['category'];
      chatNotice = json['chat_notice'];
      chatPwd = json['chat_pwd'];
      lang = json['lang'];
      lockAfterMinute = json['lock_after_minute'];
      lockScreenPwd = json['lock_screen_pwd'];
      msgExpireSecond = json['msg_expire_second'];
      msgReadReceipt = json['msg_read_receipt'];
      name = json['name'];
      phone = json['phone'];
      phoneByFriend = json['phone_by_friend'];
      pwdType = json['pwd_type'];
      role = json['role'];
      rsaPublicKey = json['rsa_public_key'];
      searchByPhone = json['search_by_phone'];
      serverId = json['server_id'];
      if (json['setting'] != null) {
        setting = UserInfoSetting.fromJson(json['setting']);
      }
      sex = json['sex'];
      shockOn = json['shock_on'];
      shortNo = json['short_no'];
      shortStatus = json['short_status'];
      sign = json['sign'];
      token = json['token'];
      topConversation = json['top_conversation'];
      uid = json['uid'];
      username = json['username'];
      voiceNotice = json['voice_notice'];
      voiceOn = json['voice_on'];
      zone = json['zone'];
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['app_id'] = appId;
    data['app_lock'] = appLock;
    data['avatar'] = avatar;
    data['base_avatar'] = baseAvatar;
    data['category'] = category;
    data['chat_notice'] = chatNotice;
    data['chat_pwd'] = chatPwd;
    data['lang'] = lang;
    data['lock_after_minute'] = lockAfterMinute;
    data['lock_screen_pwd'] = lockScreenPwd;
    data['msg_expire_second'] = msgExpireSecond;
    data['msg_read_receipt'] = msgReadReceipt;
    data['name'] = name;
    data['phone'] = phone;
    data['phone_by_friend'] = phoneByFriend;
    data['pwd_type'] = pwdType;
    data['role'] = role;
    data['rsa_public_key'] = rsaPublicKey;
    data['search_by_phone'] = searchByPhone;
    data['server_id'] = serverId;
    data['setting'] = setting?.toJson();
    data['sex'] = sex;
    data['shock_on'] = shockOn;
    data['short_no'] = shortNo;
    data['short_status'] = shortStatus;
    data['sign'] = sign;
    data['token'] = token;
    data['top_conversation'] = topConversation;
    data['uid'] = uid;
    data['username'] = username;
    data['voice_notice'] = voiceNotice;
    data['voice_on'] = voiceOn;
    data['zone'] = zone;
    return data;
  }
}

class UserInfoSetting extends BaseData {
  int? deviceLock = 0; // 设备锁（0-关闭，1-开启）
  int? msgShowDetail = 0; // 消息详情显示（0-不显示，1-显示）
  int? muteOfApp = 0; // 全局静音（0-关闭，1-开启）
  int? newMsgNotice = 0; // 新消息通知（0-关闭，1-开启）
  int? offlineProtection = 0; // 离线保护（0-关闭，1-开启）
  int? searchByPhone = 0; // 手机号搜索（0-不允许，1-允许）
  int? searchByShort = 0; // 短号搜索（0-不允许，1-允许）
  int? shockOn = 0; // 震动提醒（0-关闭，1-开启）
  int? voiceOn = 0; // 语音提醒（0-关闭，1-开启）

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