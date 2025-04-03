import 'package:get/get.dart';

import '../controllers/privacy_setting_controller.dart';

class PrivacySettingBindings extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(() => PrivacySettingController(api: Get.find())),
    ];
  }
}
