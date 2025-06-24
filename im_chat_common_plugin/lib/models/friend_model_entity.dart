import 'package:im_chat_common_plugin/generated/json/base/json_field.dart';
import 'package:im_chat_common_plugin/generated/json/friend_model_entity.g.dart';
import 'dart:convert';
export 'package:im_chat_common_plugin/generated/json/friend_model_entity.g.dart';

@JsonSerializable()
class FriendModelEntity {
	late String uid;
	late String name;
	late String username;
	late String email;
	late String zone;
	late String phone;
	late int mute;
	late int top;
	late int sex;
	late String category;
	@JSONField(name: 'short_no')
	late String shortNo;
	@JSONField(name: 'chat_pwd_on')
	late int chatPwdOn;
	late int screenshot;
	@JSONField(name: 'revoke_remind')
	late int revokeRemind;
	late int receipt;
	late int online;
	@JSONField(name: 'last_offline')
	late int lastOffline;
	@JSONField(name: 'device_flag')
	late int deviceFlag;
	late int follow;
	@JSONField(name: 'be_deleted')
	late int beDeleted;
	@JSONField(name: 'be_blacklist')
	late int beBlacklist;
	late String vercode;
	@JSONField(name: 'source_desc')
	late String sourceDesc;
	late String remark;
	@JSONField(name: 'is_upload_avatar')
	late int isUploadAvatar;
	late int status;
	late int robot;
	@JSONField(name: 'is_destroy')
	late int isDestroy;
	late int flame;
	@JSONField(name: 'flame_second')
	late int flameSecond;
	late int version;
	@JSONField(name: 'is_deleted')
	late int isDeleted;
	@JSONField(name: 'created_at')
	late String createdAt;
	@JSONField(name: 'updated_at')
	late String updatedAt;
	@JSONField(name: 'nick_name')
	late String nickName;
	late String avatar;
	@JSONField(name: 'service_id')
	late String serviceId;
	@JSONField(name: 'is_friend')
	late int isFriend;
	late String sign;

	FriendModelEntity();

	factory FriendModelEntity.fromJson(Map<String, dynamic> json) => $FriendModelEntityFromJson(json);

	Map<String, dynamic> toJson() => $FriendModelEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}