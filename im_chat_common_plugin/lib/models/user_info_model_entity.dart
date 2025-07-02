import 'package:im_chat_common_plugin/generated/json/user_info_model_entity.g.dart';
import 'dart:convert';

import 'package:line_detection_plugin/generated/json/base/json_field.dart';
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
	String appId = '';
	@JSONField(name: 'app_lock')
	int appLock = 0;
	String avatar = '';
	@JSONField(name: 'base_avatar')
	String baseAvatar = '';
	String category = '';
	@JSONField(name: 'chat_notice')
	int chatNotice = 0;
	@JSONField(name: 'chat_pwd')
	String chatPwd = '';
	String lang = '';
	@JSONField(name: 'lock_after_minute')
	int lockAfterMinute = 0;
	@JSONField(name: 'lock_screen_pwd')
	String lockScreenPwd = '';
	@JSONField(name: 'msg_expire_second')
	int msgExpireSecond = 0;
	@JSONField(name: 'msg_read_receipt')
	int msgReadReceipt = 0;
	String name = '';
	String phone = '';
	@JSONField(name: 'phone_by_friend')
	int phoneByFriend = 0;
	@JSONField(name: 'pwd_type')
	int pwdType = 0;
	int role = 0;
	@JSONField(name: 'rsa_public_key')
	String rsaPublicKey = '';
	@JSONField(name: 'search_by_phone')
	int searchByPhone = 0;
	@JSONField(name: 'server_id')
	String serverId = '';
	late UserInfoModelSetting setting = UserInfoModelSetting();
	int sex = 0;
	@JSONField(name: 'shock_on')
	int shockOn = 0;
	@JSONField(name: 'short_no')
	String shortNo = '';
	@JSONField(name: 'short_status')
	int shortStatus = 0;
	String sign = '';
	String token = '';
	@JSONField(name: 'top_conversation')
	int topConversation = 0;
	String uid = '';
	String username = '';
	@JSONField(name: 'voice_notice')
	int voiceNotice = 0;
	@JSONField(name: 'voice_on')
	int voiceOn = 0;
	String zone = '';

	UserInfoModelEntity();

	factory UserInfoModelEntity.fromJson(dynamic json) => $UserInfoModelEntityFromJson(json);

	Map<String, dynamic> toJson() => $UserInfoModelEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserInfoModelSetting {
	@JSONField(name: 'device_lock')
	int deviceLock = 0;
	@JSONField(name: 'msg_show_detail')
	int msgShowDetail = 0;
	@JSONField(name: 'mute_of_app')
	int muteOfApp = 0;
	@JSONField(name: 'new_msg_notice')
	int newMsgNotice = 0;
	@JSONField(name: 'offline_protection')
	int offlineProtection = 0;
	@JSONField(name: 'search_by_phone')
	int searchByPhone = 0;
	@JSONField(name: 'search_by_short')
	int searchByShort = 0;
	@JSONField(name: 'shock_on')
	int shockOn = 0;
	@JSONField(name: 'voice_on')
	int voiceOn = 0;

	UserInfoModelSetting();

	factory UserInfoModelSetting.fromJson(dynamic json) => $UserInfoModelSettingFromJson(json);

	Map<String, dynamic> toJson() => $UserInfoModelSettingToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}