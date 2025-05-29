import 'package:im_chat_common_plugin/generated/json/base/json_convert_content.dart';
import 'package:im_chat_common_plugin/models/conversatin_sync_model_entity.dart';

ConversatinSyncModelEntity $ConversatinSyncModelEntityFromJson(
    Map<String, dynamic> json) {
  final ConversatinSyncModelEntity conversatinSyncModelEntity = ConversatinSyncModelEntity();
  final String? uid = jsonConvert.convert<String>(json['uid']);
  if (uid != null) {
    conversatinSyncModelEntity.uid = uid;
  }
  final List<
      ConversatinSyncModelConversations>? conversations = (json['conversations'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<ConversatinSyncModelConversations>(
          e) as ConversatinSyncModelConversations).toList();
  if (conversations != null) {
    conversatinSyncModelEntity.conversations = conversations;
  }
  return conversatinSyncModelEntity;
}

Map<String, dynamic> $ConversatinSyncModelEntityToJson(
    ConversatinSyncModelEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['uid'] = entity.uid;
  data['conversations'] = entity.conversations.map((v) => v.toJson()).toList();
  return data;
}

extension ConversatinSyncModelEntityExtension on ConversatinSyncModelEntity {
  ConversatinSyncModelEntity copyWith({
    String? uid,
    List<ConversatinSyncModelConversations>? conversations,
  }) {
    return ConversatinSyncModelEntity()
      ..uid = uid ?? this.uid
      ..conversations = conversations ?? this.conversations;
  }
}

ConversatinSyncModelConversations $ConversatinSyncModelConversationsFromJson(
    Map<String, dynamic> json) {
  final ConversatinSyncModelConversations conversatinSyncModelConversations = ConversatinSyncModelConversations();
  final String? channelId = jsonConvert.convert<String>(json['channel_id']);
  if (channelId != null) {
    conversatinSyncModelConversations.channelId = channelId;
  }
  final String? channelType = jsonConvert.convert<String>(json['channel_type']);
  if (channelType != null) {
    conversatinSyncModelConversations.channelType = channelType;
  }
  final int? unread = jsonConvert.convert<int>(json['unread']);
  if (unread != null) {
    conversatinSyncModelConversations.unread = unread;
  }
  final int? stick = jsonConvert.convert<int>(json['stick']);
  if (stick != null) {
    conversatinSyncModelConversations.stick = stick;
  }
  final int? mute = jsonConvert.convert<int>(json['mute']);
  if (mute != null) {
    conversatinSyncModelConversations.mute = mute;
  }
  final int? timestamp = jsonConvert.convert<int>(json['timestamp']);
  if (timestamp != null) {
    conversatinSyncModelConversations.timestamp = timestamp;
  }
  final String? lastClientMsgNo = jsonConvert.convert<String>(
      json['last_client_msg_no']);
  if (lastClientMsgNo != null) {
    conversatinSyncModelConversations.lastClientMsgNo = lastClientMsgNo;
  }
  final int? offsetMsgSeq = jsonConvert.convert<int>(json['offset_msg_seq']);
  if (offsetMsgSeq != null) {
    conversatinSyncModelConversations.offsetMsgSeq = offsetMsgSeq;
  }
  final int? version = jsonConvert.convert<int>(json['version']);
  if (version != null) {
    conversatinSyncModelConversations.version = version;
  }
  final List<
      ConversatinSyncModelConversationsRecents>? recents = (json['recents'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<ConversatinSyncModelConversationsRecents>(
          e) as ConversatinSyncModelConversationsRecents).toList();
  if (recents != null) {
    conversatinSyncModelConversations.recents = recents;
  }
  final List<
      ConversatinSyncModelConversationsUsers>? users = (json['users'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<ConversatinSyncModelConversationsUsers>(
          e) as ConversatinSyncModelConversationsUsers).toList();
  if (users != null) {
    conversatinSyncModelConversations.users = users;
  }
  final List<
      ConversatinSyncModelConversationsGroups>? groups = (json['groups'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<ConversatinSyncModelConversationsGroups>(
          e) as ConversatinSyncModelConversationsGroups).toList();
  if (groups != null) {
    conversatinSyncModelConversations.groups = groups;
  }
  return conversatinSyncModelConversations;
}

Map<String, dynamic> $ConversatinSyncModelConversationsToJson(
    ConversatinSyncModelConversations entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['channel_id'] = entity.channelId;
  data['channel_type'] = entity.channelType;
  data['unread'] = entity.unread;
  data['stick'] = entity.stick;
  data['mute'] = entity.mute;
  data['timestamp'] = entity.timestamp;
  data['last_client_msg_no'] = entity.lastClientMsgNo;
  data['offset_msg_seq'] = entity.offsetMsgSeq;
  data['version'] = entity.version;
  data['recents'] = entity.recents.map((v) => v.toJson()).toList();
  data['users'] = entity.users.map((v) => v.toJson()).toList();
  data['groups'] = entity.groups.map((v) => v.toJson()).toList();
  return data;
}

extension ConversatinSyncModelConversationsExtension on ConversatinSyncModelConversations {
  ConversatinSyncModelConversations copyWith({
    String? channelId,
    String? channelType,
    int? unread,
    int? stick,
    int? mute,
    int? timestamp,
    String? lastClientMsgNo,
    int? offsetMsgSeq,
    int? version,
    List<ConversatinSyncModelConversationsRecents>? recents,
    List<ConversatinSyncModelConversationsUsers>? users,
    List<ConversatinSyncModelConversationsGroups>? groups,
  }) {
    return ConversatinSyncModelConversations()
      ..channelId = channelId ?? this.channelId
      ..channelType = channelType ?? this.channelType
      ..unread = unread ?? this.unread
      ..stick = stick ?? this.stick
      ..mute = mute ?? this.mute
      ..timestamp = timestamp ?? this.timestamp
      ..lastClientMsgNo = lastClientMsgNo ?? this.lastClientMsgNo
      ..offsetMsgSeq = offsetMsgSeq ?? this.offsetMsgSeq
      ..version = version ?? this.version
      ..recents = recents ?? this.recents
      ..users = users ?? this.users
      ..groups = groups ?? this.groups;
  }
}

ConversatinSyncModelConversationsRecents $ConversatinSyncModelConversationsRecentsFromJson(
    Map<String, dynamic> json) {
  final ConversatinSyncModelConversationsRecents conversatinSyncModelConversationsRecents = ConversatinSyncModelConversationsRecents();
  final String? messageId = jsonConvert.convert<String>(json['message_id']);
  if (messageId != null) {
    conversatinSyncModelConversationsRecents.messageId = messageId;
  }
  final int? messageSeq = jsonConvert.convert<int>(json['message_seq']);
  if (messageSeq != null) {
    conversatinSyncModelConversationsRecents.messageSeq = messageSeq;
  }
  final String? channelId = jsonConvert.convert<String>(json['channel_id']);
  if (channelId != null) {
    conversatinSyncModelConversationsRecents.channelId = channelId;
  }
  final int? channelType = jsonConvert.convert<int>(json['channel_type']);
  if (channelType != null) {
    conversatinSyncModelConversationsRecents.channelType = channelType;
  }
  final String? clientMsgNo = jsonConvert.convert<String>(
      json['client_msg_no']);
  if (clientMsgNo != null) {
    conversatinSyncModelConversationsRecents.clientMsgNo = clientMsgNo;
  }
  final String? fromUid = jsonConvert.convert<String>(json['from_uid']);
  if (fromUid != null) {
    conversatinSyncModelConversationsRecents.fromUid = fromUid;
  }
  final int? timestamp = jsonConvert.convert<int>(json['timestamp']);
  if (timestamp != null) {
    conversatinSyncModelConversationsRecents.timestamp = timestamp;
  }
  final int? voiceStatus = jsonConvert.convert<int>(json['voice_status']);
  if (voiceStatus != null) {
    conversatinSyncModelConversationsRecents.voiceStatus = voiceStatus;
  }
  final int? isDeleted = jsonConvert.convert<int>(json['is_deleted']);
  if (isDeleted != null) {
    conversatinSyncModelConversationsRecents.isDeleted = isDeleted;
  }
  final int? revoke = jsonConvert.convert<int>(json['revoke']);
  if (revoke != null) {
    conversatinSyncModelConversationsRecents.revoke = revoke;
  }
  final String? revoker = jsonConvert.convert<String>(json['revoker']);
  if (revoker != null) {
    conversatinSyncModelConversationsRecents.revoker = revoker;
  }
  final int? extraVersion = jsonConvert.convert<int>(json['extra_version']);
  if (extraVersion != null) {
    conversatinSyncModelConversationsRecents.extraVersion = extraVersion;
  }
  final int? unreadCount = jsonConvert.convert<int>(json['unread_count']);
  if (unreadCount != null) {
    conversatinSyncModelConversationsRecents.unreadCount = unreadCount;
  }
  final int? readedCount = jsonConvert.convert<int>(json['readed_count']);
  if (readedCount != null) {
    conversatinSyncModelConversationsRecents.readedCount = readedCount;
  }
  final int? readed = jsonConvert.convert<int>(json['readed']);
  if (readed != null) {
    conversatinSyncModelConversationsRecents.readed = readed;
  }
  final int? receipt = jsonConvert.convert<int>(json['receipt']);
  if (receipt != null) {
    conversatinSyncModelConversationsRecents.receipt = receipt;
  }
  final int? setting = jsonConvert.convert<int>(json['setting']);
  if (setting != null) {
    conversatinSyncModelConversationsRecents.setting = setting;
  }
  final ConversatinSyncModelConversationsRecentsPayload? payload = jsonConvert
      .convert<ConversatinSyncModelConversationsRecentsPayload>(
      json['payload']);
  if (payload != null) {
    conversatinSyncModelConversationsRecents.payload = payload;
  }
  final String? signalPayload = jsonConvert.convert<String>(
      json['signal_payload']);
  if (signalPayload != null) {
    conversatinSyncModelConversationsRecents.signalPayload = signalPayload;
  }
  final ConversatinSyncModelConversationsRecentsMessageExtra? messageExtra = jsonConvert
      .convert<ConversatinSyncModelConversationsRecentsMessageExtra>(
      json['message_extra']);
  if (messageExtra != null) {
    conversatinSyncModelConversationsRecents.messageExtra = messageExtra;
  }
  final List<
      ConversatinSyncModelConversationsRecentsReactions>? reactions = (json['reactions'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<
          ConversatinSyncModelConversationsRecentsReactions>(
          e) as ConversatinSyncModelConversationsRecentsReactions).toList();
  if (reactions != null) {
    conversatinSyncModelConversationsRecents.reactions = reactions;
  }
  return conversatinSyncModelConversationsRecents;
}

Map<String, dynamic> $ConversatinSyncModelConversationsRecentsToJson(
    ConversatinSyncModelConversationsRecents entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['message_id'] = entity.messageId;
  data['message_seq'] = entity.messageSeq;
  data['channel_id'] = entity.channelId;
  data['channel_type'] = entity.channelType;
  data['client_msg_no'] = entity.clientMsgNo;
  data['from_uid'] = entity.fromUid;
  data['timestamp'] = entity.timestamp;
  data['voice_status'] = entity.voiceStatus;
  data['is_deleted'] = entity.isDeleted;
  data['revoke'] = entity.revoke;
  data['revoker'] = entity.revoker;
  data['extra_version'] = entity.extraVersion;
  data['unread_count'] = entity.unreadCount;
  data['readed_count'] = entity.readedCount;
  data['readed'] = entity.readed;
  data['receipt'] = entity.receipt;
  data['setting'] = entity.setting;
  data['payload'] = entity.payload.toJson();
  data['signal_payload'] = entity.signalPayload;
  data['message_extra'] = entity.messageExtra.toJson();
  data['reactions'] = entity.reactions.map((v) => v.toJson()).toList();
  return data;
}

extension ConversatinSyncModelConversationsRecentsExtension on ConversatinSyncModelConversationsRecents {
  ConversatinSyncModelConversationsRecents copyWith({
    String? messageId,
    int? messageSeq,
    String? channelId,
    int? channelType,
    String? clientMsgNo,
    String? fromUid,
    int? timestamp,
    int? voiceStatus,
    int? isDeleted,
    int? revoke,
    String? revoker,
    int? extraVersion,
    int? unreadCount,
    int? readedCount,
    int? readed,
    int? receipt,
    int? setting,
    ConversatinSyncModelConversationsRecentsPayload? payload,
    String? signalPayload,
    ConversatinSyncModelConversationsRecentsMessageExtra? messageExtra,
    List<ConversatinSyncModelConversationsRecentsReactions>? reactions,
  }) {
    return ConversatinSyncModelConversationsRecents()
      ..messageId = messageId ?? this.messageId
      ..messageSeq = messageSeq ?? this.messageSeq
      ..channelId = channelId ?? this.channelId
      ..channelType = channelType ?? this.channelType
      ..clientMsgNo = clientMsgNo ?? this.clientMsgNo
      ..fromUid = fromUid ?? this.fromUid
      ..timestamp = timestamp ?? this.timestamp
      ..voiceStatus = voiceStatus ?? this.voiceStatus
      ..isDeleted = isDeleted ?? this.isDeleted
      ..revoke = revoke ?? this.revoke
      ..revoker = revoker ?? this.revoker
      ..extraVersion = extraVersion ?? this.extraVersion
      ..unreadCount = unreadCount ?? this.unreadCount
      ..readedCount = readedCount ?? this.readedCount
      ..readed = readed ?? this.readed
      ..receipt = receipt ?? this.receipt
      ..setting = setting ?? this.setting
      ..payload = payload ?? this.payload
      ..signalPayload = signalPayload ?? this.signalPayload
      ..messageExtra = messageExtra ?? this.messageExtra
      ..reactions = reactions ?? this.reactions;
  }
}

ConversatinSyncModelConversationsRecentsPayload $ConversatinSyncModelConversationsRecentsPayloadFromJson(
    Map<String, dynamic> json) {
  final ConversatinSyncModelConversationsRecentsPayload conversatinSyncModelConversationsRecentsPayload = ConversatinSyncModelConversationsRecentsPayload();
  return conversatinSyncModelConversationsRecentsPayload;
}

Map<String, dynamic> $ConversatinSyncModelConversationsRecentsPayloadToJson(
    ConversatinSyncModelConversationsRecentsPayload entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  return data;
}

extension ConversatinSyncModelConversationsRecentsPayloadExtension on ConversatinSyncModelConversationsRecentsPayload {
}

ConversatinSyncModelConversationsRecentsMessageExtra $ConversatinSyncModelConversationsRecentsMessageExtraFromJson(
    Map<String, dynamic> json) {
  final ConversatinSyncModelConversationsRecentsMessageExtra conversatinSyncModelConversationsRecentsMessageExtra = ConversatinSyncModelConversationsRecentsMessageExtra();
  final int? messageId = jsonConvert.convert<int>(json['message_id']);
  if (messageId != null) {
    conversatinSyncModelConversationsRecentsMessageExtra.messageId = messageId;
  }
  final String? messageIdStr = jsonConvert.convert<String>(
      json['message_id_str']);
  if (messageIdStr != null) {
    conversatinSyncModelConversationsRecentsMessageExtra.messageIdStr =
        messageIdStr;
  }
  final int? revoke = jsonConvert.convert<int>(json['revoke']);
  if (revoke != null) {
    conversatinSyncModelConversationsRecentsMessageExtra.revoke = revoke;
  }
  final String? revoker = jsonConvert.convert<String>(json['revoker']);
  if (revoker != null) {
    conversatinSyncModelConversationsRecentsMessageExtra.revoker = revoker;
  }
  final int? voiceStatus = jsonConvert.convert<int>(json['voice_status']);
  if (voiceStatus != null) {
    conversatinSyncModelConversationsRecentsMessageExtra.voiceStatus =
        voiceStatus;
  }
  final int? readed = jsonConvert.convert<int>(json['readed']);
  if (readed != null) {
    conversatinSyncModelConversationsRecentsMessageExtra.readed = readed;
  }
  final int? readedCount = jsonConvert.convert<int>(json['readed_count']);
  if (readedCount != null) {
    conversatinSyncModelConversationsRecentsMessageExtra.readedCount =
        readedCount;
  }
  final int? readedAt = jsonConvert.convert<int>(json['readed_at']);
  if (readedAt != null) {
    conversatinSyncModelConversationsRecentsMessageExtra.readedAt = readedAt;
  }
  final int? isMutualDeleted = jsonConvert.convert<int>(
      json['is_mutual_deleted']);
  if (isMutualDeleted != null) {
    conversatinSyncModelConversationsRecentsMessageExtra.isMutualDeleted =
        isMutualDeleted;
  }
  final ConversatinSyncModelConversationsRecentsMessageExtraContentEdit? contentEdit = jsonConvert
      .convert<ConversatinSyncModelConversationsRecentsMessageExtraContentEdit>(
      json['content_edit']);
  if (contentEdit != null) {
    conversatinSyncModelConversationsRecentsMessageExtra.contentEdit =
        contentEdit;
  }
  final int? editedAt = jsonConvert.convert<int>(json['edited_at']);
  if (editedAt != null) {
    conversatinSyncModelConversationsRecentsMessageExtra.editedAt = editedAt;
  }
  final int? extraVersion = jsonConvert.convert<int>(json['extra_version']);
  if (extraVersion != null) {
    conversatinSyncModelConversationsRecentsMessageExtra.extraVersion =
        extraVersion;
  }
  return conversatinSyncModelConversationsRecentsMessageExtra;
}

Map<String,
    dynamic> $ConversatinSyncModelConversationsRecentsMessageExtraToJson(
    ConversatinSyncModelConversationsRecentsMessageExtra entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['message_id'] = entity.messageId;
  data['message_id_str'] = entity.messageIdStr;
  data['revoke'] = entity.revoke;
  data['revoker'] = entity.revoker;
  data['voice_status'] = entity.voiceStatus;
  data['readed'] = entity.readed;
  data['readed_count'] = entity.readedCount;
  data['readed_at'] = entity.readedAt;
  data['is_mutual_deleted'] = entity.isMutualDeleted;
  data['content_edit'] = entity.contentEdit.toJson();
  data['edited_at'] = entity.editedAt;
  data['extra_version'] = entity.extraVersion;
  return data;
}

extension ConversatinSyncModelConversationsRecentsMessageExtraExtension on ConversatinSyncModelConversationsRecentsMessageExtra {
  ConversatinSyncModelConversationsRecentsMessageExtra copyWith({
    int? messageId,
    String? messageIdStr,
    int? revoke,
    String? revoker,
    int? voiceStatus,
    int? readed,
    int? readedCount,
    int? readedAt,
    int? isMutualDeleted,
    ConversatinSyncModelConversationsRecentsMessageExtraContentEdit? contentEdit,
    int? editedAt,
    int? extraVersion,
  }) {
    return ConversatinSyncModelConversationsRecentsMessageExtra()
      ..messageId = messageId ?? this.messageId
      ..messageIdStr = messageIdStr ?? this.messageIdStr
      ..revoke = revoke ?? this.revoke
      ..revoker = revoker ?? this.revoker
      ..voiceStatus = voiceStatus ?? this.voiceStatus
      ..readed = readed ?? this.readed
      ..readedCount = readedCount ?? this.readedCount
      ..readedAt = readedAt ?? this.readedAt
      ..isMutualDeleted = isMutualDeleted ?? this.isMutualDeleted
      ..contentEdit = contentEdit ?? this.contentEdit
      ..editedAt = editedAt ?? this.editedAt
      ..extraVersion = extraVersion ?? this.extraVersion;
  }
}

ConversatinSyncModelConversationsRecentsMessageExtraContentEdit $ConversatinSyncModelConversationsRecentsMessageExtraContentEditFromJson(
    Map<String, dynamic> json) {
  final ConversatinSyncModelConversationsRecentsMessageExtraContentEdit conversatinSyncModelConversationsRecentsMessageExtraContentEdit = ConversatinSyncModelConversationsRecentsMessageExtraContentEdit();
  return conversatinSyncModelConversationsRecentsMessageExtraContentEdit;
}

Map<String,
    dynamic> $ConversatinSyncModelConversationsRecentsMessageExtraContentEditToJson(
    ConversatinSyncModelConversationsRecentsMessageExtraContentEdit entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  return data;
}

extension ConversatinSyncModelConversationsRecentsMessageExtraContentEditExtension on ConversatinSyncModelConversationsRecentsMessageExtraContentEdit {
}

ConversatinSyncModelConversationsRecentsReactions $ConversatinSyncModelConversationsRecentsReactionsFromJson(
    Map<String, dynamic> json) {
  final ConversatinSyncModelConversationsRecentsReactions conversatinSyncModelConversationsRecentsReactions = ConversatinSyncModelConversationsRecentsReactions();
  final String? messageId = jsonConvert.convert<String>(json['message_id']);
  if (messageId != null) {
    conversatinSyncModelConversationsRecentsReactions.messageId = messageId;
  }
  final String? uid = jsonConvert.convert<String>(json['uid']);
  if (uid != null) {
    conversatinSyncModelConversationsRecentsReactions.uid = uid;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    conversatinSyncModelConversationsRecentsReactions.name = name;
  }
  final String? channelId = jsonConvert.convert<String>(json['channel_id']);
  if (channelId != null) {
    conversatinSyncModelConversationsRecentsReactions.channelId = channelId;
  }
  final int? channelType = jsonConvert.convert<int>(json['channel_type']);
  if (channelType != null) {
    conversatinSyncModelConversationsRecentsReactions.channelType = channelType;
  }
  final int? seq = jsonConvert.convert<int>(json['seq']);
  if (seq != null) {
    conversatinSyncModelConversationsRecentsReactions.seq = seq;
  }
  final String? emoji = jsonConvert.convert<String>(json['emoji']);
  if (emoji != null) {
    conversatinSyncModelConversationsRecentsReactions.emoji = emoji;
  }
  final int? isDeleted = jsonConvert.convert<int>(json['is_deleted']);
  if (isDeleted != null) {
    conversatinSyncModelConversationsRecentsReactions.isDeleted = isDeleted;
  }
  final String? createdAt = jsonConvert.convert<String>(json['created_at']);
  if (createdAt != null) {
    conversatinSyncModelConversationsRecentsReactions.createdAt = createdAt;
  }
  return conversatinSyncModelConversationsRecentsReactions;
}

Map<String, dynamic> $ConversatinSyncModelConversationsRecentsReactionsToJson(
    ConversatinSyncModelConversationsRecentsReactions entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['message_id'] = entity.messageId;
  data['uid'] = entity.uid;
  data['name'] = entity.name;
  data['channel_id'] = entity.channelId;
  data['channel_type'] = entity.channelType;
  data['seq'] = entity.seq;
  data['emoji'] = entity.emoji;
  data['is_deleted'] = entity.isDeleted;
  data['created_at'] = entity.createdAt;
  return data;
}

extension ConversatinSyncModelConversationsRecentsReactionsExtension on ConversatinSyncModelConversationsRecentsReactions {
  ConversatinSyncModelConversationsRecentsReactions copyWith({
    String? messageId,
    String? uid,
    String? name,
    String? channelId,
    int? channelType,
    int? seq,
    String? emoji,
    int? isDeleted,
    String? createdAt,
  }) {
    return ConversatinSyncModelConversationsRecentsReactions()
      ..messageId = messageId ?? this.messageId
      ..uid = uid ?? this.uid
      ..name = name ?? this.name
      ..channelId = channelId ?? this.channelId
      ..channelType = channelType ?? this.channelType
      ..seq = seq ?? this.seq
      ..emoji = emoji ?? this.emoji
      ..isDeleted = isDeleted ?? this.isDeleted
      ..createdAt = createdAt ?? this.createdAt;
  }
}

ConversatinSyncModelConversationsUsers $ConversatinSyncModelConversationsUsersFromJson(
    Map<String, dynamic> json) {
  final ConversatinSyncModelConversationsUsers conversatinSyncModelConversationsUsers = ConversatinSyncModelConversationsUsers();
  final String? uid = jsonConvert.convert<String>(json['uid']);
  if (uid != null) {
    conversatinSyncModelConversationsUsers.uid = uid;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    conversatinSyncModelConversationsUsers.name = name;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    conversatinSyncModelConversationsUsers.username = username;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    conversatinSyncModelConversationsUsers.email = email;
  }
  final String? zone = jsonConvert.convert<String>(json['zone']);
  if (zone != null) {
    conversatinSyncModelConversationsUsers.zone = zone;
  }
  final String? phone = jsonConvert.convert<String>(json['phone']);
  if (phone != null) {
    conversatinSyncModelConversationsUsers.phone = phone;
  }
  final int? mute = jsonConvert.convert<int>(json['mute']);
  if (mute != null) {
    conversatinSyncModelConversationsUsers.mute = mute;
  }
  final int? top = jsonConvert.convert<int>(json['top']);
  if (top != null) {
    conversatinSyncModelConversationsUsers.top = top;
  }
  final int? sex = jsonConvert.convert<int>(json['sex']);
  if (sex != null) {
    conversatinSyncModelConversationsUsers.sex = sex;
  }
  final String? category = jsonConvert.convert<String>(json['category']);
  if (category != null) {
    conversatinSyncModelConversationsUsers.category = category;
  }
  final String? shortNo = jsonConvert.convert<String>(json['short_no']);
  if (shortNo != null) {
    conversatinSyncModelConversationsUsers.shortNo = shortNo;
  }
  final int? chatPwdOn = jsonConvert.convert<int>(json['chat_pwd_on']);
  if (chatPwdOn != null) {
    conversatinSyncModelConversationsUsers.chatPwdOn = chatPwdOn;
  }
  final int? screenshot = jsonConvert.convert<int>(json['screenshot']);
  if (screenshot != null) {
    conversatinSyncModelConversationsUsers.screenshot = screenshot;
  }
  final int? revokeRemind = jsonConvert.convert<int>(json['revoke_remind']);
  if (revokeRemind != null) {
    conversatinSyncModelConversationsUsers.revokeRemind = revokeRemind;
  }
  final int? receipt = jsonConvert.convert<int>(json['receipt']);
  if (receipt != null) {
    conversatinSyncModelConversationsUsers.receipt = receipt;
  }
  final int? online = jsonConvert.convert<int>(json['online']);
  if (online != null) {
    conversatinSyncModelConversationsUsers.online = online;
  }
  final int? lastOffline = jsonConvert.convert<int>(json['last_offline']);
  if (lastOffline != null) {
    conversatinSyncModelConversationsUsers.lastOffline = lastOffline;
  }
  final int? deviceFlag = jsonConvert.convert<int>(json['device_flag']);
  if (deviceFlag != null) {
    conversatinSyncModelConversationsUsers.deviceFlag = deviceFlag;
  }
  final int? follow = jsonConvert.convert<int>(json['follow']);
  if (follow != null) {
    conversatinSyncModelConversationsUsers.follow = follow;
  }
  final int? beDeleted = jsonConvert.convert<int>(json['be_deleted']);
  if (beDeleted != null) {
    conversatinSyncModelConversationsUsers.beDeleted = beDeleted;
  }
  final int? beBlacklist = jsonConvert.convert<int>(json['be_blacklist']);
  if (beBlacklist != null) {
    conversatinSyncModelConversationsUsers.beBlacklist = beBlacklist;
  }
  final String? vercode = jsonConvert.convert<String>(json['vercode']);
  if (vercode != null) {
    conversatinSyncModelConversationsUsers.vercode = vercode;
  }
  final String? sourceDesc = jsonConvert.convert<String>(json['source_desc']);
  if (sourceDesc != null) {
    conversatinSyncModelConversationsUsers.sourceDesc = sourceDesc;
  }
  final String? remark = jsonConvert.convert<String>(json['remark']);
  if (remark != null) {
    conversatinSyncModelConversationsUsers.remark = remark;
  }
  final int? isUploadAvatar = jsonConvert.convert<int>(
      json['is_upload_avatar']);
  if (isUploadAvatar != null) {
    conversatinSyncModelConversationsUsers.isUploadAvatar = isUploadAvatar;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    conversatinSyncModelConversationsUsers.status = status;
  }
  final int? robot = jsonConvert.convert<int>(json['robot']);
  if (robot != null) {
    conversatinSyncModelConversationsUsers.robot = robot;
  }
  final int? isDestroy = jsonConvert.convert<int>(json['is_destroy']);
  if (isDestroy != null) {
    conversatinSyncModelConversationsUsers.isDestroy = isDestroy;
  }
  final int? flame = jsonConvert.convert<int>(json['flame']);
  if (flame != null) {
    conversatinSyncModelConversationsUsers.flame = flame;
  }
  final int? flameSecond = jsonConvert.convert<int>(json['flame_second']);
  if (flameSecond != null) {
    conversatinSyncModelConversationsUsers.flameSecond = flameSecond;
  }
  return conversatinSyncModelConversationsUsers;
}

Map<String, dynamic> $ConversatinSyncModelConversationsUsersToJson(
    ConversatinSyncModelConversationsUsers entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['uid'] = entity.uid;
  data['name'] = entity.name;
  data['username'] = entity.username;
  data['email'] = entity.email;
  data['zone'] = entity.zone;
  data['phone'] = entity.phone;
  data['mute'] = entity.mute;
  data['top'] = entity.top;
  data['sex'] = entity.sex;
  data['category'] = entity.category;
  data['short_no'] = entity.shortNo;
  data['chat_pwd_on'] = entity.chatPwdOn;
  data['screenshot'] = entity.screenshot;
  data['revoke_remind'] = entity.revokeRemind;
  data['receipt'] = entity.receipt;
  data['online'] = entity.online;
  data['last_offline'] = entity.lastOffline;
  data['device_flag'] = entity.deviceFlag;
  data['follow'] = entity.follow;
  data['be_deleted'] = entity.beDeleted;
  data['be_blacklist'] = entity.beBlacklist;
  data['vercode'] = entity.vercode;
  data['source_desc'] = entity.sourceDesc;
  data['remark'] = entity.remark;
  data['is_upload_avatar'] = entity.isUploadAvatar;
  data['status'] = entity.status;
  data['robot'] = entity.robot;
  data['is_destroy'] = entity.isDestroy;
  data['flame'] = entity.flame;
  data['flame_second'] = entity.flameSecond;
  return data;
}

extension ConversatinSyncModelConversationsUsersExtension on ConversatinSyncModelConversationsUsers {
  ConversatinSyncModelConversationsUsers copyWith({
    String? uid,
    String? name,
    String? username,
    String? email,
    String? zone,
    String? phone,
    int? mute,
    int? top,
    int? sex,
    String? category,
    String? shortNo,
    int? chatPwdOn,
    int? screenshot,
    int? revokeRemind,
    int? receipt,
    int? online,
    int? lastOffline,
    int? deviceFlag,
    int? follow,
    int? beDeleted,
    int? beBlacklist,
    String? vercode,
    String? sourceDesc,
    String? remark,
    int? isUploadAvatar,
    int? status,
    int? robot,
    int? isDestroy,
    int? flame,
    int? flameSecond,
  }) {
    return ConversatinSyncModelConversationsUsers()
      ..uid = uid ?? this.uid
      ..name = name ?? this.name
      ..username = username ?? this.username
      ..email = email ?? this.email
      ..zone = zone ?? this.zone
      ..phone = phone ?? this.phone
      ..mute = mute ?? this.mute
      ..top = top ?? this.top
      ..sex = sex ?? this.sex
      ..category = category ?? this.category
      ..shortNo = shortNo ?? this.shortNo
      ..chatPwdOn = chatPwdOn ?? this.chatPwdOn
      ..screenshot = screenshot ?? this.screenshot
      ..revokeRemind = revokeRemind ?? this.revokeRemind
      ..receipt = receipt ?? this.receipt
      ..online = online ?? this.online
      ..lastOffline = lastOffline ?? this.lastOffline
      ..deviceFlag = deviceFlag ?? this.deviceFlag
      ..follow = follow ?? this.follow
      ..beDeleted = beDeleted ?? this.beDeleted
      ..beBlacklist = beBlacklist ?? this.beBlacklist
      ..vercode = vercode ?? this.vercode
      ..sourceDesc = sourceDesc ?? this.sourceDesc
      ..remark = remark ?? this.remark
      ..isUploadAvatar = isUploadAvatar ?? this.isUploadAvatar
      ..status = status ?? this.status
      ..robot = robot ?? this.robot
      ..isDestroy = isDestroy ?? this.isDestroy
      ..flame = flame ?? this.flame
      ..flameSecond = flameSecond ?? this.flameSecond;
  }
}

ConversatinSyncModelConversationsGroups $ConversatinSyncModelConversationsGroupsFromJson(
    Map<String, dynamic> json) {
  final ConversatinSyncModelConversationsGroups conversatinSyncModelConversationsGroups = ConversatinSyncModelConversationsGroups();
  final String? groupNo = jsonConvert.convert<String>(json['group_no']);
  if (groupNo != null) {
    conversatinSyncModelConversationsGroups.groupNo = groupNo;
  }
  final int? groupType = jsonConvert.convert<int>(json['group_type']);
  if (groupType != null) {
    conversatinSyncModelConversationsGroups.groupType = groupType;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    conversatinSyncModelConversationsGroups.name = name;
  }
  final String? remark = jsonConvert.convert<String>(json['remark']);
  if (remark != null) {
    conversatinSyncModelConversationsGroups.remark = remark;
  }
  final String? notice = jsonConvert.convert<String>(json['notice']);
  if (notice != null) {
    conversatinSyncModelConversationsGroups.notice = notice;
  }
  final int? mute = jsonConvert.convert<int>(json['mute']);
  if (mute != null) {
    conversatinSyncModelConversationsGroups.mute = mute;
  }
  final int? top = jsonConvert.convert<int>(json['top']);
  if (top != null) {
    conversatinSyncModelConversationsGroups.top = top;
  }
  final int? showNick = jsonConvert.convert<int>(json['show_nick']);
  if (showNick != null) {
    conversatinSyncModelConversationsGroups.showNick = showNick;
  }
  final int? save = jsonConvert.convert<int>(json['save']);
  if (save != null) {
    conversatinSyncModelConversationsGroups.save = save;
  }
  final int? forbidden = jsonConvert.convert<int>(json['forbidden']);
  if (forbidden != null) {
    conversatinSyncModelConversationsGroups.forbidden = forbidden;
  }
  final int? invite = jsonConvert.convert<int>(json['invite']);
  if (invite != null) {
    conversatinSyncModelConversationsGroups.invite = invite;
  }
  final int? chatPwdOn = jsonConvert.convert<int>(json['chat_pwd_on']);
  if (chatPwdOn != null) {
    conversatinSyncModelConversationsGroups.chatPwdOn = chatPwdOn;
  }
  final int? screenshot = jsonConvert.convert<int>(json['screenshot']);
  if (screenshot != null) {
    conversatinSyncModelConversationsGroups.screenshot = screenshot;
  }
  final int? revokeRemind = jsonConvert.convert<int>(json['revoke_remind']);
  if (revokeRemind != null) {
    conversatinSyncModelConversationsGroups.revokeRemind = revokeRemind;
  }
  final int? joinGroupRemind = jsonConvert.convert<int>(
      json['join_group_remind']);
  if (joinGroupRemind != null) {
    conversatinSyncModelConversationsGroups.joinGroupRemind = joinGroupRemind;
  }
  final int? forbiddenAddFriend = jsonConvert.convert<int>(
      json['forbidden_add_friend']);
  if (forbiddenAddFriend != null) {
    conversatinSyncModelConversationsGroups.forbiddenAddFriend =
        forbiddenAddFriend;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    conversatinSyncModelConversationsGroups.status = status;
  }
  final int? receipt = jsonConvert.convert<int>(json['receipt']);
  if (receipt != null) {
    conversatinSyncModelConversationsGroups.receipt = receipt;
  }
  final int? flame = jsonConvert.convert<int>(json['flame']);
  if (flame != null) {
    conversatinSyncModelConversationsGroups.flame = flame;
  }
  final int? flameSecond = jsonConvert.convert<int>(json['flame_second']);
  if (flameSecond != null) {
    conversatinSyncModelConversationsGroups.flameSecond = flameSecond;
  }
  final int? allowViewHistoryMsg = jsonConvert.convert<int>(
      json['allow_view_history_msg']);
  if (allowViewHistoryMsg != null) {
    conversatinSyncModelConversationsGroups.allowViewHistoryMsg =
        allowViewHistoryMsg;
  }
  final int? memberCount = jsonConvert.convert<int>(json['member_count']);
  if (memberCount != null) {
    conversatinSyncModelConversationsGroups.memberCount = memberCount;
  }
  final int? onlineCount = jsonConvert.convert<int>(json['online_count']);
  if (onlineCount != null) {
    conversatinSyncModelConversationsGroups.onlineCount = onlineCount;
  }
  final int? quit = jsonConvert.convert<int>(json['quit']);
  if (quit != null) {
    conversatinSyncModelConversationsGroups.quit = quit;
  }
  final int? role = jsonConvert.convert<int>(json['role']);
  if (role != null) {
    conversatinSyncModelConversationsGroups.role = role;
  }
  final int? forbiddenExpirTime = jsonConvert.convert<int>(
      json['forbidden_expir_time']);
  if (forbiddenExpirTime != null) {
    conversatinSyncModelConversationsGroups.forbiddenExpirTime =
        forbiddenExpirTime;
  }
  final int? version = jsonConvert.convert<int>(json['version']);
  if (version != null) {
    conversatinSyncModelConversationsGroups.version = version;
  }
  return conversatinSyncModelConversationsGroups;
}

Map<String, dynamic> $ConversatinSyncModelConversationsGroupsToJson(
    ConversatinSyncModelConversationsGroups entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['group_no'] = entity.groupNo;
  data['group_type'] = entity.groupType;
  data['name'] = entity.name;
  data['remark'] = entity.remark;
  data['notice'] = entity.notice;
  data['mute'] = entity.mute;
  data['top'] = entity.top;
  data['show_nick'] = entity.showNick;
  data['save'] = entity.save;
  data['forbidden'] = entity.forbidden;
  data['invite'] = entity.invite;
  data['chat_pwd_on'] = entity.chatPwdOn;
  data['screenshot'] = entity.screenshot;
  data['revoke_remind'] = entity.revokeRemind;
  data['join_group_remind'] = entity.joinGroupRemind;
  data['forbidden_add_friend'] = entity.forbiddenAddFriend;
  data['status'] = entity.status;
  data['receipt'] = entity.receipt;
  data['flame'] = entity.flame;
  data['flame_second'] = entity.flameSecond;
  data['allow_view_history_msg'] = entity.allowViewHistoryMsg;
  data['member_count'] = entity.memberCount;
  data['online_count'] = entity.onlineCount;
  data['quit'] = entity.quit;
  data['role'] = entity.role;
  data['forbidden_expir_time'] = entity.forbiddenExpirTime;
  data['version'] = entity.version;
  return data;
}

extension ConversatinSyncModelConversationsGroupsExtension on ConversatinSyncModelConversationsGroups {
  ConversatinSyncModelConversationsGroups copyWith({
    String? groupNo,
    int? groupType,
    String? name,
    String? remark,
    String? notice,
    int? mute,
    int? top,
    int? showNick,
    int? save,
    int? forbidden,
    int? invite,
    int? chatPwdOn,
    int? screenshot,
    int? revokeRemind,
    int? joinGroupRemind,
    int? forbiddenAddFriend,
    int? status,
    int? receipt,
    int? flame,
    int? flameSecond,
    int? allowViewHistoryMsg,
    int? memberCount,
    int? onlineCount,
    int? quit,
    int? role,
    int? forbiddenExpirTime,
    int? version,
  }) {
    return ConversatinSyncModelConversationsGroups()
      ..groupNo = groupNo ?? this.groupNo
      ..groupType = groupType ?? this.groupType
      ..name = name ?? this.name
      ..remark = remark ?? this.remark
      ..notice = notice ?? this.notice
      ..mute = mute ?? this.mute
      ..top = top ?? this.top
      ..showNick = showNick ?? this.showNick
      ..save = save ?? this.save
      ..forbidden = forbidden ?? this.forbidden
      ..invite = invite ?? this.invite
      ..chatPwdOn = chatPwdOn ?? this.chatPwdOn
      ..screenshot = screenshot ?? this.screenshot
      ..revokeRemind = revokeRemind ?? this.revokeRemind
      ..joinGroupRemind = joinGroupRemind ?? this.joinGroupRemind
      ..forbiddenAddFriend = forbiddenAddFriend ?? this.forbiddenAddFriend
      ..status = status ?? this.status
      ..receipt = receipt ?? this.receipt
      ..flame = flame ?? this.flame
      ..flameSecond = flameSecond ?? this.flameSecond
      ..allowViewHistoryMsg = allowViewHistoryMsg ?? this.allowViewHistoryMsg
      ..memberCount = memberCount ?? this.memberCount
      ..onlineCount = onlineCount ?? this.onlineCount
      ..quit = quit ?? this.quit
      ..role = role ?? this.role
      ..forbiddenExpirTime = forbiddenExpirTime ?? this.forbiddenExpirTime
      ..version = version ?? this.version;
  }
}