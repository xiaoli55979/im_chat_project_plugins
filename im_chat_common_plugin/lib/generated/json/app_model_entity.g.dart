import 'package:im_chat_common_plugin/generated/json/base/json_convert_content.dart';
import 'package:im_chat_common_plugin/models/app_model_entity.dart';

AppModelEntity $AppModelEntityFromJson(Map<String, dynamic> json) {
  final AppModelEntity appModelEntity = AppModelEntity();
  final String? sid = jsonConvert.convert<String>(json['sid']);
  if (sid != null) {
    appModelEntity.sid = sid;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    appModelEntity.name = name;
  }
  final String? desc = jsonConvert.convert<String>(json['desc']);
  if (desc != null) {
    appModelEntity.desc = desc;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    appModelEntity.status = status;
  }
  return appModelEntity;
}

Map<String, dynamic> $AppModelEntityToJson(AppModelEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['sid'] = entity.sid;
  data['name'] = entity.name;
  data['desc'] = entity.desc;
  data['status'] = entity.status;
  return data;
}

extension AppModelEntityExtension on AppModelEntity {
  AppModelEntity copyWith({
    String? sid,
    String? name,
    String? desc,
    int? status,
  }) {
    return AppModelEntity()
      ..sid = sid ?? this.sid
      ..name = name ?? this.name
      ..desc = desc ?? this.desc
      ..status = status ?? this.status;
  }
}
