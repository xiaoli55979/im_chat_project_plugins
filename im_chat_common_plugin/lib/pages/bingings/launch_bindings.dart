import 'package:get/get.dart';
import 'package:im_chat_common_plugin/pages/controllers/launch_page_controller.dart';


class LaunchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LaunchPageController(api: Get.find()));
  }
}
