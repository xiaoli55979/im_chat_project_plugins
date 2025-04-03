import 'package:get/get.dart';

import '../controllers/safe_setting_controller.dart';

class SafeSettingBindings extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(() => SafeSettingController(api: Get.find())),
    ];
  }
}
