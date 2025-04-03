import 'package:get/get.dart';
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';

import '../../api/api_provider_setting.dart';

class SettingController extends GetxController {
  SettingController({required this.api});
  final ApiProviderSetting api;
  String cacheSize = "";

  /// 用户信息存入数据库
  final userManager = UserManager();
  @override
  void onReady() {
    super.onReady();
    loadCache();
  }

  Future<void> loadCache() async {
    cacheSize = await CacheManagerTool.getCacheSize();
    LogManager.log("CacheSize:$cacheSize");
    update();
  }

  Future<void> loginOut() async {
    try {
      // var res = await api.loginOut();
      // if (res.status == 200) {
      Get.offAllNamed("/login");
      //   GlobalService.to.isLoggedIn.value = false;
      //   userManager.setCurrentUserUid("");
      // }
    } catch (e) {
      print("object_logOut:${e.toString()}");
      DialogUtils.showError(e.toString());
    }
  }
}
