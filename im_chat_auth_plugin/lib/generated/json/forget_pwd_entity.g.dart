import 'package:im_chat_auth_plugin/generated/json/base/json_convert_content.dart';
import 'package:im_chat_auth_plugin/pages/model/forget_pwd_entity.dart';

ForgetPwdEntity $ForgetPwdEntityFromJson(Map<String, dynamic> json) {
  final ForgetPwdEntity forgetPwdEntity = ForgetPwdEntity();
  final String? additionalProp1 = jsonConvert.convert<String>(
      json['additionalProp1']);
  if (additionalProp1 != null) {
    forgetPwdEntity.additionalProp1 = additionalProp1;
  }
  final String? additionalProp2 = jsonConvert.convert<String>(
      json['additionalProp2']);
  if (additionalProp2 != null) {
    forgetPwdEntity.additionalProp2 = additionalProp2;
  }
  final String? additionalProp3 = jsonConvert.convert<String>(
      json['additionalProp3']);
  if (additionalProp3 != null) {
    forgetPwdEntity.additionalProp3 = additionalProp3;
  }
  return forgetPwdEntity;
}

Map<String, dynamic> $ForgetPwdEntityToJson(ForgetPwdEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['additionalProp1'] = entity.additionalProp1;
  data['additionalProp2'] = entity.additionalProp2;
  data['additionalProp3'] = entity.additionalProp3;
  return data;
}

extension ForgetPwdEntityExtension on ForgetPwdEntity {
  ForgetPwdEntity copyWith({
    String? additionalProp1,
    String? additionalProp2,
    String? additionalProp3,
  }) {
    return ForgetPwdEntity()
      ..additionalProp1 = additionalProp1 ?? this.additionalProp1
      ..additionalProp2 = additionalProp2 ?? this.additionalProp2
      ..additionalProp3 = additionalProp3 ?? this.additionalProp3;
  }
}