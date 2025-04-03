import 'dart:io';

import 'package:common_utils/common_utils.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/routes/app_pages_common.dart';
import 'package:im_chat_common_plugin/services/global_service.dart';
import 'package:im_chat_common_plugin/tools/app_lifecycle_manager.dart';
import 'package:im_chat_common_plugin/tools/common_config_option.dart';
import 'package:im_chat_common_plugin/tools/hide_keyboard_utils.dart';
import 'package:im_chat_common_plugin/tools/log_manager.dart';
import 'package:im_chat_common_plugin/tools/my_shared_pref.dart';
import 'package:im_chat_common_plugin/tools/project_utils.dart';
import 'package:im_chat_common_plugin/tools/tools_utils.dart';
import 'package:line_detection_plugin/line_detection.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'api/lines_config.dart';
import 'api/provider.dart';
import 'config/theme/my_theme.dart';
import 'config/translations/localization_service.dart';

// bool debugModel = false; //kDebugMode;
// bool debugModel = kDebugMode;
bool debugModel = MySharedPref.getDebugMode();

class JtpComponentsInit {
  JtpComponentsInit._();

  static final JtpComponentsInit _instance = JtpComponentsInit._();

  /// 初始化完成的回调函数

  /// 回调函数集合
  VoidCallback? onInitComplete;
  VoidCallback? onLogoutComplete;
  VoidCallback? onBindComplete;
  VoidCallback? onNewMsgComplete;
  Function({int? groupType})? onNewServerComplete;
  VoidCallback? onSystemServerComplete;
  Function(String mainUrl, String backUrl)? onServerLinksComplete; // 获取客服api地址
  /// 获取未读消息数的回调 type=0 获取聊天  type=1获取系统
  Future<int> Function(int type)? onGetUnReadComplete;

  bool _isInitialized = false;

  /// 检查是否已初始化
  bool get isInitialized => _isInitialized;

  /// 路由表
  List<GetPage> routesList = [];

  /// 保存聊天消息监听器列表
  final List<VoidCallback> _chatMsgListeners = [];

  Function(BuildContext)? _onContextInit; // 新增带上下文回调

  /// 是否处于锁屏页面
  bool isLockScreen = false;

  /// 初始化配置
  CommonConfigOption commonConfig = CommonConfigOption();

  /// 初始化
  void initialize({
    VoidCallback? initComplete,
    VoidCallback? logoutComplete,
    VoidCallback? bindComplete,
    VoidCallback? newMsgComplete,
    Function({int? groupType})? newServerComplete,
    VoidCallback? systemServerComplete,
    Function(String mainUrl, String backUrl)? serverLinksComplete,
    Future<int> Function(int type)? getUnReadComplete,
  }) {
    onInitComplete = initComplete;
    onLogoutComplete = logoutComplete;
    onBindComplete = bindComplete;
    onNewMsgComplete = newMsgComplete;
    onNewServerComplete = newServerComplete;
    onSystemServerComplete = systemServerComplete;
    onServerLinksComplete = serverLinksComplete;
    onGetUnReadComplete = getUnReadComplete;
  }

  /// 设置上下文回调
  void setContextCallback(Function(BuildContext) onCompleteWithContext) {
    _onContextInit = onCompleteWithContext;
  }

  /// 更新UI
  void notifyUpdateUIComplete(BuildContext context) {
    if (_onContextInit != null) {
      _onContextInit!(context);
    }
  }

  /// 通用回调执行器
  void _executeCallback(VoidCallback? callback) => callback?.call();

  /// 通知初始化完成
  void notifyInitializationComplete() {
    _isInitialized = true;
    _executeCallback(onInitComplete);
  }

  /// 通知退出登录完成
  void notifyLogoutComplete() => _executeCallback(onLogoutComplete);

  /// 通知绑定账号完成
  void notifyBindComplete() => _executeCallback(onBindComplete);

