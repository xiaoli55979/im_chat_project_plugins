import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/api/provider/user_provider.dart';
import 'package:im_chat_common_plugin/config/theme/app_theme.dart';
import 'package:im_chat_common_plugin/jtp_common_init.dart';
import 'package:im_chat_common_plugin/manager/app_manager.dart';
import 'package:im_chat_common_plugin/routes/route_util.dart';
import 'package:im_chat_common_plugin/services/global_service.dart';
import 'package:im_chat_common_plugin/manager/app_lifecycle_manager.dart';
import 'package:im_chat_common_plugin/util/constant.dart';
import 'package:im_chat_common_plugin/util/storage.dart';

import 'generated/locales.g.dart';

class App extends StatefulWidget {

  const App({
    super.key,
    required this.routes,
    this.initialBinding,
  });

  final List<GetPage> routes;
  final Bindings? initialBinding;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // 填入设计稿中设备的屏幕尺寸,单位dp
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      rebuildFactor: (old, data) => true,
      builder: (context, widget) {
        /// 通知UI初始完成
        JtpComponentsInit().notifyUpdateUIComplete(context);
        return GetMaterialApp(
          theme: AppTheme.getThemeData(isLight: Storage.getIsLightTheme()),
          title: kAppName.tr,
          initialRoute: RouterUtil.initialRoute(),
          initialBinding: this.widget.initialBinding ?? CommonBinding(),
          getPages: this.widget.routes,
          unknownRoute: null,
          useInheritedMediaQuery: true,
          debugShowCheckedModeBanner: false,
          navigatorObservers: [FlutterSmartDialog.observer],
          defaultTransition: Platform.isAndroid
              ? Transition.rightToLeft
              : Transition.cupertino,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            // RefreshLocalizations.delegate,
          ],
          translations: Language(),
          locale: AppManager.shared.locale ?? Get.deviceLocale,
          fallbackLocale: China,
          builder: FlutterSmartDialog.init(
            builder: EasyLoading.init(
              builder: (context, child) {
                return MediaQuery(
                  data: MediaQuery.of(context)
                      .copyWith(textScaler: const TextScaler.linear(1.0)),
                  child: child ?? Container(),
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    /// 注册生命周期管理
    AppLifecycleManager.instance.init();
  }

  @override
  void dispose() {
    super.dispose();
    AppLifecycleManager.instance.dispose();
  }
}

class CommonBinding extends Bindings {

  CommonBinding();

  @override
  void dependencies() {
    Get.put(UserProvider(), permanent: true);
    Get.put(GlobalService(api: Get.find()));
  }
}
