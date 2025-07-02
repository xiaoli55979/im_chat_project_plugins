class PersonInfoEntity {
	int? canAiReturn; // 是否允许AI返回消息(2-不允许,1-允许)
	int? canBatchMsg; // 是否允许批量发送消息(2-不允许,1-允许)
	int? canCreateGroup; // 是否允许创建群组(2-不允许,1-允许)
	int? canDelFriend; // 是否允许删除好友(2-不允许,1-允许)
	int? canDelMsg; // 是否允许删除消息(2-不允许,1-允许)
	int? canReadReceipt; // 是否允许已读回执(2-不允许,1-允许)
	int? canRevokeMsg; // 是否允许撤回消息(2-不允许,1-允许)
	int? canSendLimit; // 消息发送频率限制(2-无限制,1-有限制)
	int? canSendLine; // 是否允许发送行消息(2-不允许,1-允许)
	int? canSendSize; // 消息大小限制（单位：KB）
	int? canShareQrcode; // 是否允许分享二维码(2-不允许,1-允许)
	int? id; // 用户/群组唯一ID
	int? loginDeviceLimit; // 设备登录限制（如1=仅允许1个设备）
	String? loginTypeLimit; // 允许的登录方式（如"mobile,pc"）
	String? name; // 名称/昵称
	String? remark; // 备注信息

	PersonInfoEntity(
			{this.canAiReturn,
				this.canBatchMsg,
				this.canCreateGroup,
				this.canDelFriend,
				this.canDelMsg,
				this.canReadReceipt,
				this.canRevokeMsg,
				this.canSendLimit,
				this.canSendLine,
				this.canSendSize,
				this.canShareQrcode,
				this.id,
				this.loginDeviceLimit,
				this.loginTypeLimit,
				this.name,
				this.remark});

	PersonInfoEntity.fromJson(dynamic json) {
		canAiReturn = json['can_ai_return'];
		canBatchMsg = json['can_batch_msg'];
		canCreateGroup = json['can_create_group'];
		canDelFriend = json['can_del_friend'];
		canDelMsg = json['can_del_msg'];
		canReadReceipt = json['can_read_receipt'];
		canRevokeMsg = json['can_revoke_msg'];
		canSendLimit = json['can_send_limit'];
		canSendLine = json['can_send_line'];
		canSendSize = json['can_send_size'];
		canShareQrcode = json['can_share_qrcode'];
		id = json['id'];
		loginDeviceLimit = json['login_device_limit'];
		loginTypeLimit = json['login_type_limit'];
		name = json['name'];
		remark = json['remark'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['can_ai_return'] = this.canAiReturn;
		data['can_batch_msg'] = this.canBatchMsg;
		data['can_create_group'] = this.canCreateGroup;
		data['can_del_friend'] = this.canDelFriend;
		data['can_del_msg'] = this.canDelMsg;
		data['can_read_receipt'] = this.canReadReceipt;
		data['can_revoke_msg'] = this.canRevokeMsg;
		data['can_send_limit'] = this.canSendLimit;
		data['can_send_line'] = this.canSendLine;
		data['can_send_size'] = this.canSendSize;
		data['can_share_qrcode'] = this.canShareQrcode;
		data['id'] = this.id;
		data['login_device_limit'] = this.loginDeviceLimit;
		data['login_type_limit'] = this.loginTypeLimit;
		data['name'] = this.name;
		data['remark'] = this.remark;
		return data;
	}
}
