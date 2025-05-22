import 'package:im_chat_common_plugin/generated/json/base/json_convert_content.dart';

/// 结果返回封装
class Results<T> {
  late int code;
  late String? msg;
  late List<T>? dataList;

  Results();

  factory Results.fromJson(Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJsonT) {
    final Results<T> r = Results();
    r.code = JsonConvert.fromJsonAsT<int>(json['code']) ?? -1;
    r.msg = JsonConvert.fromJsonAsT<String>(json['msg']);
    var dataList = json['data'] as List?;
    List<T> data = [];
    if (dataList != null && dataList.isNotEmpty) {
      data = List<T>.from(dataList.map((e) => fromJsonT(e)
      )); // 这里将每个元素从 Map 转换为 T 类型
    }
    r.dataList = data;
    return r;
  }

  @override
  String toString() => 'code:$code, msg=$msg, dataList:${dataList?.length}';

}
