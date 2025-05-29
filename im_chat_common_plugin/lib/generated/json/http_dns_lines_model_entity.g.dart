import 'package:im_chat_common_plugin/generated/json/base/json_convert_content.dart';
import 'package:im_chat_common_plugin/models/http_dns_lines_model_entity.dart';

HttpDnsLinesModelEntity $HttpDnsLinesModelEntityFromJson(
    Map<String, dynamic> json) {
  final HttpDnsLinesModelEntity httpDnsLinesModelEntity = HttpDnsLinesModelEntity();
  final int? dnsId = jsonConvert.convert<int>(json['dnsId']);
  if (dnsId != null) {
    httpDnsLinesModelEntity.dnsId = dnsId;
  }
  final String? dnsToken = jsonConvert.convert<String>(json['dnsToken']);
  if (dnsToken != null) {
    httpDnsLinesModelEntity.dnsToken = dnsToken;
  }
  final List<String>? endpoints = (json['endpoints'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (endpoints != null) {
    httpDnsLinesModelEntity.endpoints = endpoints;
  }
  final List<String>? domains = (json['domains'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (domains != null) {
    httpDnsLinesModelEntity.domains = domains;
  }
  final List<String>? oss = (json['oss'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (oss != null) {
    httpDnsLinesModelEntity.oss = oss;
  }
  final List<String>? reports = (json['reports'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (reports != null) {
    httpDnsLinesModelEntity.reports = reports;
  }
  return httpDnsLinesModelEntity;
}

Map<String, dynamic> $HttpDnsLinesModelEntityToJson(
    HttpDnsLinesModelEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['dnsId'] = entity.dnsId;
  data['dnsToken'] = entity.dnsToken;
  data['endpoints'] = entity.endpoints;
  data['domains'] = entity.domains;
  data['oss'] = entity.oss;
  data['reports'] = entity.reports;
  return data;
}

extension HttpDnsLinesModelEntityExtension on HttpDnsLinesModelEntity {
  HttpDnsLinesModelEntity copyWith({
    int? dnsId,
    String? dnsToken,
    List<String>? endpoints,
    List<String>? domains,
    List<String>? oss,
    List<String>? reports,
  }) {
    return HttpDnsLinesModelEntity()
      ..dnsId = dnsId ?? this.dnsId
      ..dnsToken = dnsToken ?? this.dnsToken
      ..endpoints = endpoints ?? this.endpoints
      ..domains = domains ?? this.domains
      ..oss = oss ?? this.oss
      ..reports = reports ?? this.reports;
  }
}