import 'package:get/get.dart';

import '../controllers/setting_log_controller.dart';

class SettingLogBindings extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(() => SettingLogController(api: Get.find())),
    ];
  }
}
