import 'package:device_info/device_info.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screen_lock_plug/lock_screen_manager.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/api/provider/user_provider.dart';
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';
import 'package:intl/intl.dart';
import 'package:line_detection_plugin/line_detection.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sentry_dio/sentry_dio.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class ToolsUtils {
  // 声明一个私有构造函数，防止外部实例化该类
  ToolsUtils._();

  // 声明一个静态私有成员变量，用于存储单例实例
  static final ToolsUtils _instance = ToolsUtils._();

  // 声明一个静态方法，用于获取单例实例
  static ToolsUtils get instance => _instance;

  /// 基础连接
  String baseUrl = "http://192.168.10.223:8081";

  /// 是否是jtp 否则是 lianfu
  bool isJtp = true;

  /// httpDns缓存配置
  LineHttpDnsModelEntity? httpDnsModelEntity;

  /// 线路检测插件
  LineDirectionManager? lineDirectionPlugin;

  /// akey
  String aeKy = "";

  /// key
  String prKy = "";

  /// 声明一个变量，用于存储设备信息
  DeviceInfo? deviceInfo;

  /// 是否是debug模式
  bool isDebugModel = true;

  // 在这里可以添加其他方法和属性
  void setDeviceInfo(DeviceInfo info) {
    deviceInfo = info;
  }

  // 获取设备信息的方法
  DeviceInfo? getDeviceInfo() {
    return deviceInfo;
  }

  /// 获取APP名称
  static String getAppName() {
    return "iChat";
  }

  /// 获取设备信息
  static Map<String, dynamic> getDeviceMap() {
    return {
      'device_id': ToolsUtils.instance.deviceInfo!.deviceId,
      'device_name': ToolsUtils.instance.deviceInfo!.device,
      'device_model': ToolsUtils.instance.deviceInfo!.model,
    };
  }

  /// 获取是否是平板
  static bool getIsPad() {
    DeviceInfo? info = ToolsUtils.instance.getDeviceInfo();
    if (info != null) {
      String platform = info.platform;
      if (platform == "iPadOS") {
        return true;
      }
      if (platform == "Android") {
        double? displaySizeInches = info.displaySizeInches;
        if (displaySizeInches != null && displaySizeInches > 9.0) {
          return true;
        }
        return false;
      }
      if (platform == "iOS") return false;
    }
    return false;
  }

  /// 获取缓存版本
  static String get cacheKey {
    return MySharedPref.getCashKey();
  }

  /// 获取秘钥
  static Future<String> get prKey async {
    try {
      if (ToolsUtils.instance.prKy.isNotEmpty) {
        return ToolsUtils.instance.prKy;
      }
      final UserProvider api = Get.find();
      // var res = await api.getky();
      // if (res.msg != null && res.msg!.isNotEmpty) {
      //   ToolsUtils.instance.prKy = res.msg!;
      //   return res.msg!;
      // } else {
      //   throw Exception("API 返回的数据为空");
      // }

      return "";
    } catch (e) {
      LoggerUtils.error(e, error: "获取调用 ky 异常", level: LogLevel.ERROR);
      rethrow;
    }
  }

  /// 获取版本号
  static Future<String> getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    var manVersion = packageInfo.version;
    var build = packageInfo.buildNumber;
    var up = GlobalService.to.getVersionCode.toString();
    return "$manVersion-$build-$up";
  }

  /// 测试某一条线路的速度
  static Future<int> getLinkDelayTime({
    required String link,
    int maxTimeOut = 16,
    void Function({String? url, dynamic error, StackTrace stackTrace})? errorCallback,
  }) async {
    String url = "$link/health";
    String formatUrl = LineTools.formatUrl(url);

    Dio dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    ));

    // 添加异常上报处理
    dio.addSentry();

    // 启动事务
    final transaction = Sentry.startTransaction(
      formatUrl,
      "线路测速Dio",
      bindToScope: true, // 绑定到 Sentry 作用域
    );

    try {
      var startTime = DateTime.now();
      var response = await dio.get(formatUrl).timeout(Duration(seconds: maxTimeOut));
      var endTime = DateTime.now(); // 记录结束时间

      if (response.data == true) {
        var duration = endTime.difference(startTime).inMilliseconds; // 计算时长
        transaction.status = SpanStatus.fromHttpStatusCode(response.statusCode ?? -1);
        return duration;
      } else {
        transaction.status = const SpanStatus.unknown();
        throw Exception('线路测速结果异常');
      }
    } catch (error, stackTrace) {
      // 设置 Sentry 事务的异常信息和状态
      transaction.throwable = error;
      transaction.status = const SpanStatus.unknown();

      // 通过回调传递异常信息
      if (errorCallback != null) {
        errorCallback(url: formatUrl, error: error, stackTrace: stackTrace);
      }

      LoggerUtils.error(error, scopeCallback: (Scope scope) {
        scope.setTag(LogType.LINE.label, error.toString());
      }, stackTrace: stackTrace);
      return 20000; // 超时或者异常时返回默认值
    } finally {
      // 结束事务
      await transaction.finish();
    }
  }

  /// AES iv
  static String getAesIv() {
    return TextFieldUtils.getRadomAESIV();
  }

  /// 检测锁屏
  static void showLockScreen() {
    JtpComponentsInit jtpInit = JtpComponentsInit();
    print("object_isLockScreen:${jtpInit.isLockScreen}");
    if (jtpInit.isLockScreen) return;
    jtpInit.isLockScreen = true;
    String pwd = MySharedPref.getAppLockScreenPwd();
    print("object_pwd:$pwd");
    if (pwd.isEmpty) return;

    ///  检测是否有密码
    LockScreenManager.show(
      password: pwd,
      context: Get.context!,
      errorMaxPop: true,
      onUnlockSuccess: () {
        jtpInit.isLockScreen = false;
        print("object_onUnlockSuccess");
        String rootPath = "/launch";

        /// 获取项目id
        String projectId = MySharedPref.getProjectIdKey();
        if (projectId.isNotEmpty) {
          rootPath = "/login";
          if (GlobalService.to.isLoggedInValue) {
            rootPath = "/home";
          }
        }
        Get.offAllNamed(rootPath);
      },
      onErrorExceeded: () {
        jtpInit.isLockScreen = false;
        print("object_onErrorExceeded");
      },
    );
  }

  /// 显示扫码界面
  static void onQrcodeScan() async {
    if (GlobalService.to.isLoggedInValue) {
      /// 申请权限
      // 获取相机相册权限
      PermissionsUtils.requestAllPermission((status) async {
        if (status) {
          startScan();
        } else {
          SnackBarUtil.showError("提示", "相册或者相机未授权!");
        }
      });
    } else {}
  }

  /// 显示扫码界面
  static Future<void> startScan() async {
    var result = await Get.to(() => const CustomQrcodeScanview());
    try {
      print("object_startScan:$result");
    } catch (e, stackTrace) {
      SnackBarUtil.showError("提示", "无效二维码");
    }
  }

  /// 返回指定格式时间字符串
  static String formatDateTime(int timestamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    DateTime now = DateTime.now();
    Duration diff = now.difference(dateTime);

    String timeStr = DateFormat('HH:mm').format(dateTime);

    if (diff.inDays == 0 && dateTime.day == now.day) {
      // 今天
      return timeStr;
    } else if (diff.inDays == 1 || (now.day - dateTime.day == 1 && now.month == dateTime.month)) {
      // 昨天
      return "昨天 $timeStr";
    } else if (diff.inDays < 7 && dateTime.weekday < now.weekday) {
      // 本周内，显示“周X”
      List<String> weekDays = ["", "周一", "周二", "周三", "周四", "周五", "周六", "周日"];
      return "${weekDays[dateTime.weekday]} $timeStr";
    } else if (dateTime.year == now.year) {
      // 今年，显示“MM月DD日 HH:mm”
      return DateFormat("MM月dd日 HH:mm").format(dateTime);
    } else {
      // 跨年，显示“YYYY年MM月DD日 HH:mm”
      return DateFormat("yyyy年MM月dd日 HH:mm").format(dateTime);
    }
  }

  /// 情况指定路径缓存
  static Future<void> clearSpecificImageCache(String imageUrl) async {
    print("object_clearSpecificImageCache:$imageUrl");
    await DefaultCacheManager().removeFile(imageUrl);
  }

  /// 异常提示信息
  static void showErrorMsg({required dynamic e, required String message}) {
    if (e is ApiException) {
      DialogUtils.showError(e.message);
    } else {
      kDebugMode ? DialogUtils.showError(e.toString()) : DialogUtils.showError(message);
    }
  }

  /// 私有方法：格式化大小为 KB/MB
  static String formatSize(int bytes) {
    if (bytes <= 0) return "0 KB";
    const kb = 1024;
    const mb = kb * 1024;
    if (bytes >= mb) {
      return "${(bytes / mb).toStringAsFixed(2)} MB";
    } else {
      return "${(bytes / kb).toStringAsFixed(2)} KB";
    }
  }
}
