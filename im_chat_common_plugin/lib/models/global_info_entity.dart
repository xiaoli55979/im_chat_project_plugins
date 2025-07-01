import 'package:im_chat_common_plugin/generated/json/base/json_field.dart';
import 'package:im_chat_common_plugin/generated/json/global_info_entity.g.dart';
import 'dart:convert';
export 'package:im_chat_common_plugin/generated/json/global_info_entity.g.dart';

@JsonSerializable()
class GlobalInfoEntity {
	@JSONField(name: 'allow_file')
	/// 允许发送文件：1-默认 2-允许发文件
	int allowFile = 2;

	@JSONField(name: 'auto_friend_notice')
	/// 自动好友通知：1-默认 2-自动添加好友通知
	int autoFriendNotice = 2;

	@JSONField(name: 'blacklist_limit')
	/// 黑名单限制：1-默认 2-不允许黑名单注册登陆
	int blacklistLimit = 2;

	@JSONField(name: 'can_call')
	/// 允许语音通话：1-默认 2-允许语音通话
	int canCall = 2;

	@JSONField(name: 'can_group_call')
	/// 允许群语音通话：1-默认 2-允许群语音通话
	int canGroupCall = 2;

	@JSONField(name: 'device_limit')
	/// 设备限制：1-默认 2-不允许设备
	int deviceLimit = 2;

	@JSONField(name: 'group_chat_days')
	/// 群聊保存天数
	int groupChatDays = 2;

	/// 配置ID
	int id = 0;

	@JSONField(name: 'ip_limit')
	/// IP限制：1-默认 2-不允许IP
	int ipLimit = 2;

	@JSONField(name: 'look_friend_phone')
	/// 好友手机号可见：1-默认 2-用户手机号对好友可见
	int lookFriendPhone = 2;

	@JSONField(name: 'notice_merge')
	/// 通知合并：1-默认 2-通知合并
	int noticeMerge = 2;

	@JSONField(name: 'permanent_group_chat')
	/// 永久保存群聊：1-默认 2-永久保存群聊
	int permanentGroupChat = 2;

	@JSONField(name: 'permanent_solo_chat')
	/// 永久保存单聊：1-默认 2-永久保存单聊
	int permanentSoloChat = 2;

	@JSONField(name: 'phone_search')
	/// 手机号搜索：1-默认 2-可以手机号搜索
	int phoneSearch = 2;

	@JSONField(name: 'read_unset')
	/// 阅后即焚设置：1-默认 2-阅后即焚
	int readUnset = 2;

	@JSONField(name: 'short_no_search')
	/// 短号搜索：1-默认 2-用户账号可以搜索
	int shortNoSearch = 2;

	@JSONField(name: 'show_group_bg')
	/// 显示群聊水印：1-默认 2-允许显示群聊水印
	int showGroupBg = 2;

	@JSONField(name: 'show_group_num')
	/// 显示群人数：1-默认 2-允许显示群人数
	int showGroupNum = 2;

	@JSONField(name: 'show_group_receipt')
	/// 显示群回执：1-默认 2-允许显示群回执
	int showGroupReceipt = 2;

	@JSONField(name: 'solo_chat_days')
	/// 单聊保存天数
	int soloChatDays = 2;

	@JSONField(name: 'user_operation')
	/// 用户操作限制：1-默认 2-用户操作限制
	int userOperation = 2;

	@JSONField(name: 'user_operation_once')
	/// 每月操作次数
	int userOperationOnce = 2;

	GlobalInfoEntity();

	factory GlobalInfoEntity.fromJson(Map<String, dynamic> json) => $GlobalInfoEntityFromJson(json);

	Map<String, dynamic> toJson() => $GlobalInfoEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}