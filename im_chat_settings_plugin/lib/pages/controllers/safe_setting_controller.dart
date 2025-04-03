import 'package:get/get.dart';
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';

class SafeSettingController extends GetxController {
  SafeSettingController({required this.api});
  final ApiProvider api;
  String appLockScreenPwd = "";

  @override
  void onReady() {
    super.onReady();
    getAppLockPwd();
  }

  Future<void> getAppLockPwd() async {
    appLockScreenPwd = MySharedPref.getAppLockScreenPwd();
    print("object_appLockScreenPwd:$appLockScreenPwd");
    update();
  }
}
