import 'package:im_chat_common_plugin/models/response/base_response_entity.dart';

class WKUserInfoData extends BaseData{
  int? appLock;
  int? autoScanFriend;
  String? avatar;
  String? baseAvatar;
  int? chatNotice;
  String? email;
  int? friendStatus;
  String? lockScreenPwd;
  String? name;
  String? phone;
  String? qrExpireTime;
  String? remark;
  String? serverId;
  int? sex;
  String? shortNo;
  String? sign;
  String? uid;
  String? vercode;
  int? voiceNotice;
  String? zone;

  WKUserInfoData(
      {appLock,
        autoScanFriend,
        avatar,
        baseAvatar,
        chatNotice,
        email,
        friendStatus,
        lockScreenPwd,
        name,
        phone,
        qrExpireTime,
        remark,
        serverId,
        sex,
        shortNo,
        sign,
        uid,
        vercode,
        voiceNotice,
        zone});

  @override
  WKUserInfoData.fromJson(dynamic json) {
    appLock = json['app_lock'];
    autoScanFriend = json['auto_scan_friend'];
    avatar = json['avatar'];
    baseAvatar = json['base_avatar'];
    chatNotice = json['chat_notice'];
    email = json['email'];
    friendStatus = json['friend_status'];
    lockScreenPwd = json['lock_screen_pwd'];
    name = json['name'];
    phone = json['phone'];
    qrExpireTime = json['qr_expire_time'];
    remark = json['remark'];
    serverId = json['server_id'];
    sex = json['sex'];
    shortNo = json['short_no'];
    sign = json['sign'];
    uid = json['uid'];
    vercode = json['vercode'];
    voiceNotice = json['voice_notice'];
    zone = json['zone'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['app_lock'] = appLock;
    data['auto_scan_friend'] = autoScanFriend;
    data['avatar'] = avatar;
    data['base_avatar'] = baseAvatar;
    data['chat_notice'] = chatNotice;
    data['email'] = email;
    data['friend_status'] = friendStatus;
    data['lock_screen_pwd'] = lockScreenPwd;
    data['name'] = name;
    data['phone'] = phone;
    data['qr_expire_time'] = qrExpireTime;
    data['remark'] = remark;
    data['server_id'] = serverId;
    data['sex'] = sex;
    data['short_no'] = shortNo;
    data['sign'] = sign;
    data['uid'] = uid;
    data['vercode'] = vercode;
    data['voice_notice'] = voiceNotice;
    data['zone'] = zone;
    return data;
  }
}
