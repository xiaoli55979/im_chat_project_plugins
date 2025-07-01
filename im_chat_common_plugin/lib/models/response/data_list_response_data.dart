// ignore_for_file: overridden_fields

import 'base_response_entity.dart';

class ListEntity<T extends BaseData> extends APIEntity {
  @override
  int? code;
  @override
  int? timestamp;
  @override
  String? msg;
  List<T>? data;

  ListEntity({this.code, this.timestamp, this.msg});

  ListEntity.fromListJson(dynamic json, T Function(dynamic) construction) {
    if (json is Map) {
      code = json['code'];
      final timestampData = json['timestamp'];

      if (timestampData is int) {
        timestamp = timestampData;
      } else if (timestamp is String) {
        timestamp = DateTime.parse(timestampData).millisecondsSinceEpoch;
      }
      msg = json['msg'];
      final list = json['data'];
      if (isSuccess() && list is List) {
        data = list.map((element) => construction(element)).toList();
      }
    }
  }
}
