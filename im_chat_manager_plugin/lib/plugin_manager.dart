// plugin_manager.dart

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:im_chat_auth_plugin/api/api_provider_auth.dart';
import 'package:im_chat_auth_plugin/routes/app_pages_auth.dart';
import 'package:im_chat_common_plugin/api/provider.dart';
import 'package:im_chat_common_plugin/jtp_common_init.dart';
import 'package:im_chat_contacts_plugin/api/api_provider_contact.dart';
import 'package:im_chat_contacts_plugin/routes/app_pages_contacts.dart';
import 'package:im_chat_conversation_plugin/routes/app_pages_conversation.dart';
import 'package:im_chat_home_plugin/routes/app_pages_home.dart';
import 'package:im_chat_settings_plugin/api/api_provider_setting.dart';
import 'package:im_chat_settings_plugin/routes/app_pages_setting.dart';

/// 路由管理列表
final List<GetPage> routes = [
  ...AppPagesHome.routes, // home路由
  ...AppPagesAuth.routes, // login路由
  ...AppPagesSetting.routes, // setting路由
  ...AppPagesContacts.routes, // Contacts 路由
  ...AppPagesConversation.routes, // Conversation 路由
];

/// 插件管理类，用于统一初始化和配置
class PluginManager {
  /// 获取所有路由
  static List<GetPage> getRoutes() => routes;

  /// 初始化方法，用于各插件的初始化
  static void initialize() {
    /// 获取单例实例
    final jtpInit = JtpComponentsInit();

    /// 设置初始化完成后的回调
    jtpInit.initialize();

    /// 初始化其他控件
    jtpInit.initMain(
      routes: getRoutes(),
      additionalBinds: [
        // Bind.lazyPut(() => FinanceProvider()),
        Bind.put(ApiProvider()),
        Bind.put(ApiProviderAuth()),
        Bind.put(ApiProviderSetting()),
        Bind.put(ApiProviderContact()),
      ],
    );
  }
}
