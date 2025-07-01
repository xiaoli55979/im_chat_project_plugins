import 'package:im_chat_common_plugin/generated/json/base/json_field.dart';
import 'package:im_chat_common_plugin/generated/json/person_info_entity.g.dart';
import 'dart:convert';
export 'package:im_chat_common_plugin/generated/json/person_info_entity.g.dart';

@JsonSerializable()
class PersonInfoEntity {
	@JSONField(name: 'can_ai_return')
	int canAiReturn = 2;  // 默认不允许AI返回

	@JSONField(name: 'can_batch_msg')
	int canBatchMsg = 2;  // 默认不允许批量消息

	@JSONField(name: 'can_create_group')
	int canCreateGroup = 2;  // 默认不允许创建群组

	@JSONField(name: 'can_del_friend')
	int canDelFriend = 2;  // 默认不允许删除好友

	@JSONField(name: 'can_del_msg')
	int canDelMsg = 2;  // 默认不允许删除消息

	@JSONField(name: 'can_read_receipt')
	int canReadReceipt = 2;  // 默认不允许已读回执

	@JSONField(name: 'can_revoke_msg')
	int canRevokeMsg = 2;  // 默认不允许撤回消息

	@JSONField(name: 'can_send_limit')
	int canSendLimit = 2;  // 默认无发送限制

	@JSONField(name: 'can_send_line')
	int canSendLine = 2;  // 默认不允许发送行消息

	@JSONField(name: 'can_send_size')
	int canSendSize = 2;  // 默认发送大小限制为0

	@JSONField(name: 'can_share_qrcode')
	int canShareQrcode = 2;  // 默认不允许分享二维码

	int id = 0;  // 默认ID为0

	@JSONField(name: 'login_device_limit')
	int loginDeviceLimit = 2;  // 默认设备登录限制为1（通常允许1个设备）

	@JSONField(name: 'login_type_limit')
	String loginTypeLimit = '';  // 默认登录类型限制为空

	String name = '';  // 默认名称为空字符串

	String remark = '';  // 默认备注为空字符串

	PersonInfoEntity();

	factory PersonInfoEntity.fromJson(Map<String, dynamic> json) => $PersonInfoEntityFromJson(json);

	Map<String, dynamic> toJson() => $PersonInfoEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}