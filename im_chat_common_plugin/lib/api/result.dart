
import 'package:im_chat_common_plugin/generated/json/base/json_convert_content.dart';

/// 结果返回封装
class Result<T> {
  late int code;
  late String? msg;
  late T? data;
  late int total;
  late Map<String, dynamic> dataMap;
  Result();

  bool get isSuccess => code == 0;

  factory Result.fromJson(Map<String, dynamic> json) {
    Result<T> r = Result();

    /// code
    final int? code = JsonConvert.fromJsonAsT<int>(json['code']);
    if (code != null) {
      r.code = code;
    }

    /// msg
    final String? msg = JsonConvert.fromJsonAsT<String>(json['msg']);
    if (code != null) {
      r.msg = msg;
    }

    /// total
    final int? total = JsonConvert.fromJsonAsT<int>(json['total']);
    if (total != null) {
      r.total = total;
    }

    /// data
    final T? data = JsonConvert.fromJsonAsT<T>(json['data']);
    if (code != null) {
      if (data != null) {
        r.data = data;
      } else {
        r.data = null;
        if (json['data'] != null) {
          r.dataMap = json['data'];
        }
      }
    }
    return r;
  }

  @override
  String toString() => 'code:$code, msg=$msg';
}
