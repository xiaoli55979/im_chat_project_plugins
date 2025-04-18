// ignore_for_file: overridden_fields

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

