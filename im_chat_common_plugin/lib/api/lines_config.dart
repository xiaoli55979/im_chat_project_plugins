import 'package:im_chat_common_plugin/models/http_dns_lines_data.dart';
import 'package:im_chat_common_plugin/tools/my_shared_pref.dart';
import 'package:im_chat_common_plugin/tools/project_utils.dart';
import 'package:im_chat_common_plugin/tools/text_field_utils.dart';
import 'package:im_chat_common_plugin/tools/tools_utils.dart';
import 'package:line_detection_plugin/line_detection.dart';

class LinesConfig {
  /// 当可用线路小于几条时候更新线路
  static int reflashMin() {
    HttpDnsLinesData? entity = MySharedPref.getHttpDnsLines();
    int minCount = 3;
    if (entity != null && entity.endpoints != null && entity.endpoints?.isNotEmpty == true) {
      minCount = entity.endpoints!.length ~/ 2;
    }
    return minCount;
  }

  /// 获取dnsid
  static String getDnsId() {
    String dnsID = "";
    ProjectType type = ProjectUtils.projectType;
    if (type == ProjectType.iChat) {
      dnsID = "2168";
    }

    /// 如果不一样使用最新的替换
    String checkDnsId = "";
    HttpDnsLinesData? entity = MySharedPref.getHttpDnsLines();
    if (entity != null && entity.dnsId != null && entity.dnsId != 0) {
      checkDnsId = "${entity.dnsId}";
    }
    if (checkDnsId.isNotEmpty && dnsID != checkDnsId) {
      dnsID = checkDnsId;
    }

    return dnsID;
  }

  /// 获取dnsKey
  static String getDnsKey() {
    String dnsKey = "";
    ProjectType type = ProjectUtils.projectType;
    if (type == ProjectType.iChat) {
      dnsKey = "zrJcsF61enT49mPz";
    }

    /// 如果不一样使用最新的替换
    String checkDnsKey = "";
    HttpDnsLinesData? entity = MySharedPref.getHttpDnsLines();
    if (entity != null && entity.dnsToken != null && entity.dnsToken!.isNotEmpty) {
      checkDnsKey = entity.dnsToken!;
    }
    if (checkDnsKey.isNotEmpty && dnsKey != checkDnsKey) {
      dnsKey = checkDnsKey;
    }
    return dnsKey;
  }

  /// 获取平台编号
  static int getPlatformNum() {
    int platform = 0;
    ProjectType type = ProjectUtils.projectType;
    if (type == ProjectType.iChat) {
      platform = 2;
    }
    return platform;
  }

  /// 获取默认配置域名
  static String getDefaultDomain() {
    String domain = "";
    ProjectType type = ProjectUtils.projectType;
    if (type == ProjectType.iChat) {
      domain = "findme.laihui68.com";
    }

    return domain;
  }

  /// 获取本地线路域名
  static String getLocalDomain(String localDomain) {
    String domain = "";

    /// 匹配 https:// 或 http:// 开头的 URL，并捕获域名
    final regex = RegExp(r'^https?:\/\/([^\/]+)');
    final match = regex.firstMatch(localDomain);

    // 如果匹配成功，返回捕获的域名，否则直接返回原字符串
    domain = match != null ? match.group(1)! : localDomain;
    return domain;
  }

  /// 获取默认配置域名
  static List<String> getDefaultDomains() {
    List<String> domains = [];
    ProjectType type = ProjectUtils.projectType;
    if (type == ProjectType.iChat) {
      domains = [
        "nlb-ua7svfjpnupgqu51ix.cn-shenzhen.nlb.aliyuncs.com",
        "findme.lianfuspace988.com",
      ];
    }
    return domains;
  }

  /// 获取默认配置域名
  static List<String> getDefaultOss() {
    List<String> domains = [];
    ProjectType type = ProjectUtils.projectType;
    if (type == ProjectType.iChat) {
      domains = [
        "https://jiubaline.oss-cn-hangzhou.aliyuncs.com/cfg/2/default.json",
        "https://jbline-1323142124.cos.ap-chengdu.myqcloud.com/cfg/2/default.json",
        "https://d2spa8jb92mzym.cloudfront.net/cfg/2/default.json",
      ];
    }
    return domains;
  }

  /// 返回主域名
  static String extractHostFromUrl(String url) {
    final uri = Uri.parse(url);
    return uri.host; // 只返回主域名部分
  }

  /// 获取SentryFlutter 配置表
  static String getDnsConfigLine() {
    String dnsLine = "";
    ProjectType type = ProjectUtils.projectType;
    LineHttpDnsModelEntity? entity = ToolsUtils.instance.httpDnsModelEntity;
    List<String>? lines = entity?.reports;
    if (lines != null && lines.isNotEmpty) {
      dnsLine = lines.first;
      if (type == ProjectType.iChat) {
        dnsLine = "https://57c88134e985fc2d494d7d37e2697f07@$dnsLine/4";
      }
    } else {
      if (type == ProjectType.iChat) {
        dnsLine = TextFieldUtils.base64ToString("aHR0cHM6Ly81N2M4ODEzNGU5ODVmYzJkNDk0ZDdkMzdlMjY5N2YwN0BzZW50cnkudGhmb3J3YXJkLmNvbS80");
      }
    }
    return dnsLine;
  }

  /// 获取新版IM客服key
  static String getNewImServerKey() {
    ProjectType type = ProjectUtils.projectType;
    String serverKey = "";
    if (type == ProjectType.iChat) {
      serverKey = "";
    }
    return serverKey;
  }
}
