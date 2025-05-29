import 'package:im_chat_common_plugin/generated/json/base/json_convert_content.dart';
import 'package:im_chat_common_plugin/models/im_node_model_entity.dart';

ImNodeModelEntity $ImNodeModelEntityFromJson(Map<String, dynamic> json) {
  final ImNodeModelEntity imNodeModelEntity = ImNodeModelEntity();
  final String? tcpAddr = jsonConvert.convert<String>(json['tcpAddr']);
  if (tcpAddr != null) {
    imNodeModelEntity.tcpAddr = tcpAddr;
  }
  final String? wsAddr = jsonConvert.convert<String>(json['wsAddr']);
  if (wsAddr != null) {
    imNodeModelEntity.wsAddr = wsAddr;
  }
  final String? wssAddr = jsonConvert.convert<String>(json['wssAddr']);
  if (wssAddr != null) {
    imNodeModelEntity.wssAddr = wssAddr;
  }
  return imNodeModelEntity;
}

Map<String, dynamic> $ImNodeModelEntityToJson(ImNodeModelEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['tcpAddr'] = entity.tcpAddr;
  data['wsAddr'] = entity.wsAddr;
  data['wssAddr'] = entity.wssAddr;
  return data;
}

extension ImNodeModelEntityExtension on ImNodeModelEntity {
  ImNodeModelEntity copyWith({
    String? tcpAddr,
    String? wsAddr,
    String? wssAddr,
  }) {
    return ImNodeModelEntity()
      ..tcpAddr = tcpAddr ?? this.tcpAddr
      ..wsAddr = wsAddr ?? this.wsAddr
      ..wssAddr = wssAddr ?? this.wssAddr;
  }
}