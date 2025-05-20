import 'package:im_chat_common_plugin/generated/json/base/json_field.dart';
import 'package:im_chat_common_plugin/generated/json/group_model_entity.g.dart';
import 'dart:convert';
export 'package:im_chat_common_plugin/generated/json/group_model_entity.g.dart';

@JsonSerializable()
class GroupModelEntity {
	late String channelID;
// 频道ID，唯一标识一个频道。

	late int channelType;
// 频道类型，例如：1表示个人频道，2表示群组频道等。

	late String channelName;
// 频道名称，显示在界面上的名称。

	late String channelRemark;
// 频道备注，例如：个人备注或群别名。

	late int showNick;
// 是否显示昵称，0表示不显示，1表示显示。

	late int top;
// 是否置顶，0表示不置顶，1表示置顶。

	late int save;
// 是否保存到通讯录，0表示未保存，1表示已保存。

	late int mute;
// 是否免打扰，0表示未设置免打扰，1表示设置了免打扰。

	late int forbidden;
// 是否禁言，0表示未禁言，1表示禁言。

	late int invite;
// 邀请确认标志，0表示无需确认，1表示需要确认。

	late int status;
// 频道状态，例如：1表示正常，2表示黑名单。

	late int follow;
// 是否已关注，0表示未关注（陌生人），1表示已关注（好友）。

	late int isDeleted;
// 是否已删除，0表示未删除，1表示已删除。

	late String createdAt;
// 频道创建时间，通常为ISO 8601格式字符串。

	late String updatedAt;
// 最近一次更新时间，通常为ISO 8601格式字符串。

	late String avatar;
// 频道头像URL，用于显示头像。

	late int version;
// 频道版本号，用于数据更新判断。

	dynamic localExtra;
// 本地扩展字段，用于存储额外信息（键值对格式）。

	late int online;
// 是否在线状态，0表示离线，1表示在线。

	late int lastOffline;
// 最后一次离线时间，通常为时间戳格式。

	late int deviceFlag;
// 最后一次离线的设备标识，例如：1表示手机，2表示电脑。

	late int receipt;
// 是否需要消息回执，0表示不需要，1表示需要。

	late int robot;
// 是否为机器人频道，0表示不是，1表示是。

	late String category;
// 频道分类，例如：客服类（service）。

	late String username;
// 频道用户名，通常是个人的用户名。

	late String avatarCacheKey;
// 头像缓存键，用于标识头像的唯一缓存版本。

	dynamic remoteExtraMap;
// 远程扩展字段，服务器返回的扩展信息（键值对格式）。

	late String parentChannelID;
// 父频道ID，如果有分级结构则指向上一级频道。

	late int parentChannelType;
// 父频道类型，例如：1表示个人频道，2表示群组频道等。


	GroupModelEntity();

	factory GroupModelEntity.fromJson(Map<String, dynamic> json) => $GroupModelEntityFromJson(json);

	Map<String, dynamic> toJson() => $GroupModelEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}