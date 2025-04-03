import 'dart:convert';

import 'package:im_chat_common_plugin/generated/json/base/json_field.dart';
import 'package:im_chat_common_plugin/generated/json/conversatin_sync_model_entity.g.dart';

export 'package:im_chat_common_plugin/generated/json/conversatin_sync_model_entity.g.dart';

@JsonSerializable()
class ConversatinSyncModelEntity {
  late String uid = '';
  late List<ConversatinSyncModelConversations> conversations = [];

  ConversatinSyncModelEntity();

  factory ConversatinSyncModelEntity.fromJson(Map<String, dynamic> json) => $ConversatinSyncModelEntityFromJson(json);

  Map<String, dynamic> toJson() => $ConversatinSyncModelEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ConversatinSyncModelConversations {
  @JSONField(name: 'channel_id')
  late String channelId = '';
  @JSONField(name: 'channel_type')
  late String channelType = '';
  late int unread = 0;
  late int stick = 0;
  late int mute = 0;
  late int timestamp = 0;
  @JSONField(name: 'last_client_msg_no')
  late String lastClientMsgNo = '';
  @JSONField(name: 'offset_msg_seq')
  late int offsetMsgSeq = 0;
  late int version = 0;
  late List<ConversatinSyncModelConversationsRecents> recents = [];
  late List<ConversatinSyncModelConversationsUsers> users = [];
  late List<ConversatinSyncModelConversationsGroups> groups = [];

  ConversatinSyncModelConversations();

  factory ConversatinSyncModelConversations.fromJson(Map<String, dynamic> json) => $ConversatinSyncModelConversationsFromJson(json);

  Map<String, dynamic> toJson() => $ConversatinSyncModelConversationsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ConversatinSyncModelConversationsRecents {
  @JSONField(name: 'message_id')
  late String messageId = '';
  @JSONField(name: 'message_seq')
  late int messageSeq = 0;
  @JSONField(name: 'channel_id')
  late String channelId = '';
  @JSONField(name: 'channel_type')
  late int channelType = 0;
  @JSONField(name: 'client_msg_no')
  late String clientMsgNo = '';
  @JSONField(name: 'from_uid')
  late String fromUid = '';
  late int timestamp = 0;
  @JSONField(name: 'voice_status')
  late int voiceStatus = 0;
  @JSONField(name: 'is_deleted')
  late int isDeleted = 0;
  late int revoke = 0;
  late String revoker = '';
  @JSONField(name: 'extra_version')
  late int extraVersion = 0;
  @JSONField(name: 'unread_count')
  late int unreadCount = 0;
  @JSONField(name: 'readed_count')
  late int readedCount = 0;
  late int readed = 0;
  late int receipt = 0;
  late int setting = 0;
  late ConversatinSyncModelConversationsRecentsPayload payload;
  @JSONField(name: 'signal_payload')
  late String signalPayload = '';
  @JSONField(name: 'message_extra')
  late ConversatinSyncModelConversationsRecentsMessageExtra messageExtra;
  late List<ConversatinSyncModelConversationsRecentsReactions> reactions = [];

  ConversatinSyncModelConversationsRecents();

  factory ConversatinSyncModelConversationsRecents.fromJson(Map<String, dynamic> json) =>
      $ConversatinSyncModelConversationsRecentsFromJson(json);

  Map<String, dynamic> toJson() => $ConversatinSyncModelConversationsRecentsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ConversatinSyncModelConversationsRecentsPayload {
  ConversatinSyncModelConversationsRecentsPayload();

  factory ConversatinSyncModelConversationsRecentsPayload.fromJson(Map<String, dynamic> json) =>
      $ConversatinSyncModelConversationsRecentsPayloadFromJson(json);

  Map<String, dynamic> toJson() => $ConversatinSyncModelConversationsRecentsPayloadToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ConversatinSyncModelConversationsRecentsMessageExtra {
  @JSONField(name: 'message_id')
  late int messageId = 0;
  @JSONField(name: 'message_id_str')
  late String messageIdStr = '';
  late int revoke = 0;
  late String revoker = '';
  @JSONField(name: 'voice_status')
  late int voiceStatus = 0;
  late int readed = 0;
  @JSONField(name: 'readed_count')
  late int readedCount = 0;
  @JSONField(name: 'readed_at')
  late int readedAt = 0;
  @JSONField(name: 'is_mutual_deleted')
  late int isMutualDeleted = 0;
  @JSONField(name: 'content_edit')
  late ConversatinSyncModelConversationsRecentsMessageExtraContentEdit contentEdit;
  @JSONField(name: 'edited_at')
  late int editedAt = 0;
  @JSONField(name: 'extra_version')
  late int extraVersion = 0;

  ConversatinSyncModelConversationsRecentsMessageExtra();

  factory ConversatinSyncModelConversationsRecentsMessageExtra.fromJson(Map<String, dynamic> json) =>
      $ConversatinSyncModelConversationsRecentsMessageExtraFromJson(json);

  Map<String, dynamic> toJson() => $ConversatinSyncModelConversationsRecentsMessageExtraToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ConversatinSyncModelConversationsRecentsMessageExtraContentEdit {
  ConversatinSyncModelConversationsRecentsMessageExtraContentEdit();

  factory ConversatinSyncModelConversationsRecentsMessageExtraContentEdit.fromJson(Map<String, dynamic> json) =>
      $ConversatinSyncModelConversationsRecentsMessageExtraContentEditFromJson(json);

  Map<String, dynamic> toJson() => $ConversatinSyncModelConversationsRecentsMessageExtraContentEditToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ConversatinSyncModelConversationsRecentsReactions {
  @JSONField(name: 'message_id')
  late String messageId = '';
  late String uid = '';
  late String name = '';
  @JSONField(name: 'channel_id')
  late String channelId = '';
  @JSONField(name: 'channel_type')
  late int channelType = 0;
  late int seq = 0;
  late String emoji = '';
  @JSONField(name: 'is_deleted')
  late int isDeleted = 0;
  @JSONField(name: 'created_at')
  late String createdAt = '';

  ConversatinSyncModelConversationsRecentsReactions();

  factory ConversatinSyncModelConversationsRecentsReactions.fromJson(Map<String, dynamic> json) =>
      $ConversatinSyncModelConversationsRecentsReactionsFromJson(json);

  Map<String, dynamic> toJson() => $ConversatinSyncModelConversationsRecentsReactionsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ConversatinSyncModelConversationsUsers {
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

  ConversatinSyncModelConversationsUsers();

  factory ConversatinSyncModelConversationsUsers.fromJson(Map<String, dynamic> json) =>
      $ConversatinSyncModelConversationsUsersFromJson(json);

  Map<String, dynamic> toJson() => $ConversatinSyncModelConversationsUsersToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ConversatinSyncModelConversationsGroups {
  @JSONField(name: 'group_no')
  late String groupNo = '';
  @JSONField(name: 'group_type')
  late int groupType = 0;
  late String name = '';
  late String remark = '';
  late String notice = '';
  late int mute = 0;
  late int top = 0;
  @JSONField(name: 'show_nick')
  late int showNick = 0;
  late int save = 0;
  late int forbidden = 0;
  late int invite = 0;
  @JSONField(name: 'chat_pwd_on')
  late int chatPwdOn = 0;
  late int screenshot = 0;
  @JSONField(name: 'revoke_remind')
  late int revokeRemind = 0;
  @JSONField(name: 'join_group_remind')
  late int joinGroupRemind = 0;
  @JSONField(name: 'forbidden_add_friend')
  late int forbiddenAddFriend = 0;
  late int status = 0;
  late int receipt = 0;
  late int flame = 0;
  @JSONField(name: 'flame_second')
  late int flameSecond = 0;
  @JSONField(name: 'allow_view_history_msg')
  late int allowViewHistoryMsg = 0;
  @JSONField(name: 'member_count')
  late int memberCount = 0;
  @JSONField(name: 'online_count')
  late int onlineCount = 0;
  late int quit = 0;
  late int role = 0;
  @JSONField(name: 'forbidden_expir_time')
  late int forbiddenExpirTime = 0;
  late int version = 0;

  ConversatinSyncModelConversationsGroups();

  factory ConversatinSyncModelConversationsGroups.fromJson(Map<String, dynamic> json) =>
      $ConversatinSyncModelConversationsGroupsFromJson(json);

  Map<String, dynamic> toJson() => $ConversatinSyncModelConversationsGroupsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
