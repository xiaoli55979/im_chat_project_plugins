import 'package:im_chat_common_plugin/generated/json/base/json_convert_content.dart';
import 'package:im_chat_common_plugin/models/apns_notification_model_entity.dart';

ApnsNotificationModelEntity $ApnsNotificationModelEntityFromJson(Map<String, dynamic> json) {
  final ApnsNotificationModelEntity apnsNotificationModelEntity = ApnsNotificationModelEntity();
  final ApnsNotificationModelAps? aps = jsonConvert.convert<ApnsNotificationModelAps>(json['aps']);
  if (aps != null) {
    apnsNotificationModelEntity.aps = aps;
  }
  final String? code = jsonConvert.convert<String>(json['code']);
  if (code != null) {
    apnsNotificationModelEntity.code = code;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    apnsNotificationModelEntity.url = url;
  }
  return apnsNotificationModelEntity;
}

Map<String, dynamic> $ApnsNotificationModelEntityToJson(ApnsNotificationModelEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['aps'] = entity.aps.toJson();
  data['code'] = entity.code;
  data['url'] = entity.url;
  return data;
}

extension ApnsNotificationModelEntityExtension on ApnsNotificationModelEntity {
  ApnsNotificationModelEntity copyWith({
    ApnsNotificationModelAps? aps,
    String? code,
    String? url,
  }) {
    return ApnsNotificationModelEntity()
      ..aps = aps ?? this.aps
      ..code = code ?? this.code
      ..url = url ?? this.url;
  }
}

ApnsNotificationModelAps $ApnsNotificationModelApsFromJson(Map<String, dynamic> json) {
  final ApnsNotificationModelAps apnsNotificationModelAps = ApnsNotificationModelAps();
  final ApnsNotificationModelApsAlert? alert = jsonConvert.convert<ApnsNotificationModelApsAlert>(json['alert']);
  if (alert != null) {
    apnsNotificationModelAps.alert = alert;
  }
  final int? badge = jsonConvert.convert<int>(json['badge']);
  if (badge != null) {
    apnsNotificationModelAps.badge = badge;
  }
  final String? sound = jsonConvert.convert<String>(json['sound']);
  if (sound != null) {
    apnsNotificationModelAps.sound = sound;
  }
  return apnsNotificationModelAps;
}

Map<String, dynamic> $ApnsNotificationModelApsToJson(ApnsNotificationModelAps entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['alert'] = entity.alert.toJson();
  data['badge'] = entity.badge;
  data['sound'] = entity.sound;
  return data;
}

extension ApnsNotificationModelApsExtension on ApnsNotificationModelAps {
  ApnsNotificationModelAps copyWith({
    ApnsNotificationModelApsAlert? alert,
    int? badge,
    String? sound,
  }) {
    return ApnsNotificationModelAps()
      ..alert = alert ?? this.alert
      ..badge = badge ?? this.badge
      ..sound = sound ?? this.sound;
  }
}

ApnsNotificationModelApsAlert $ApnsNotificationModelApsAlertFromJson(Map<String, dynamic> json) {
  final ApnsNotificationModelApsAlert apnsNotificationModelApsAlert = ApnsNotificationModelApsAlert();
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    apnsNotificationModelApsAlert.title = title;
  }
  final String? body = jsonConvert.convert<String>(json['body']);
  if (body != null) {
    apnsNotificationModelApsAlert.body = body;
  }
  return apnsNotificationModelApsAlert;
}

Map<String, dynamic> $ApnsNotificationModelApsAlertToJson(ApnsNotificationModelApsAlert entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['title'] = entity.title;
  data['body'] = entity.body;
  return data;
}

extension ApnsNotificationModelApsAlertExtension on ApnsNotificationModelApsAlert {
  ApnsNotificationModelApsAlert copyWith({
    String? title,
    String? body,
  }) {
    return ApnsNotificationModelApsAlert()
      ..title = title ?? this.title
      ..body = body ?? this.body;
  }
}
