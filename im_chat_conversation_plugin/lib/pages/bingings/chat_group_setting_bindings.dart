import 'package:get/get.dart';

import '../controllers/chat_group_setting_controller.dart';

class ChatGroupSettingBindings extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(() => ChatGroupSettingController(api: Get.find())),
    ];
  }
}
