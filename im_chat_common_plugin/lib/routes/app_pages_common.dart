import 'package:get/get_navigation/src/routes/get_route.dart';

import '../components/splash_screen_view.dart';
import '../pages/bingings/launch_bindings.dart';
import '../pages/bingings/search_bindings.dart';
import '../pages/bingings/user_info_bindings.dart';
import '../pages/views/launch_page_view.dart';
import '../pages/views/search_view.dart';
import '../pages/views/user_info_view.dart';
import 'app_routes_common.dart';

class AppPagesCommon {
  AppPagesCommon._();

  /// 路由管理
  static final routes = [
    /// 公告类路由
    GetPage(name: "/splash", page: () => SplashScreenView()),

    /// 启动页
    GetPage(
      name: AppRoutesCommon.launch,
      page: () => const LaunchPageView(),
      bindings: [LaunchBinding()],
    ),

    /// 搜索页面
    GetPage(
      name: AppRoutesCommon.search,
      page: () => const SearchView(),
      bindings: [SearchBindings()],
    ),

    /// 用户信息页面
    GetPage(
      name: AppRoutesCommon.userInfo,
      page: () => const UserInfoView(),
      bindings: [UserInfoBindings()],
    ),
  ];
}
