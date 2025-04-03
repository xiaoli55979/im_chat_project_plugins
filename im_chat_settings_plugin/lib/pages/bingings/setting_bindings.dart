import 'package:get/get.dart';

import '../controllers/setting_controller.dart';

class SettingBindings extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(() => SettingController(api: Get.find())),
    ];
  }
}
