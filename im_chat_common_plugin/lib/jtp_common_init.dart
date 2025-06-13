import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/app.dart';
import 'package:im_chat_common_plugin/manager/app_manager.dart';
import 'package:im_chat_common_plugin/routes/app_pages_common.dart';
import 'package:im_chat_common_plugin/tools/common_config_option.dart';
import 'package:im_chat_common_plugin/tools/my_shared_pref.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'api/lines_config.dart';

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
  //   if (!_systemMsgListeners.contains(listener)) {
  //     _systemMsgListeners.add(listener);
  //   }
  // }
  //
  // /// 移除系统消息监听器
  // void removeSystemMsgListener(Function(ImNewChatSystemMessageModelEntity) listener) {
  //   _systemMsgListeners.remove(listener);
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
    await AppManager.shared.initial(commonConfig);

    /// 初始化异常上报SDK
    await SentryFlutter.init(
      (options) {
        options.dsn = LinesConfig.getDnsConfigLine();
        options.tracesSampleRate = 0.8;
        options.debug = false;
        options.enablePrintBreadcrumbs = false;
      },
      appRunner: () => runApp(App(routes: combinedRoutes, additionalBinds: additionalBinds)),
    );
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
