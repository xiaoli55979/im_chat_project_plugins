import 'dart:convert';

import '../generated/json/base/json_field.dart';
import '../generated/json/http_dns_lines_model_entity.g.dart';

@JsonSerializable()
class HttpDnsLinesModelEntity {
  late int dnsId = 0;
  late String dnsToken = '';
  late List<String> endpoints = [];
  late List<String> domains = [];
  late List<String> oss = [];
  late List<String> reports = [];

  HttpDnsLinesModelEntity();

  factory HttpDnsLinesModelEntity.fromJson(Map<String, dynamic> json) => $HttpDnsLinesModelEntityFromJson(json);

  Map<String, dynamic> toJson() => $HttpDnsLinesModelEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
