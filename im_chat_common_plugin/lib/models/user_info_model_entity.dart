import 'package:im_chat_common_plugin/generated/json/base/json_field.dart';
import 'package:im_chat_common_plugin/generated/json/user_info_model_entity.g.dart';
import 'dart:convert';
export 'package:im_chat_common_plugin/generated/json/user_info_model_entity.g.dart';

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
	@JSONField(name: 'app_id')
	late String appId;
	late String category;
	@JSONField(name: 'chat_pwd')
	late String chatPwd;
	late String lang;
	@JSONField(name: 'lock_after_minute')
	late int lockAfterMinute;
	@JSONField(name: 'lock_screen_pwd')
	late String lockScreenPwd;
	@JSONField(name: 'msg_expire_second')
	late int msgExpireSecond;
	late String name;
	late String phone;
	late int role;
	@JSONField(name: 'rsa_public_key')
	late String rsaPublicKey;
	@JSONField(name: 'server_id')
	late String serverId;
	late UserInfoModelSetting setting;
	late int sex;
	@JSONField(name: 'short_no')
	late String shortNo;
	@JSONField(name: 'short_status')
	late int shortStatus;
	late String sign;
	late String token;
	late String uid;
	late String username;
	late String zone;
	late String avatar;

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
	@JSONField(name: 'device_lock')
	late int deviceLock;
	@JSONField(name: 'msg_show_detail')
	late int msgShowDetail;
	@JSONField(name: 'mute_of_app')
	late int muteOfApp;
	@JSONField(name: 'new_msg_notice')
	late int newMsgNotice;
	@JSONField(name: 'offline_protection')
	late int offlineProtection;
	@JSONField(name: 'search_by_phone')
	late int searchByPhone;
	@JSONField(name: 'search_by_short')
	late int searchByShort;
	@JSONField(name: 'shock_on')
	late int shockOn;
	@JSONField(name: 'voice_on')
	late int voiceOn;

	UserInfoModelSetting();

	factory UserInfoModelSetting.fromJson(Map<String, dynamic> json) => $UserInfoModelSettingFromJson(json);

	Map<String, dynamic> toJson() => $UserInfoModelSettingToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}