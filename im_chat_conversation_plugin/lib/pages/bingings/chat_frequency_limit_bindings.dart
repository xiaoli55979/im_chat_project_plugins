import 'package:get/get.dart';

import '../controllers/chat_frequency_limit_controller.dart';

class ChatFrequencyLimitBindings extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(() => ChatFrequencyLimitController(api: Get.find())),
    ];
  }
}
