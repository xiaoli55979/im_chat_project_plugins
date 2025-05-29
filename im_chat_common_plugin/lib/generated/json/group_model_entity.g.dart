import 'package:im_chat_common_plugin/generated/json/base/json_convert_content.dart';
import 'package:im_chat_common_plugin/models/group_model_entity.dart';

GroupModelEntity $GroupModelEntityFromJson(Map<String, dynamic> json) {
  final GroupModelEntity groupModelEntity = GroupModelEntity();
  final String? channelID = jsonConvert.convert<String>(json['channelID']);
  if (channelID != null) {
    groupModelEntity.channelID = channelID;
  }
  final int? channelType = jsonConvert.convert<int>(json['channelType']);
  if (channelType != null) {
    groupModelEntity.channelType = channelType;
  }
  final String? channelName = jsonConvert.convert<String>(json['channelName']);
  if (channelName != null) {
    groupModelEntity.channelName = channelName;
  }
  final String? channelRemark = jsonConvert.convert<String>(
      json['channelRemark']);
  if (channelRemark != null) {
    groupModelEntity.channelRemark = channelRemark;
  }
  final int? showNick = jsonConvert.convert<int>(json['showNick']);
  if (showNick != null) {
    groupModelEntity.showNick = showNick;
  }
  final int? top = jsonConvert.convert<int>(json['top']);
  if (top != null) {
    groupModelEntity.top = top;
  }
  final int? save = jsonConvert.convert<int>(json['save']);
  if (save != null) {
    groupModelEntity.save = save;
  }
  final int? mute = jsonConvert.convert<int>(json['mute']);
  if (mute != null) {
    groupModelEntity.mute = mute;
  }
  final int? forbidden = jsonConvert.convert<int>(json['forbidden']);
  if (forbidden != null) {
    groupModelEntity.forbidden = forbidden;
  }
  final int? invite = jsonConvert.convert<int>(json['invite']);
  if (invite != null) {
    groupModelEntity.invite = invite;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    groupModelEntity.status = status;
  }
  final int? follow = jsonConvert.convert<int>(json['follow']);
  if (follow != null) {
    groupModelEntity.follow = follow;
  }
  final int? isDeleted = jsonConvert.convert<int>(json['isDeleted']);
  if (isDeleted != null) {
    groupModelEntity.isDeleted = isDeleted;
  }
  final String? createdAt = jsonConvert.convert<String>(json['createdAt']);
  if (createdAt != null) {
    groupModelEntity.createdAt = createdAt;
  }
  final String? updatedAt = jsonConvert.convert<String>(json['updatedAt']);
  if (updatedAt != null) {
    groupModelEntity.updatedAt = updatedAt;
  }
  final String? avatar = jsonConvert.convert<String>(json['avatar']);
  if (avatar != null) {
    groupModelEntity.avatar = avatar;
  }
  final int? version = jsonConvert.convert<int>(json['version']);
  if (version != null) {
    groupModelEntity.version = version;
  }
  final dynamic localExtra = json['localExtra'];
  if (localExtra != null) {
    groupModelEntity.localExtra = localExtra;
  }
  final int? online = jsonConvert.convert<int>(json['online']);
  if (online != null) {
    groupModelEntity.online = online;
  }
  final int? lastOffline = jsonConvert.convert<int>(json['lastOffline']);
  if (lastOffline != null) {
    groupModelEntity.lastOffline = lastOffline;
  }
  final int? deviceFlag = jsonConvert.convert<int>(json['deviceFlag']);
  if (deviceFlag != null) {
    groupModelEntity.deviceFlag = deviceFlag;
  }
  final int? receipt = jsonConvert.convert<int>(json['receipt']);
  if (receipt != null) {
    groupModelEntity.receipt = receipt;
  }
  final int? robot = jsonConvert.convert<int>(json['robot']);
  if (robot != null) {
    groupModelEntity.robot = robot;
  }
  final String? category = jsonConvert.convert<String>(json['category']);
  if (category != null) {
    groupModelEntity.category = category;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    groupModelEntity.username = username;
  }
  final String? avatarCacheKey = jsonConvert.convert<String>(
      json['avatarCacheKey']);
  if (avatarCacheKey != null) {
    groupModelEntity.avatarCacheKey = avatarCacheKey;
  }
  final dynamic remoteExtraMap = json['remoteExtraMap'];
  if (remoteExtraMap != null) {
    groupModelEntity.remoteExtraMap = remoteExtraMap;
  }
  final String? parentChannelID = jsonConvert.convert<String>(
      json['parentChannelID']);
  if (parentChannelID != null) {
    groupModelEntity.parentChannelID = parentChannelID;
  }
  final int? parentChannelType = jsonConvert.convert<int>(
      json['parentChannelType']);
  if (parentChannelType != null) {
    groupModelEntity.parentChannelType = parentChannelType;
  }
  return groupModelEntity;
}

