import 'package:im_chat_common_plugin/generated/json/base/json_field.dart';
import 'package:im_chat_common_plugin/generated/json/friend_model_entity.g.dart';
import 'dart:convert';
export 'package:im_chat_common_plugin/generated/json/friend_model_entity.g.dart';

@JsonSerializable()
class FriendModelEntity {
	late String uid = '';
	late String name = '';
	late String username = '';
	late String email = '';
	late String zone = '';
	late String phone = '';
	late int mute = 0;
	late int top = 0;
	late int sex = 0;
	late String category = '';
	@JSONField(name: 'short_no')
	late String shortNo = '';
	@JSONField(name: 'chat_pwd_on')
	late int chatPwdOn = 0;
	late int screenshot = 0;
	@JSONField(name: 'revoke_remind')
	late int revokeRemind = 0;
	late int receipt = 0;
	late int online = 0;
	@JSONField(name: 'last_offline')
	late int lastOffline = 0;
	@JSONField(name: 'device_flag')
	late int deviceFlag = 0;
	late int follow = 0;
	@JSONField(name: 'be_deleted')
	late int beDeleted = 0;
	@JSONField(name: 'be_blacklist')
	late int beBlacklist = 0;
	late String vercode = '';
	@JSONField(name: 'source_desc')
	late String sourceDesc = '';
	late String remark = '';
	@JSONField(name: 'is_upload_avatar')
	late int isUploadAvatar = 0;
	late int status = 0;
	late int robot = 0;
	@JSONField(name: 'is_destroy')
	late int isDestroy = 0;
	late int flame = 0;
	@JSONField(name: 'flame_second')
	late int flameSecond = 0;
	late int version = 0;
	@JSONField(name: 'is_deleted')
	late int isDeleted = 0;
	@JSONField(name: 'created_at')
	late String createdAt = '';
	@JSONField(name: 'updated_at')
	late String updatedAt = '';
	@JSONField(name: 'nick_name')
	late String nickName = '';
	late String avatar = '';
	@JSONField(name: 'service_id')
	late String serviceId = '';
	@JSONField(name: 'is_friend')
	late int isFriend = 0;
	late String sign = '';

	FriendModelEntity();

	factory FriendModelEntity.fromJson(Map<String, dynamic> json) => $FriendModelEntityFromJson(json);

	Map<String, dynamic> toJson() => $FriendModelEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}