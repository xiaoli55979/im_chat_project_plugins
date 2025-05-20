
import 'package:im_chat_common_plugin/models/response/result.dart';

abstract class APIEntity {
  int? code;
  int? timestamp;
  String? msg;

  String errorMsg() {
    return msg ?? unknownErrorMsg;
  }

  bool isSuccess() {
    return code != null && code == 0;
  }

  APIError? get error {
    if (!isSuccess()) {
      return APIError(
        errorMsg(),
        code ?? unknownErrorCode,
      );
    }
    return null;
  }

  static final unknownErrorMsg = '未知错误，请稍后再试';
  static const unknownErrorCode = -888;

  static final conncetErrorMsg = '连接错误，请检查网络设置';
  static const connectErrorCode = -999;

  static APIError get unknownError =>
      APIError(unknownErrorMsg, unknownErrorCode);
}

class BaseEntity<T> extends APIEntity {
  @override
  int? code;
  @override
  int? timestamp;
  @override
  String? msg;
  T? data;

  BaseEntity({this.code, this.timestamp, this.msg});

  BaseEntity.fromJson(dynamic json, T Function(dynamic) construction) {
    if (json is Map) {
      code = json['code'];
      final timestampData = json['timestamp'];

      if (timestampData is int) {
        timestamp = timestampData;
      } else if (timestamp is String) {
        timestamp = DateTime.parse(timestampData).millisecondsSinceEpoch;
      }
      msg = json['msg'];
      final dataMap = json['data'];
      if (isSuccess()) {
        data = construction(dataMap);
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['code'] = code;
    data['timestamp'] = timestamp;
    data['msg'] = msg;
    return data;
  }
}

abstract class BaseData {
  dynamic json;

  BaseData();

  BaseData.fromJson(dynamic json);

  dynamic toJson();
}

class VoidObject extends BaseData {
  VoidObject.fromJson(dynamic json);

  @override
  dynamic toJson() {
    return <String, dynamic>{};
  }
}
