import 'package:get/get.dart';

import '../controllers/my_share_controller.dart';

class MyShareBindings extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(() => MyShareController(api: Get.find())),
    ];
  }
}
