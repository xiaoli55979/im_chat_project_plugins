import 'package:im_chat_common_plugin/routes/app_routes_common.dart';

class RouterUtil {
  static String initialRoute() => nextRoute();

  static String nextRoute() {
    return AppRoutesCommon.splash;
    // return Routes.splash;
  }
}
