import '../generated/json/base/json_convert_content.dart';

/// Chat 模块的返回结果封装
class ResultConversation<T> {
  late int code;
  late String? msg;
  late T? data;

  ResultConversation();

  factory ResultConversation.fromJson(Map<String, dynamic> json) {
    ResultConversation<T> r = ResultConversation();

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