  /// 通知打开客服完成
  void notifyNewServerComplete({int? groupType}) {
    if (onNewServerComplete != null) {
      onNewServerComplete!(groupType: groupType);
    }
  }

  /// 通知打开系统消息完成
  void notifySystemServerComplete() => _executeCallback(onSystemServerComplete);

  // /// 添加系统消息监听器
  // void addSystemMsgListener(Function(ImNewChatSystemMessageModelEntity) listener) {
  //   // if (!_systemMsgListeners.contains(listener)) {
  //   //   _systemMsgListeners.add(listener);
  //   // }
  // }

  /// 移除系统消息监听器
  // void removeSystemMsgListener(Function(ImNewChatSystemMessageModelEntity) listener) {
  //   // _systemMsgListeners.remove(listener);
  // }

  /// 通知系统消息监听
  void notifySystemMsgComplete(dynamic msg) {
    try {
      List<dynamic> msgList = msg as List;
    } catch (e) {
      print("Error decoding the msg: $e");
    }
  }

  /// 添加聊天消息监听器
  void addChatMsgListener(VoidCallback listener) {
    if (!_chatMsgListeners.contains(listener)) {
      _chatMsgListeners.add(listener);
    }
  }

  /// 移除聊天消息监听器
  void removeChatMsgListener(VoidCallback listener) {
    _chatMsgListeners.remove(listener);
  }

  /// 通知聊天消息监听器（收到新消息时调用）
  void notifyChatMsgComplete() {
    /// 回调静态监听
    if (onNewMsgComplete != null) {
      onNewMsgComplete?.call();
    }

    for (var listener in _chatMsgListeners) {
      listener();
    }
  }

  /// 线路获取完成
  void notifyServerLinkComplete(String mainUrl, String backUrl) {
    if (onServerLinksComplete != null) {
      onServerLinksComplete!(mainUrl, backUrl);
    }
  }

  /// 触发未读消息回调
  Future<int> notifyGetUnReadComplete(int type) async {
    if (onGetUnReadComplete != null) {
      return await onGetUnReadComplete!(type); // 等待回调执行，并返回值
    }
    return 0; // 如果回调未设置，返回 0
  }

  /// 获取单例的工厂构造函数
  factory JtpComponentsInit() {
    return _instance;
  }

  /// 初始化
  Future<void> initMain({
    required List<GetPage> routes,
    List<Bind>? additionalBinds,
  }) async {
    // 合并路由列表
    final combinedRoutes = [...AppPagesCommon.routes, ...routes];

    /// 初始化默认配置
    await initDefaultConfig(commonConfig);

    /// 注册生命周期管理
    AppLifecycleManager.instance.init();

    // String rootPath = "/launch"; // splash
    String rootPath = "/splash"; //

    // /// 获取项目id
    // String projectId = MySharedPref.getProjectIdKey();
    // if (projectId.isNotEmpty) {
    //   rootPath = "/login";
    //   if (GlobalService.to.isLoggedInValue) {
    //     rootPath = "/home";
    //   }
    // }

    /// 初始化异常上报SDK
    await SentryFlutter.init(
      (options) {
        options.dsn = LinesConfig.getDnsConfigLine();
        options.tracesSampleRate = 0.8;
        options.debug = false;
        options.enablePrintBreadcrumbs = false;
      },
      appRunner: () => initRunApp(rootPath, combinedRoutes, additionalBinds),
    );

    // 透明状态栏
    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }

