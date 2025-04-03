import 'package:get/get.dart';

import '../controllers/conversation_controller.dart';

class ConversationBindings extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(() => ConversationController(api: Get.find())),
    ];
  }
}
