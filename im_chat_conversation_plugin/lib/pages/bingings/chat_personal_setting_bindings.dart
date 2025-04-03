import 'package:get/get.dart';

import '../controllers/chat_personal_setting_controller.dart';

class ChatPersonalSettingBindings extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(() => ChatPersonalSettingController(api: Get.find())),
    ];
  }
}