  /// 初始化入口
  static void initRunApp(String initial, List<GetPage> routes, [List<Bind>? additionalBinds]) {
    runApp(
      ScreenUtilInit(
        // 填入设计稿中设备的屏幕尺寸,单位dp
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        rebuildFactor: (old, data) => true,
        builder: (context, widget) {
          /// 通知UI初始完成
          _instance.notifyUpdateUIComplete(context);
          return GetMaterialApp(
            title: ToolsUtils.getAppName(),
            // enableLog: true,
            // logWriterCallback: (text, {isError = false}) {
            //   print("logWriterCallback:$text");
            // },
            unknownRoute: null,
            binds: [
              Bind.put(ApiProvider()),
              // Bind.put(GlobalService(api: Get.find())),
              ...?additionalBinds,
            ],
            useInheritedMediaQuery: true,
            debugShowCheckedModeBanner: true,
            theme: MyTheme.getThemeData(isLight: MySharedPref.getThemeIsLight()),
            navigatorObservers: [FlutterSmartDialog.observer],
            defaultTransition: Platform.isAndroid ? Transition.rightToLeft : Transition.cupertino,
            builder: FlutterSmartDialog.init(
              builder: EasyLoading.init(
                builder: (context, child) {
                  return MediaQuery(
                    // 设置字体不跟随系统变化
                    data: MediaQuery.of(context).copyWith(
                      textScaler: const TextScaler.linear(1.0),
                    ),
                    child: child ?? Container(),
                  );
                },
              ),
            ),
            onUnknownRoute: null,
            initialRoute: initial,

            // first screen to show when app is running
            getPages: routes,
            // app screens
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              RefreshLocalizations.delegate,
            ],
            supportedLocales: LocalizationService.supportedLanguages.entries.map((e) => e.value).toList(),
            // support locales
            locale: MySharedPref.getCurrentLocal(),
            // app language
            translations: LocalizationService.getInstance(), // localization services in app (controller app language)
          );
        },
      ),
    );
  }

  /// 初始化默认配置
  static Future<void> initDefaultConfig(CommonConfigOption config) async {
    /// 如果需要 ensureInitialized，请在这里运行。
    WidgetsFlutterBinding.ensureInitialized();

    /// init shared preference
    await MySharedPref.init();

    /// 获取设备信息
    DeviceInfo deviceInfo = await getDeviceInfo();
    ToolsUtils.instance.deviceInfo = deviceInfo;

    /// 初始化日志管理
    LogManager.initialize();

    /// 加载htttpdns缓存配置
    LinkInfoCacheManager cacheManager = LinkInfoCacheManager();
    LineHttpDnsModelEntity? entity = await cacheManager.getLineHttpDnsModelEntity();
    ToolsUtils.instance.httpDnsModelEntity = entity;

    /// 设置运行模式
    ToolsUtils.instance.isDebugModel = await MySharedPref.getDebugMode();

    /// 设置升级提示版本号
    GlobalService.to.versionCode = config.version;

    /// 竖屏 Portrait 模式
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    // /// 获取版本号
    // ToolsUtils.instance.version = await ToolsUtils.getVersion();
    //
    // /// 获取头信息
    // ToolsUtils.instance.userAgent = await BaseProvider.getUserAgent();

    ///项目名称
    ProjectUtils.setGlobalProjectType(config.projectName);
    ToolsUtils.instance.isJtp = true;
    String logName = "iChat";

    // log
    LogUtil.init(tag: logName, isDebug: kDebugMode, maxLen: 256);
    // 打开状态
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);
    // 注册 GlobalService
    Get.put(GlobalService(api: ApiProvider()));
    HideKeybUtils.hideKeyShowfocus();

    /// 注册事件统计
    // startSensorsAnalyticsSDK();
    // 添加 App 生命周期监听
    AppLifecycleManager.instance.addListener(_onAppLifecycleChange);
  }

  /// 监听 App 生命周期状态变化
  static void _onAppLifecycleChange(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive) {
      print("🚀 SplashScreenView: 应用挂起");
      ToolsUtils.showLockScreen();
    }
  }

  /// 刷新余额
  static void reloadAmount(void Function() callback) {
    print('余额已刷新');

    // 调用回调函数
    callback();
  }

  ///  刷新角标
  static void loadUnreadMessageCount(void Function() callback) {
    print('刷新角标');

    // 调用回调函数
    callback();
  }
}
