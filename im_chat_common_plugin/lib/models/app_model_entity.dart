import 'dart:convert';

import 'package:im_chat_common_plugin/generated/json/app_model_entity.g.dart';
import 'package:im_chat_common_plugin/generated/json/base/json_field.dart';

export 'package:im_chat_common_plugin/generated/json/app_model_entity.g.dart';

@JsonSerializable()
class AppModelEntity {
  late String sid = '';
  late String name = '';
  late String desc = '';
  late int status = 0;

  AppModelEntity();

  factory AppModelEntity.fromJson(Map<String, dynamic> json) => $AppModelEntityFromJson(json);

  Map<String, dynamic> toJson() => $AppModelEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
