import 'package:im_chat_common_plugin/models/response/base_response_entity.dart';

class HttpDnsLinesData extends BaseData {
  int? dnsId;
  String? dnsToken;
  List<String>? endpoints;
  List<String>? domains;
  List<String>? oss;
  List<String>? reports;

  HttpDnsLinesData({
    this.dnsId,
    this.dnsToken,
    this.endpoints,
    this.domains,
    this.oss,
    this.reports,
  });

  @override
  HttpDnsLinesData.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      dnsId = json['dnsId'];
      dnsToken = json['dnsToken'];
      endpoints = json['endpoints'] == null
          ? null
          : List.castFrom<dynamic, String>(json['endpoints']);
      domains = json['domains'] == null
          ? null
          : List.castFrom<dynamic, String>(json['domains']);
      oss = json['oss'] == null
          ? null
          : List.castFrom<dynamic, String>(json['oss']);
      reports = json['reports'] == null
          ? null
          : List.castFrom<dynamic, String>(json['reports']);
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dnsId'] = dnsId;
    data['dnsToken'] = dnsToken;
    data['endpoints'] = endpoints;
    data['domains'] = domains;
    data['oss'] = oss;
    data['reports'] = reports;
    return data;
  }
}
