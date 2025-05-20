import 'package:get/get.dart';
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';
import 'package:im_chat_common_plugin/tools/cache_manager_tool.dart';

class GeneralController extends GetxController {
  Future<void> clearCache() async {
    await CacheManagerTool.clearCache();
    DialogUtils.showSuccess("msg");
  }
}