import 'package:im_chat_common_plugin/generated/json/base/json_convert_content.dart';
import 'package:im_chat_common_plugin/models/global_info_entity.dart';

GlobalInfoEntity $GlobalInfoEntityFromJson(Map<String, dynamic> json) {
  final GlobalInfoEntity globalInfoEntity = GlobalInfoEntity();
  final int? allowFile = jsonConvert.convert<int>(json['allow_file']);
  if (allowFile != null) {
    globalInfoEntity.allowFile = allowFile;
  }
  final int? autoFriendNotice = jsonConvert.convert<int>(
      json['auto_friend_notice']);
  if (autoFriendNotice != null) {
    globalInfoEntity.autoFriendNotice = autoFriendNotice;
  }
  final int? blacklistLimit = jsonConvert.convert<int>(json['blacklist_limit']);
  if (blacklistLimit != null) {
    globalInfoEntity.blacklistLimit = blacklistLimit;
  }
  final int? canCall = jsonConvert.convert<int>(json['can_call']);
  if (canCall != null) {
    globalInfoEntity.canCall = canCall;
  }
  final int? canGroupCall = jsonConvert.convert<int>(json['can_group_call']);
  if (canGroupCall != null) {
    globalInfoEntity.canGroupCall = canGroupCall;
  }
  final int? deviceLimit = jsonConvert.convert<int>(json['device_limit']);
  if (deviceLimit != null) {
    globalInfoEntity.deviceLimit = deviceLimit;
  }
  final int? groupChatDays = jsonConvert.convert<int>(json['group_chat_days']);
  if (groupChatDays != null) {
    globalInfoEntity.groupChatDays = groupChatDays;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    globalInfoEntity.id = id;
  }
  final int? ipLimit = jsonConvert.convert<int>(json['ip_limit']);
  if (ipLimit != null) {
    globalInfoEntity.ipLimit = ipLimit;
  }
  final int? lookFriendPhone = jsonConvert.convert<int>(
      json['look_friend_phone']);
  if (lookFriendPhone != null) {
    globalInfoEntity.lookFriendPhone = lookFriendPhone;
  }
  final int? noticeMerge = jsonConvert.convert<int>(json['notice_merge']);
  if (noticeMerge != null) {
    globalInfoEntity.noticeMerge = noticeMerge;
  }
  final int? permanentGroupChat = jsonConvert.convert<int>(
      json['permanent_group_chat']);
  if (permanentGroupChat != null) {
    globalInfoEntity.permanentGroupChat = permanentGroupChat;
  }
  final int? permanentSoloChat = jsonConvert.convert<int>(
      json['permanent_solo_chat']);
  if (permanentSoloChat != null) {
    globalInfoEntity.permanentSoloChat = permanentSoloChat;
  }
  final int? phoneSearch = jsonConvert.convert<int>(json['phone_search']);
  if (phoneSearch != null) {
    globalInfoEntity.phoneSearch = phoneSearch;
  }
  final int? readUnset = jsonConvert.convert<int>(json['read_unset']);
  if (readUnset != null) {
    globalInfoEntity.readUnset = readUnset;
  }
  final int? shortNoSearch = jsonConvert.convert<int>(json['short_no_search']);
  if (shortNoSearch != null) {
    globalInfoEntity.shortNoSearch = shortNoSearch;
  }
  final int? showGroupBg = jsonConvert.convert<int>(json['show_group_bg']);
  if (showGroupBg != null) {
    globalInfoEntity.showGroupBg = showGroupBg;
  }
  final int? showGroupNum = jsonConvert.convert<int>(json['show_group_num']);
  if (showGroupNum != null) {
    globalInfoEntity.showGroupNum = showGroupNum;
  }
  final int? showGroupReceipt = jsonConvert.convert<int>(
      json['show_group_receipt']);
  if (showGroupReceipt != null) {
    globalInfoEntity.showGroupReceipt = showGroupReceipt;
  }
  final int? soloChatDays = jsonConvert.convert<int>(json['solo_chat_days']);
  if (soloChatDays != null) {
    globalInfoEntity.soloChatDays = soloChatDays;
  }
  final int? userOperation = jsonConvert.convert<int>(json['user_operation']);
  if (userOperation != null) {
    globalInfoEntity.userOperation = userOperation;
  }
  final int? userOperationOnce = jsonConvert.convert<int>(
      json['user_operation_once']);
  if (userOperationOnce != null) {
    globalInfoEntity.userOperationOnce = userOperationOnce;
  }
  return globalInfoEntity;
}

