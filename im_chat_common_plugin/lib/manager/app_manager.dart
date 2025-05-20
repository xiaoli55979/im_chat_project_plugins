import 'package:common_utils/common_utils.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/api/user_provider.dart';
import 'package:im_chat_common_plugin/generated/locales.g.dart';
import 'package:im_chat_common_plugin/services/global_service.dart';
import 'package:im_chat_common_plugin/tools/hide_keyboard_utils.dart';
import 'package:im_chat_common_plugin/tools/log_manager.dart';
import 'package:im_chat_common_plugin/tools/my_shared_pref.dart';
import 'package:im_chat_common_plugin/tools/tools_utils.dart';
import 'package:im_chat_common_plugin/util/constant.dart';
import 'package:im_chat_common_plugin/util/storage.dart';
import 'package:im_chat_common_plugin/widget/bottom_sheet/option_sheet.dart';
import 'package:line_detection_plugin/line_detection.dart';
import 'package:permission_handler/permission_handler.dart';

enum AppLanguageType implements OptionItem {
  system(null),
  chinese('CHINESE'),
  english('ENGLISH');

  final String? value;
  const AppLanguageType(this.value);

  @override
  String get title {
    switch (this) {
      case system:
        return kLanguageFollowSystem.tr;
      case chinese:
        return '简体中文';
      case english:
        return 'English';
    }
  }

  @override
  String? get image {
    switch (this) {
      case system:
      case chinese:
      case english:
        return null;
    }
  }

  Locale? get locale {
    switch (this) {
      case AppLanguageType.system:
        return null;
      case AppLanguageType.chinese:
        return China;
      case AppLanguageType.english:
        return USA;
    }
  }
}

class AppManager {
  static final shared = AppManager._();

  AppManager._();

  late Locale? locale;

  late Rx<Locale?> currentLocaler;

  AppLanguageType getDefaultLanguage() {
    if (locale == null) return AppLanguageType.system;
    if (locale!.languageCode.contains('zh')) {
      return AppLanguageType.chinese;
    }
    if (locale!.languageCode.contains('en')) {
      return AppLanguageType.english;
    }
    return AppLanguageType.system;
  }

  Future<void> initial() async {
    /// 如果需要 ensureInitialized，请在这里运行。
    WidgetsFlutterBinding.ensureInitialized();
    /// init 初始化数据存储
    await Storage.init();
    /// init shared preference
    await MySharedPref.init();

    HideKeybUtils.hideKeyShowfocus();

    /// 初始化日志管理
    LogManager.initialize();
    // log
    LogUtil.init(tag: 'iChat', isDebug: kDebugMode, maxLen: 256);

    /// 加载htttpdns缓存配置
    LinkInfoCacheManager cacheManager = LinkInfoCacheManager();
    LineHttpDnsModelEntity? entity = await cacheManager.getLineHttpDnsModelEntity();
    ToolsUtils.instance.httpDnsModelEntity = entity;

    /// 设置运行模式
    ToolsUtils.instance.isDebugModel = MySharedPref.getDebugMode();

    /// 获取设备信息
    DeviceInfo deviceInfo = await getDeviceInfo();
    ToolsUtils.instance.deviceInfo = deviceInfo;

    /// 竖屏 Portrait 模式
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    // 打开状态
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);

    // 注册 GlobalService
    Get.put(GlobalService(api: UserProvider()));

    getPermission();

    locale = Storage.getLocale();
    final currentLocale = locale ?? Get.locale ?? Get.deviceLocale;
    currentLocaler = Rx<Locale?>(currentLocale);
  }

  void changeLocale(Locale? locale) {
    this.locale = locale;
    Storage.setLocale(locale);
    final deviceLocale = Get.deviceLocale;
    if (locale != null) {
      Get.updateLocale(this.locale!);
    } else if (deviceLocale != null) {
      Get.updateLocale(deviceLocale);
    }
    currentLocaler.value = locale ?? Get.locale;
  }

  void changeLanguage() {
    OptionSheet.show(
      AppLanguageType.values,
      title: '选择语言',
      initialValue: getDefaultLanguage(),
      action: (option) {
        changeLocale(option.locale);
      },
    );
  }

  /// 检查是否有权限，用于安卓
  Future<void> getPermission() async {
    if (GetPlatform.isAndroid) {
      final storage = await Permission.storage.isGranted;
      if (storage) {
        await [Permission.storage].request();
      }
    }
  }
}