Map<String, dynamic> $GroupModelEntityToJson(GroupModelEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['channelID'] = entity.channelID;
  data['channelType'] = entity.channelType;
  data['channelName'] = entity.channelName;
  data['channelRemark'] = entity.channelRemark;
  data['showNick'] = entity.showNick;
  data['top'] = entity.top;
  data['save'] = entity.save;
  data['mute'] = entity.mute;
  data['forbidden'] = entity.forbidden;
  data['invite'] = entity.invite;
  data['status'] = entity.status;
  data['follow'] = entity.follow;
  data['isDeleted'] = entity.isDeleted;
  data['createdAt'] = entity.createdAt;
  data['updatedAt'] = entity.updatedAt;
  data['avatar'] = entity.avatar;
  data['version'] = entity.version;
  data['localExtra'] = entity.localExtra;
  data['online'] = entity.online;
  data['lastOffline'] = entity.lastOffline;
  data['deviceFlag'] = entity.deviceFlag;
  data['receipt'] = entity.receipt;
  data['robot'] = entity.robot;
  data['category'] = entity.category;
  data['username'] = entity.username;
  data['avatarCacheKey'] = entity.avatarCacheKey;
  data['remoteExtraMap'] = entity.remoteExtraMap;
  data['parentChannelID'] = entity.parentChannelID;
  data['parentChannelType'] = entity.parentChannelType;
  return data;
}

extension GroupModelEntityExtension on GroupModelEntity {
  GroupModelEntity copyWith({
    String? channelID,
    int? channelType,
    String? channelName,
    String? channelRemark,
    int? showNick,
    int? top,
    int? save,
    int? mute,
    int? forbidden,
    int? invite,
    int? status,
    int? follow,
    int? isDeleted,
    String? createdAt,
    String? updatedAt,
    String? avatar,
    int? version,
    dynamic localExtra,
    int? online,
    int? lastOffline,
    int? deviceFlag,
    int? receipt,
    int? robot,
    String? category,
    String? username,
    String? avatarCacheKey,
    dynamic remoteExtraMap,
    String? parentChannelID,
    int? parentChannelType,
  }) {
    return GroupModelEntity()
      ..channelID = channelID ?? this.channelID
      ..channelType = channelType ?? this.channelType
      ..channelName = channelName ?? this.channelName
      ..channelRemark = channelRemark ?? this.channelRemark
      ..showNick = showNick ?? this.showNick
      ..top = top ?? this.top
      ..save = save ?? this.save
      ..mute = mute ?? this.mute
      ..forbidden = forbidden ?? this.forbidden
      ..invite = invite ?? this.invite
      ..status = status ?? this.status
      ..follow = follow ?? this.follow
      ..isDeleted = isDeleted ?? this.isDeleted
      ..createdAt = createdAt ?? this.createdAt
      ..updatedAt = updatedAt ?? this.updatedAt
      ..avatar = avatar ?? this.avatar
      ..version = version ?? this.version
      ..localExtra = localExtra ?? this.localExtra
      ..online = online ?? this.online
      ..lastOffline = lastOffline ?? this.lastOffline
      ..deviceFlag = deviceFlag ?? this.deviceFlag
      ..receipt = receipt ?? this.receipt
      ..robot = robot ?? this.robot
      ..category = category ?? this.category
      ..username = username ?? this.username
      ..avatarCacheKey = avatarCacheKey ?? this.avatarCacheKey
      ..remoteExtraMap = remoteExtraMap ?? this.remoteExtraMap
      ..parentChannelID = parentChannelID ?? this.parentChannelID
      ..parentChannelType = parentChannelType ?? this.parentChannelType;
  }
}