Map<String, dynamic> $GlobalInfoEntityToJson(GlobalInfoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['allow_file'] = entity.allowFile;
  data['auto_friend_notice'] = entity.autoFriendNotice;
  data['blacklist_limit'] = entity.blacklistLimit;
  data['can_call'] = entity.canCall;
  data['can_group_call'] = entity.canGroupCall;
  data['device_limit'] = entity.deviceLimit;
  data['group_chat_days'] = entity.groupChatDays;
  data['id'] = entity.id;
  data['ip_limit'] = entity.ipLimit;
  data['look_friend_phone'] = entity.lookFriendPhone;
  data['notice_merge'] = entity.noticeMerge;
  data['permanent_group_chat'] = entity.permanentGroupChat;
  data['permanent_solo_chat'] = entity.permanentSoloChat;
  data['phone_search'] = entity.phoneSearch;
  data['read_unset'] = entity.readUnset;
  data['short_no_search'] = entity.shortNoSearch;
  data['show_group_bg'] = entity.showGroupBg;
  data['show_group_num'] = entity.showGroupNum;
  data['show_group_receipt'] = entity.showGroupReceipt;
  data['solo_chat_days'] = entity.soloChatDays;
  data['user_operation'] = entity.userOperation;
  data['user_operation_once'] = entity.userOperationOnce;
  return data;
}

extension GlobalInfoEntityExtension on GlobalInfoEntity {
  GlobalInfoEntity copyWith({
    int? allowFile,
    int? autoFriendNotice,
    int? blacklistLimit,
    int? canCall,
    int? canGroupCall,
    int? deviceLimit,
    int? groupChatDays,
    int? id,
    int? ipLimit,
    int? lookFriendPhone,
    int? noticeMerge,
    int? permanentGroupChat,
    int? permanentSoloChat,
    int? phoneSearch,
    int? readUnset,
    int? shortNoSearch,
    int? showGroupBg,
    int? showGroupNum,
    int? showGroupReceipt,
    int? soloChatDays,
    int? userOperation,
    int? userOperationOnce,
  }) {
    return GlobalInfoEntity()
      ..allowFile = allowFile ?? this.allowFile
      ..autoFriendNotice = autoFriendNotice ?? this.autoFriendNotice
      ..blacklistLimit = blacklistLimit ?? this.blacklistLimit
      ..canCall = canCall ?? this.canCall
      ..canGroupCall = canGroupCall ?? this.canGroupCall
      ..deviceLimit = deviceLimit ?? this.deviceLimit
      ..groupChatDays = groupChatDays ?? this.groupChatDays
      ..id = id ?? this.id
      ..ipLimit = ipLimit ?? this.ipLimit
      ..lookFriendPhone = lookFriendPhone ?? this.lookFriendPhone
      ..noticeMerge = noticeMerge ?? this.noticeMerge
      ..permanentGroupChat = permanentGroupChat ?? this.permanentGroupChat
      ..permanentSoloChat = permanentSoloChat ?? this.permanentSoloChat
      ..phoneSearch = phoneSearch ?? this.phoneSearch
      ..readUnset = readUnset ?? this.readUnset
      ..shortNoSearch = shortNoSearch ?? this.shortNoSearch
      ..showGroupBg = showGroupBg ?? this.showGroupBg
      ..showGroupNum = showGroupNum ?? this.showGroupNum
      ..showGroupReceipt = showGroupReceipt ?? this.showGroupReceipt
      ..soloChatDays = soloChatDays ?? this.soloChatDays
      ..userOperation = userOperation ?? this.userOperation
      ..userOperationOnce = userOperationOnce ?? this.userOperationOnce;
  }
}