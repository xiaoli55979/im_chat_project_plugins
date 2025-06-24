import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:im_chat_common_plugin/components/splash_screen_view.dart';
import 'package:im_chat_common_plugin/pages/bingings/launch_bindings.dart';
import 'package:im_chat_common_plugin/pages/bingings/user_info_bindings.dart';
import 'package:im_chat_common_plugin/pages/views/launch_page_view.dart';

import 'app_routes_common.dart';

class AppPagesCommon {
  AppPagesCommon._();

  /// 路由管理
  static final routes = [
    /// 引导页
    GetPage(
      name: AppRoutesCommon.splash,
      page: () => SplashScreenView(),
    ),

    /// 启动页
    GetPage(
      name: AppRoutesCommon.launch,
      page: () => const LaunchPageView(),
      bindings: [LaunchBinding()],
    ),
  ];
}
