import 'package:get/get.dart';

import '../controllers/user_info_controller.dart';

class UserInfoBindings extends Bindings {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(() => UserInfoController(api: Get.find())),
    ];
  }
}
