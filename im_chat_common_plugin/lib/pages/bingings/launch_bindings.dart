import 'package:get/get.dart';
import 'package:im_chat_common_plugin/pages/controllers/launch_page_controller.dart';


class LaunchBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(() => LaunchPageController(api: Get.find())),
    ];
  }
}
