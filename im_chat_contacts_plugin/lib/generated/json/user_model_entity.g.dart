import 'package:im_chat_contacts_plugin/generated/json/base/json_convert_content.dart';
import 'package:im_chat_contacts_plugin/model/user_model_entity.dart';

UserModelEntity $UserModelEntityFromJson(Map<String, dynamic> json) {
  final UserModelEntity userModelEntity = UserModelEntity();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    userModelEntity.id = id;
  }
  final String? userName = jsonConvert.convert<String>(json['userName']);
  if (userName != null) {
    userModelEntity.userName = userName;
  }
  final String? avatar = jsonConvert.convert<String>(json['avatar']);
  if (avatar != null) {
    userModelEntity.avatar = avatar;
  }
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    userModelEntity.nickname = nickname;
  }
  final String? account = jsonConvert.convert<String>(json['account']);
  if (account != null) {
    userModelEntity.account = account;
  }
  return userModelEntity;
}

Map<String, dynamic> $UserModelEntityToJson(UserModelEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['userName'] = entity.userName;
  data['avatar'] = entity.avatar;
  data['nickname'] = entity.nickname;
  data['account'] = entity.account;
  return data;
}

extension UserModelEntityExtension on UserModelEntity {
  UserModelEntity copyWith({
    String? id,
    String? userName,
    String? avatar,
    String? nickname,
    String? account,
  }) {
    return UserModelEntity()
      ..id = id ?? this.id
      ..userName = userName ?? this.userName
      ..avatar = avatar ?? this.avatar
      ..nickname = nickname ?? this.nickname
      ..account = account ?? this.account;
  }
}
