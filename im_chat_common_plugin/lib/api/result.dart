import '../generated/json/base/json_convert_content.dart';

/// 结果返回封装
class Result<T> {
  late int code;
  late String? msg;
  late T? data;

  Result();

  bool get isSuccess => code != null && code == 0;

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

    /// data
    final T? data = JsonConvert.fromJsonAsT<T>(json['data']);
    if (code != null) {
      r.data = data;
    }
    return r;
  }

  @override
  String toString() => 'code:$code, msg=$msg';
}
