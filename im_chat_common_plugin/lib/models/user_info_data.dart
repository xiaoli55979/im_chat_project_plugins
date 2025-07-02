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
      {this.appId,
        this.appLock,
        this.avatar,
        this.baseAvatar,
        this.category,
        this.chatNotice,
        this.chatPwd,
        this.lang,
        this.lockAfterMinute,
        this.lockScreenPwd,
        this.msgExpireSecond,
        this.msgReadReceipt,
        this.name,
        this.phone,
        this.phoneByFriend,
        this.pwdType,
        this.role,
        this.rsaPublicKey,
        this.searchByPhone,
        this.serverId,
        this.setting,
        this.sex,
        this.shockOn,
        this.shortNo,
        this.shortStatus,
        this.sign,
        this.token,
        this.topConversation,
        this.uid,
        this.username,
        this.voiceNotice,
        this.voiceOn,
        this.zone});

  UserInfoData.fromJson(dynamic json) {
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
    setting =
    json['setting'] != null ? new UserInfoSetting.fromJson(json['setting']) : null;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['app_id'] = this.appId;
    data['app_lock'] = this.appLock;
    data['avatar'] = this.avatar;
    data['base_avatar'] = this.baseAvatar;
    data['category'] = this.category;
    data['chat_notice'] = this.chatNotice;
    data['chat_pwd'] = this.chatPwd;
    data['lang'] = this.lang;
    data['lock_after_minute'] = this.lockAfterMinute;
    data['lock_screen_pwd'] = this.lockScreenPwd;
    data['msg_expire_second'] = this.msgExpireSecond;
    data['msg_read_receipt'] = this.msgReadReceipt;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['phone_by_friend'] = this.phoneByFriend;
    data['pwd_type'] = this.pwdType;
    data['role'] = this.role;
    data['rsa_public_key'] = this.rsaPublicKey;
    data['search_by_phone'] = this.searchByPhone;
    data['server_id'] = this.serverId;
    if (this.setting != null) {
      data['setting'] = this.setting!.toJson();
    }
    data['sex'] = this.sex;
    data['shock_on'] = this.shockOn;
    data['short_no'] = this.shortNo;
    data['short_status'] = this.shortStatus;
    data['sign'] = this.sign;
    data['token'] = this.token;
    data['top_conversation'] = this.topConversation;
    data['uid'] = this.uid;
    data['username'] = this.username;
    data['voice_notice'] = this.voiceNotice;
    data['voice_on'] = this.voiceOn;
    data['zone'] = this.zone;
    return data;
  }
}

class UserInfoSetting {
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
      {this.deviceLock,
        this.msgShowDetail,
        this.muteOfApp,
        this.newMsgNotice,
        this.offlineProtection,
        this.searchByPhone,
        this.searchByShort,
        this.shockOn,
        this.voiceOn});

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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['device_lock'] = this.deviceLock;
    data['msg_show_detail'] = this.msgShowDetail;
    data['mute_of_app'] = this.muteOfApp;
    data['new_msg_notice'] = this.newMsgNotice;
    data['offline_protection'] = this.offlineProtection;
    data['search_by_phone'] = this.searchByPhone;
    data['search_by_short'] = this.searchByShort;
    data['shock_on'] = this.shockOn;
    data['voice_on'] = this.voiceOn;
    return data;
  }
}