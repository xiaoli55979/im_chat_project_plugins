import 'package:im_chat_common_plugin/generated/json/base/json_convert_content.dart';
import 'package:im_chat_common_plugin/models/person_info_entity.dart';

PersonInfoEntity $PersonInfoEntityFromJson(Map<String, dynamic> json) {
  final PersonInfoEntity personInfoEntity = PersonInfoEntity();
  final int? canAiReturn = jsonConvert.convert<int>(json['can_ai_return']);
  if (canAiReturn != null) {
    personInfoEntity.canAiReturn = canAiReturn;
  }
  final int? canBatchMsg = jsonConvert.convert<int>(json['can_batch_msg']);
  if (canBatchMsg != null) {
    personInfoEntity.canBatchMsg = canBatchMsg;
  }
  final int? canCreateGroup = jsonConvert.convert<int>(
      json['can_create_group']);
  if (canCreateGroup != null) {
    personInfoEntity.canCreateGroup = canCreateGroup;
  }
  final int? canDelFriend = jsonConvert.convert<int>(json['can_del_friend']);
  if (canDelFriend != null) {
    personInfoEntity.canDelFriend = canDelFriend;
  }
  final int? canDelMsg = jsonConvert.convert<int>(json['can_del_msg']);
  if (canDelMsg != null) {
    personInfoEntity.canDelMsg = canDelMsg;
  }
  final int? canReadReceipt = jsonConvert.convert<int>(
      json['can_read_receipt']);
  if (canReadReceipt != null) {
    personInfoEntity.canReadReceipt = canReadReceipt;
  }
  final int? canRevokeMsg = jsonConvert.convert<int>(json['can_revoke_msg']);
  if (canRevokeMsg != null) {
    personInfoEntity.canRevokeMsg = canRevokeMsg;
  }
  final int? canSendLimit = jsonConvert.convert<int>(json['can_send_limit']);
  if (canSendLimit != null) {
    personInfoEntity.canSendLimit = canSendLimit;
  }
  final int? canSendLine = jsonConvert.convert<int>(json['can_send_line']);
  if (canSendLine != null) {
    personInfoEntity.canSendLine = canSendLine;
  }
  final int? canSendSize = jsonConvert.convert<int>(json['can_send_size']);
  if (canSendSize != null) {
    personInfoEntity.canSendSize = canSendSize;
  }
  final int? canShareQrcode = jsonConvert.convert<int>(
      json['can_share_qrcode']);
  if (canShareQrcode != null) {
    personInfoEntity.canShareQrcode = canShareQrcode;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    personInfoEntity.id = id;
  }
  final int? loginDeviceLimit = jsonConvert.convert<int>(
      json['login_device_limit']);
  if (loginDeviceLimit != null) {
    personInfoEntity.loginDeviceLimit = loginDeviceLimit;
  }
  final String? loginTypeLimit = jsonConvert.convert<String>(
      json['login_type_limit']);
  if (loginTypeLimit != null) {
    personInfoEntity.loginTypeLimit = loginTypeLimit;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    personInfoEntity.name = name;
  }
  final String? remark = jsonConvert.convert<String>(json['remark']);
  if (remark != null) {
    personInfoEntity.remark = remark;
  }
  return personInfoEntity;
}

Map<String, dynamic> $PersonInfoEntityToJson(PersonInfoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['can_ai_return'] = entity.canAiReturn;
  data['can_batch_msg'] = entity.canBatchMsg;
  data['can_create_group'] = entity.canCreateGroup;
  data['can_del_friend'] = entity.canDelFriend;
  data['can_del_msg'] = entity.canDelMsg;
  data['can_read_receipt'] = entity.canReadReceipt;
  data['can_revoke_msg'] = entity.canRevokeMsg;
  data['can_send_limit'] = entity.canSendLimit;
  data['can_send_line'] = entity.canSendLine;
  data['can_send_size'] = entity.canSendSize;
  data['can_share_qrcode'] = entity.canShareQrcode;
  data['id'] = entity.id;
  data['login_device_limit'] = entity.loginDeviceLimit;
  data['login_type_limit'] = entity.loginTypeLimit;
  data['name'] = entity.name;
  data['remark'] = entity.remark;
  return data;
}

extension PersonInfoEntityExtension on PersonInfoEntity {
  PersonInfoEntity copyWith({
    int? canAiReturn,
    int? canBatchMsg,
    int? canCreateGroup,
    int? canDelFriend,
    int? canDelMsg,
    int? canReadReceipt,
    int? canRevokeMsg,
    int? canSendLimit,
    int? canSendLine,
    int? canSendSize,
    int? canShareQrcode,
    int? id,
    int? loginDeviceLimit,
    String? loginTypeLimit,
    String? name,
    String? remark,
  }) {
    return PersonInfoEntity()
      ..canAiReturn = canAiReturn ?? this.canAiReturn
      ..canBatchMsg = canBatchMsg ?? this.canBatchMsg
      ..canCreateGroup = canCreateGroup ?? this.canCreateGroup
      ..canDelFriend = canDelFriend ?? this.canDelFriend
      ..canDelMsg = canDelMsg ?? this.canDelMsg
      ..canReadReceipt = canReadReceipt ?? this.canReadReceipt
      ..canRevokeMsg = canRevokeMsg ?? this.canRevokeMsg
      ..canSendLimit = canSendLimit ?? this.canSendLimit
      ..canSendLine = canSendLine ?? this.canSendLine
      ..canSendSize = canSendSize ?? this.canSendSize
      ..canShareQrcode = canShareQrcode ?? this.canShareQrcode
      ..id = id ?? this.id
      ..loginDeviceLimit = loginDeviceLimit ?? this.loginDeviceLimit
      ..loginTypeLimit = loginTypeLimit ?? this.loginTypeLimit
      ..name = name ?? this.name
      ..remark = remark ?? this.remark;
  }
}