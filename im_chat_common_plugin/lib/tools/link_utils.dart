import 'dart:async';

import 'package:get/get.dart';
import 'package:im_chat_common_plugin/api/provider/base_provider.dart';
import 'package:im_chat_common_plugin/api/lines_config.dart';
import 'package:im_chat_common_plugin/api/provider/user_provider.dart';
import 'package:im_chat_common_plugin/tools/project_utils.dart';
import 'package:im_chat_common_plugin/tools/tools_utils.dart';
import 'package:line_detection_plugin/line_detection.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'encryption_utils.dart';
import 'logger_utils.dart';
import 'my_shared_pref.dart';

typedef OnStep = void Function(int, String);
typedef OnComplete = void Function(bool);
typedef OnCheck = void Function(LinkInfo info);

/// 线路检测逻辑
class LineChecker {
  /// 执行步骤回调
  OnStep? onStep;

  /// 检测回调
  OnCheck? onCheck;

  /// 完成回调
  OnComplete onComplete;

  /// 强制刷新
  bool forceRefresh;

  /// API
  UserProvider api = Get.find<UserProvider>();

  LineChecker({this.onStep, required this.onComplete, this.onCheck, this.forceRefresh = false});

  Future<LineDirectionManager> _getManager() async {
    if (ToolsUtils.instance.lineDirectionPlugin == null) {
      await _initPlugin();
    }
    return ToolsUtils.instance.lineDirectionPlugin!;
  }

  /// 初始化
  Future<void> _initPlugin() async {
    /// 获取线路检测管理初始化
    LineHttpdnsConfig httpDnsConfig = LineHttpdnsConfig(
      dnsId: LinesConfig.getDnsId(),
      dnsKey: LinesConfig.getDnsKey(),
      aesKey: EncryptionUtil.getDnsAk(),
      debug: ToolsUtils.instance.isDebugModel,
      defaultOss: LinesConfig.getDefaultOss(),
      defaultDomains: LinesConfig.getDefaultDomains(),
    );
    ToolsUtils.instance.lineDirectionPlugin = await LineDirectionManager.init(
      httpDnsConfig: httpDnsConfig,
      onCallError: (url, error) {
        LoggerUtils.error("url=$url,error:$error", error: LogType.HTTPDNS.label, scopeCallback: (Scope scope) {
          scope.setTag(LogType.HTTPDNS.label, url);
        }, level: LogLevel.ERROR, type: LogType.HTTPDNS);
      },
    );

    /// 设置初始默认域名
    String baseUrl = ToolsUtils.instance.isDebugModel ? LinkUtils.testBaseUrl : MySharedPref.getBaseUrl() ?? LinkUtils.prodBaseUrl;
    ToolsUtils.instance.lineDirectionPlugin?.baseUrl = baseUrl;
  }

  /// 从远程加载线路
  Future<void> loadLines(LineDirectionManager manager, {String? domain, baseUrlAvailable = false}) async {
    /// 状态设置
    if (!baseUrlAvailable) {
      onStep?.call(2, "线路检测中");
    }

    /// 同步获取测速完可用的最新线路
    /// 如果本地没有,则获取最新的,并返回测速完可用的
    /// 如果本地有缓存,则直接返回缓存,不测速
    List<String> linksList = await LineHandleManager.startLineCheck(
      manager: manager,
      deomain: domain ?? LinesConfig.getDefaultDomain(),
      platformNum: LinesConfig.getPlatformNum(),
      errorCallback: ({String? url, dynamic error, StackTrace? stackTrace}) {
        String errorStr = url != null ? "线路测速异常:${error}_url:$url" : error.toString();
        LoggerUtils.error(error, scopeCallback: (Scope scope) {
          scope.setTag(LogType.LINE.label, errorStr);
        }, stackTrace: stackTrace);
      },
      lineCheckCallBack: (LinkInfo linkInfo) {
        /// 如果有可用则更新状态,等待全部测试完才进入APP
        if (!baseUrlAvailable || forceRefresh) {
          onCheck?.call(linkInfo);
        }
      },
      lineAvaibleCheckCallBack: (List<LinkInfo> links) {},
      getLinkDelayTime: ToolsUtils.getLinkDelayTime,
      serverLineCheckCallBack: (LinkInfo) {},
      serverCode: (String) {},
      serverLineAvaibleCheckCallBack: (List<LinkInfo> list) {},
    );

    LoggerUtils.info(null, error: "当前取得的线路列表:${linksList.toString()}");

    if (linksList.isNotEmpty) {
      LinkUtils.endpoints = linksList;

      /// BaseUrl可用，直接进入APP
      /// BaseUrl不可用，刷新成功之后需要设置BaseUrl同时执行回调
      if (!baseUrlAvailable) {
        String baseUrl = BaseProvider.getRandomLine(linksList);

        await MySharedPref.setBaseUrl(baseUrl);
        LoggerUtils.info(null, error: "设置BaseUrl:$baseUrl");

        /// 获取秘钥
        await ToolsUtils.prKey;

        /// 线路加载成功
        onComplete(true);
      }
    } else {
      /// baseUrl可用
      if (baseUrlAvailable) {
        /// 如果是默认域名获取失败，那么用BaseUrl线路获取
        if (domain == null) {
          var baseUrl = MySharedPref.getBaseUrl();

          /// 线路获取失败,用BaseUrl刷新线路
          loadLines(manager, domain: baseUrl?.replaceAll("https://", "").replaceAll("http://", ""), baseUrlAvailable: true);
        }
      } else {
        /// 线路获取全部失败，本地也无可用线路
        onComplete(false);
      }
    }
  }

