import 'package:im_chat_common_plugin/models/response/base_response_entity.dart';

class IMNodeData extends BaseData{
  String? tcpAddr;
  String? wsAddr;
  String? wssAddr;

  IMNodeData({this.tcpAddr, this.wsAddr, this.wssAddr});

  @override
  IMNodeData.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      tcpAddr = json['tcpAddr'];
      wsAddr = json['wsAddr'];
      wssAddr = json['wssAddr'];
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tcpAddr'] = tcpAddr;
    data['wsAddr'] = wsAddr;
    data['wssAddr'] = wssAddr;
    return data;
  }
}