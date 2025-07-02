import 'dart:convert';

import 'package:line_detection_plugin/generated/json/base/json_field.dart';
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
@JsonSerializable()
class UserInfoModelEntity {
	String? appId;
	int? appLock;
	String? avatar;
	String? baseAvatar;
	String? category;
	int? chatNotice;
	String? chatPwd;
	String? lang;
	int? lockAfterMinute;
	String? lockScreenPwd;
	int? msgExpireSecond;
	int? msgReadReceipt;
	String? name;
	String? phone;
	int? phoneByFriend;
	int? pwdType;
	int? role;
	String? rsaPublicKey;
	int? searchByPhone;
	String? serverId;
	Setting? setting;
	int? sex;
	int? shockOn;
	String? shortNo;
	int? shortStatus;
	String? sign;
	String? token;
	int? topConversation;
	String? uid;
	String? username;
	int? voiceNotice;
	int? voiceOn;
	String? zone;

	UserInfoModelEntity(
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

	UserInfoModelEntity.fromJson(dynamic json) {
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
		json['setting'] != null ? new Setting.fromJson(json['setting']) : null;
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

class Setting {
	int? deviceLock;
	int? msgShowDetail;
	int? muteOfApp;
	int? newMsgNotice;
	int? offlineProtection;
	int? searchByPhone;
	int? searchByShort;
	int? shockOn;
	int? voiceOn;

	Setting(
			{this.deviceLock,
				this.msgShowDetail,
				this.muteOfApp,
				this.newMsgNotice,
				this.offlineProtection,
				this.searchByPhone,
				this.searchByShort,
				this.shockOn,
				this.voiceOn});

	Setting.fromJson(Map<String, dynamic> json) {
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