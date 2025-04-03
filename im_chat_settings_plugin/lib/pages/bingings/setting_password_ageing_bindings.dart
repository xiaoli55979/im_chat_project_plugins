import 'package:get/get.dart';

import '../controllers/setting_password_ageing_controller.dart';

class SettingPasswordAgeingBindings extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(() => SettingPasswordAgeingController(api: Get.find())),
    ];
  }
}
