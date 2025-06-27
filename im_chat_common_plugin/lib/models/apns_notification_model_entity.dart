import 'dart:convert';

import '../generated/json/apns_notification_model_entity.g.dart';
import '../generated/json/base/json_field.dart';

@JsonSerializable()
class ApnsNotificationModelEntity {
  late ApnsNotificationModelAps aps;
  late String code = '';

  late String url = '';

  ApnsNotificationModelEntity();

  factory ApnsNotificationModelEntity.fromJson(Map<String, dynamic> json) => $ApnsNotificationModelEntityFromJson(json);

  Map<String, dynamic> toJson() => $ApnsNotificationModelEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ApnsNotificationModelAps {
  late ApnsNotificationModelApsAlert alert;
  late int badge = 0;
  late String sound = '';

  ApnsNotificationModelAps();

  factory ApnsNotificationModelAps.fromJson(Map<String, dynamic> json) => $ApnsNotificationModelApsFromJson(json);

  Map<String, dynamic> toJson() => $ApnsNotificationModelApsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ApnsNotificationModelApsAlert {
  late String title = '';
  late String body = '';

  ApnsNotificationModelApsAlert();

  factory ApnsNotificationModelApsAlert.fromJson(Map<String, dynamic> json) => $ApnsNotificationModelApsAlertFromJson(json);

  Map<String, dynamic> toJson() => $ApnsNotificationModelApsAlertToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
