import 'package:im_chat_common_plugin/models/response/base_response_entity.dart';

class GlobalInfoEntity extends BaseData {
	/// 允许发送文件：1-默认 2-允许发文件
	int? allowFile;
	int? autoFriendNotice;
	int? blacklistLimit;
	int? canCall;
	int? canGroupCall;
	int? deviceLimit;
	int? groupChatDays;
	int? id;
	int? ipLimit;
	int? lookFriendPhone;
	int? noticeMerge;
	int? permanentGroupChat;
	int? permanentSoloChat;
	int? phoneSearch;
	int? readUnset;
	int? shortNoSearch;
	int? showGroupBg;
	int? showGroupNum;
	int? showGroupReceipt;
	int? soloChatDays;
	int? userOperation;
	int? userOperationOnce;

	GlobalInfoEntity(
			{this.allowFile,
				this.autoFriendNotice,
				this.blacklistLimit,
				this.canCall,
				this.canGroupCall,
				this.deviceLimit,
				this.groupChatDays,
				this.id,
				this.ipLimit,
				this.lookFriendPhone,
				this.noticeMerge,
				this.permanentGroupChat,
				this.permanentSoloChat,
				this.phoneSearch,
				this.readUnset,
				this.shortNoSearch,
				this.showGroupBg,
				this.showGroupNum,
				this.showGroupReceipt,
				this.soloChatDays,
				this.userOperation,
				this.userOperationOnce});

	GlobalInfoEntity.fromJson(dynamic json) {
		allowFile = json['allow_file'];
		autoFriendNotice = json['auto_friend_notice'];
		blacklistLimit = json['blacklist_limit'];
		canCall = json['can_call'];
		canGroupCall = json['can_group_call'];
		deviceLimit = json['device_limit'];
		groupChatDays = json['group_chat_days'];
		id = json['id'];
		ipLimit = json['ip_limit'];
		lookFriendPhone = json['look_friend_phone'];
		noticeMerge = json['notice_merge'];
		permanentGroupChat = json['permanent_group_chat'];
		permanentSoloChat = json['permanent_solo_chat'];
		phoneSearch = json['phone_search'];
		readUnset = json['read_unset'];
		shortNoSearch = json['short_no_search'];
		showGroupBg = json['show_group_bg'];
		showGroupNum = json['show_group_num'];
		showGroupReceipt = json['show_group_receipt'];
		soloChatDays = json['solo_chat_days'];
		userOperation = json['user_operation'];
		userOperationOnce = json['user_operation_once'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['allow_file'] = this.allowFile;
		data['auto_friend_notice'] = this.autoFriendNotice;
		data['blacklist_limit'] = this.blacklistLimit;
		data['can_call'] = this.canCall;
		data['can_group_call'] = this.canGroupCall;
		data['device_limit'] = this.deviceLimit;
		data['group_chat_days'] = this.groupChatDays;
		data['id'] = this.id;
		data['ip_limit'] = this.ipLimit;
		data['look_friend_phone'] = this.lookFriendPhone;
		data['notice_merge'] = this.noticeMerge;
		data['permanent_group_chat'] = this.permanentGroupChat;
		data['permanent_solo_chat'] = this.permanentSoloChat;
		data['phone_search'] = this.phoneSearch;
		data['read_unset'] = this.readUnset;
		data['short_no_search'] = this.shortNoSearch;
		data['show_group_bg'] = this.showGroupBg;
		data['show_group_num'] = this.showGroupNum;
		data['show_group_receipt'] = this.showGroupReceipt;
		data['solo_chat_days'] = this.soloChatDays;
		data['user_operation'] = this.userOperation;
		data['user_operation_once'] = this.userOperationOnce;
		return data;
	}
}