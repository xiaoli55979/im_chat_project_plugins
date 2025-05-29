import 'package:im_chat_common_plugin/generated/json/base/json_convert_content.dart';
import 'package:im_chat_common_plugin/models/friend_model_entity.dart';

FriendModelEntity $FriendModelEntityFromJson(Map<String, dynamic> json) {
  final FriendModelEntity friendModelEntity = FriendModelEntity();
  final String? uid = jsonConvert.convert<String>(json['uid']);
  if (uid != null) {
    friendModelEntity.uid = uid;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    friendModelEntity.name = name;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    friendModelEntity.username = username;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    friendModelEntity.email = email;
  }
  final String? zone = jsonConvert.convert<String>(json['zone']);
  if (zone != null) {
    friendModelEntity.zone = zone;
  }
  final String? phone = jsonConvert.convert<String>(json['phone']);
  if (phone != null) {
    friendModelEntity.phone = phone;
  }
  final int? mute = jsonConvert.convert<int>(json['mute']);
  if (mute != null) {
    friendModelEntity.mute = mute;
  }
  final int? top = jsonConvert.convert<int>(json['top']);
  if (top != null) {
    friendModelEntity.top = top;
  }
  final int? sex = jsonConvert.convert<int>(json['sex']);
  if (sex != null) {
    friendModelEntity.sex = sex;
  }
  final String? category = jsonConvert.convert<String>(json['category']);
  if (category != null) {
    friendModelEntity.category = category;
  }
  final String? shortNo = jsonConvert.convert<String>(json['short_no']);
  if (shortNo != null) {
    friendModelEntity.shortNo = shortNo;
  }
  final int? chatPwdOn = jsonConvert.convert<int>(json['chat_pwd_on']);
  if (chatPwdOn != null) {
    friendModelEntity.chatPwdOn = chatPwdOn;
  }
  final int? screenshot = jsonConvert.convert<int>(json['screenshot']);
  if (screenshot != null) {
    friendModelEntity.screenshot = screenshot;
  }
  final int? revokeRemind = jsonConvert.convert<int>(json['revoke_remind']);
  if (revokeRemind != null) {
    friendModelEntity.revokeRemind = revokeRemind;
  }
  final int? receipt = jsonConvert.convert<int>(json['receipt']);
  if (receipt != null) {
    friendModelEntity.receipt = receipt;
  }
  final int? online = jsonConvert.convert<int>(json['online']);
  if (online != null) {
    friendModelEntity.online = online;
  }
  final int? lastOffline = jsonConvert.convert<int>(json['last_offline']);
  if (lastOffline != null) {
    friendModelEntity.lastOffline = lastOffline;
  }
  final int? deviceFlag = jsonConvert.convert<int>(json['device_flag']);
  if (deviceFlag != null) {
    friendModelEntity.deviceFlag = deviceFlag;
  }
  final int? follow = jsonConvert.convert<int>(json['follow']);
  if (follow != null) {
    friendModelEntity.follow = follow;
  }
  final int? beDeleted = jsonConvert.convert<int>(json['be_deleted']);
  if (beDeleted != null) {
    friendModelEntity.beDeleted = beDeleted;
  }
  final int? beBlacklist = jsonConvert.convert<int>(json['be_blacklist']);
  if (beBlacklist != null) {
    friendModelEntity.beBlacklist = beBlacklist;
  }
  final String? vercode = jsonConvert.convert<String>(json['vercode']);
  if (vercode != null) {
    friendModelEntity.vercode = vercode;
  }
  final String? sourceDesc = jsonConvert.convert<String>(json['source_desc']);
  if (sourceDesc != null) {
    friendModelEntity.sourceDesc = sourceDesc;
  }
  final String? remark = jsonConvert.convert<String>(json['remark']);
  if (remark != null) {
    friendModelEntity.remark = remark;
  }
  final int? isUploadAvatar = jsonConvert.convert<int>(
      json['is_upload_avatar']);
  if (isUploadAvatar != null) {
    friendModelEntity.isUploadAvatar = isUploadAvatar;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    friendModelEntity.status = status;
  }
  final int? robot = jsonConvert.convert<int>(json['robot']);
  if (robot != null) {
    friendModelEntity.robot = robot;
  }
  final int? isDestroy = jsonConvert.convert<int>(json['is_destroy']);
  if (isDestroy != null) {
    friendModelEntity.isDestroy = isDestroy;
  }
  final int? flame = jsonConvert.convert<int>(json['flame']);
  if (flame != null) {
    friendModelEntity.flame = flame;
  }
  final int? flameSecond = jsonConvert.convert<int>(json['flame_second']);
  if (flameSecond != null) {
    friendModelEntity.flameSecond = flameSecond;
  }
  final int? version = jsonConvert.convert<int>(json['version']);
  if (version != null) {
    friendModelEntity.version = version;
  }
  final int? isDeleted = jsonConvert.convert<int>(json['is_deleted']);
  if (isDeleted != null) {
    friendModelEntity.isDeleted = isDeleted;
  }
  final String? createdAt = jsonConvert.convert<String>(json['created_at']);
  if (createdAt != null) {
    friendModelEntity.createdAt = createdAt;
  }
  final String? updatedAt = jsonConvert.convert<String>(json['updated_at']);
  if (updatedAt != null) {
    friendModelEntity.updatedAt = updatedAt;
  }
  return friendModelEntity;
}

Map<String, dynamic> $FriendModelEntityToJson(FriendModelEntity entity) {
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
  data['version'] = entity.version;
  data['is_deleted'] = entity.isDeleted;
  data['created_at'] = entity.createdAt;
  data['updated_at'] = entity.updatedAt;
  return data;
}

extension FriendModelEntityExtension on FriendModelEntity {
  FriendModelEntity copyWith({
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
    int? version,
    int? isDeleted,
    String? createdAt,
    String? updatedAt,
  }) {
    return FriendModelEntity()
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
      ..flameSecond = flameSecond ?? this.flameSecond
      ..version = version ?? this.version
      ..isDeleted = isDeleted ?? this.isDeleted
      ..createdAt = createdAt ?? this.createdAt
      ..updatedAt = updatedAt ?? this.updatedAt;
  }
}