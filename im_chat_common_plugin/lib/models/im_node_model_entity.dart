import 'dart:convert';

import 'package:im_chat_common_plugin/generated/json/base/json_field.dart';
import 'package:im_chat_common_plugin/generated/json/im_node_model_entity.g.dart';

export 'package:im_chat_common_plugin/generated/json/im_node_model_entity.g.dart';

@JsonSerializable()
class ImNodeModelEntity {
  // @JSONField(name: 'tcp_addr')
  late String tcpAddr = '';
  // @JSONField(name: 'ws_addr')
  late String wsAddr = '';
  // @JSONField(name: 'wss_addr')
  late String wssAddr = '';

  ImNodeModelEntity();

  factory ImNodeModelEntity.fromJson(Map<String, dynamic> json) => $ImNodeModelEntityFromJson(json);

  Map<String, dynamic> toJson() => $ImNodeModelEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
