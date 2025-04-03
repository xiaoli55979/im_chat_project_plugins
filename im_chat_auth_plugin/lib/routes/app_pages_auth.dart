import 'package:get/get_navigation/src/routes/get_route.dart';

import '../pages/bingings/login_binding.dart';
import '../pages/bingings/register_binding.dart';
import '../pages/views/login_view.dart';
import '../pages/views/register_view.dart';
import 'app_routes_auth.dart';

class AppPagesAuth {
  AppPagesAuth._();

  /// 路由管理
  static final routes = [
    /// 启动页
    // GetPage(
    //   name: AppRoutesAuth.launch,
    //   page: () => const LaunchPageView(),
    //   bindings: [LaunchBinding()],
    // ),

    /// 登录页
    GetPage(
      name: AppRoutesAuth.login,
      page: () => const LoginView(),
      bindings: [LoginBinding()],
    ),

    /// 注册页
    GetPage(
      name: AppRoutesAuth.register,
      page: () => const RegisterView(),
      bindings: [RegisterBinding()],
    ),
  ];
}