  /// 检查本地线路是否充足
  void _checkLocalEnough(int cacheLinkLen) async {
    LineDirectionManager manager = await _getManager();

    /// 当前可用缓存数量小于原始的一半,重新拉取原始线路,后台拉取
    var localConfig = await LineHandleManager.getLocalConfig();
    if (localConfig != null && cacheLinkLen <= localConfig.endpoints.length / 2.0) {
      await loadLines(manager, baseUrlAvailable: true);
    }
  }

  /// 执行任务
  void start() async {
    if (ToolsUtils.instance.isDebugModel) {
      /// 线路加载成功
      onComplete(true);
      return;
    }

    /// 初始化manager
    LineDirectionManager manager = await _getManager();

    /// 判断本地是否有缓存
    if (LinkUtils.endpoints.isNotEmpty) {
      LoggerUtils.info(null, error: "使用本地缓存线路:${LinkUtils.endpoints}");

      /// 调用API
      try {
        // 检测健康状态
        String? baseUrl = MySharedPref.getBaseUrl();
        await UserProvider.getLinkDelayTime(baseUrl!);

        if (forceRefresh) {
          await loadLines(manager, baseUrlAvailable: true);
        } else {
          /// 调用成功，检查一下线路是否充足
          _checkLocalEnough(LinkUtils.endpoints.length);
        }

        /// 线路加载成功
        onComplete(true);
      } catch (e) {
        LoggerUtils.info(null, error: "本地缓存线路全部失败，尝试重新获取");
        await loadLines(manager);
      }
    } else {
      LoggerUtils.info(null, error: "本地无缓存线路，尝试远程获取");
      await loadLines(manager);
    }
  }
}

/// APP链接地址统一管理
class LinkUtils {
  LinkUtils._();

  /// 当前API可用域名
  static List<String> _endpoints = [];

  static List<String> get endpoints {
    if (_endpoints.isEmpty) {
      _endpoints = MySharedPref.getEndpointsList();
    }
    return _endpoints;
  }

  static set endpoints(List<String> list) {
    _endpoints = list;
    MySharedPref.setEndpointsList(list);
  }

  /// 当前缓存列表异常的线路
  static List<String> errEndpoints = [];

  /// 当前使用的线路
  static List<String> allndpoints = [];

  static String getOssEndpoint(int attempt) {
    String baseUrl = LinkUtils.endpoints[attempt - 1];
    // return baseUrl.replaceFirst("app", "oss");
    return baseUrl;
  }

  /// 获取当前api oss
  static String getCurOssUrl() {
    String? getBaseUrl = MySharedPref.getBaseUrl();
    String baseUrl = getBaseUrl ?? LinkUtils.prodBaseUrl;
    if (ToolsUtils.instance.isDebugModel) {
      baseUrl = LinkUtils.testBaseUrl;
    }
    // return baseUrl.replaceFirst("app", "oss");
    return baseUrl;
  }

  /// MQTT地址
  static String mqttUrl = "";
  static int mqttPort = 0;

  /// 默认正式API地址
  static String get prodBaseUrl {
    String baseUrl = "";
    ProjectType type = ProjectUtils.projectType;
    if (type == ProjectType.iChat) {
      baseUrl = "https://api-test.easy-im.com";
    } else {
      baseUrl = "https://api-test.easy-im.com";
    }
    return baseUrl;
  }

  /// 测试API地址
  static String get testBaseUrl {
    String baseUrl = "";
    ProjectType type = ProjectUtils.projectType;
    if (type == ProjectType.iChat) {
      // baseUrl = "https://api-test.easy-im.com";
      // baseUrl = "https://api2.105shop.com";
      // baseUrl = "https://edge-api.lianfuspace988.com";
      baseUrl = "http://192.168.10.152";
    } else {
      // baseUrl = "https://api-test.easy-im.com";
      // baseUrl = "https://api3.cndway.com";
      // baseUrl = "https://onewordninewords.ptmlda.cn";
      // baseUrl = "https://test-api.jtpay.xyz";
      baseUrl = "http://192.168.10.152";
    }
    return baseUrl;
  }
}
