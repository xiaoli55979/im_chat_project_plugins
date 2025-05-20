import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:im_chat_auth_plugin/pages/bingings/forget_password_binding.dart';
import 'package:im_chat_auth_plugin/pages/bingings/general_binding.dart';
import 'package:im_chat_auth_plugin/pages/bingings/help_set_binding.dart';
import 'package:im_chat_auth_plugin/pages/bingings/report_malfunction_binding.dart';
import 'package:im_chat_auth_plugin/pages/bingings/service_binding.dart';
import 'package:im_chat_auth_plugin/pages/views/forget_password_view.dart';
import 'package:im_chat_auth_plugin/pages/views/general_view.dart';
import 'package:im_chat_auth_plugin/pages/views/help_set_view.dart';
import 'package:im_chat_auth_plugin/pages/views/report_malfunction_view.dart';
import 'package:im_chat_auth_plugin/pages/views/service_view.dart';

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

    GetPage(
        name: AppRoutesAuth.forgetPassword,
        page: () => const ForgetPasswordView(),
        bindings: [ForgetPasswordBinding()]),

    GetPage(
        name: AppRoutesAuth.service,
        page: () => const ServiceView(),
        bindings: [ServiceBinding()]),

    GetPage(
        name: AppRoutesAuth.helpSet,
        page: () => HelpSetView(),
        bindings: [HelpSetBinding()]),

    GetPage(
        name: AppRoutesAuth.general,
        page: () => GeneralView(),
        bindings: [GeneralBinding()]),

    GetPage(
        name: AppRoutesAuth.reportMalfunction,
        page: () => ReportMalfunctionView(),
        bindings: [ReportMalfunctionBinding()])
  ];
}
