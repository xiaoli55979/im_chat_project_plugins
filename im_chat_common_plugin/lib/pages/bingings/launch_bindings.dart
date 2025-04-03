import 'package:get/get.dart';

import '../controllers/launch_page_controller.dart';

class LaunchBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(() => LaunchPageController(api: Get.find())),
    ];
  }
}
