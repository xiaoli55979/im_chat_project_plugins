import 'package:get/get_navigation/src/routes/get_route.dart';

import '../pages/bingings/my_share_bindings.dart';
import '../pages/bingings/password_change_bindings.dart';
import '../pages/bingings/privacy_setting_bindings.dart';
import '../pages/bingings/safe_setting_bindings.dart';
import '../pages/bingings/setting_bindings.dart';
import '../pages/bingings/setting_log_bindings.dart';
import '../pages/bingings/setting_password_ageing_bindings.dart';
import '../pages/views/my_share_view.dart';
import '../pages/views/password_change_view.dart';
import '../pages/views/privacy_setting_view.dart';
import '../pages/views/safe_setting_view.dart';
import '../pages/views/setting_log_view.dart';
import '../pages/views/setting_password_ageing_view.dart';
import '../pages/views/setting_view.dart';
import 'app_routes_setting.dart';

class AppPagesSetting {
  AppPagesSetting._();

  /// 路由管理
  static final routes = [
    // 隐私设置
    GetPage(
      name: AppRoutesSetting.setting,
      page: () => const SettingView(),
      bindings: [SettingBindings()],
    ),

    // 隐私设置
    GetPage(
      name: AppRoutesSetting.privacy,
      page: () => const PrivacySettingView(),
      bindings: [PrivacySettingBindings()],
    ),

    /// 安全设置
    GetPage(
      name: AppRoutesSetting.safe,
      page: () => const SafeSettingView(),
      bindings: [SafeSettingBindings()],
    ),

    /// 密码保存时效设置
    GetPage(
      name: AppRoutesSetting.passwordAgeing,
      page: () => const SettingPasswordAgeingView(),
      bindings: [SettingPasswordAgeingBindings()],
    ),

    /// 密码修改
    GetPage(
      name: AppRoutesSetting.passwordChange,
      page: () => const PasswordChangeView(),
      bindings: [PasswordChangeBindings()],
    ),

    /// 日志管理设置
    GetPage(
      name: AppRoutesSetting.logger,
      page: () => const SettingLogView(),
      bindings: [SettingLogBindings()],
    ),

    /// 我的邀请码
    GetPage(
      name: AppRoutesSetting.myShare,
      page: () => const MyShareView(),
      bindings: [MyShareBindings()],
    ),
  ];
}
