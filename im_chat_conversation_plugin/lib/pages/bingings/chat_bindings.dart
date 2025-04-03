import 'package:get/get.dart';

import '../controllers/chat_controller.dart';

class ChatBindings extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(() => ChatController(api: Get.find())),
    ];
  }
}
