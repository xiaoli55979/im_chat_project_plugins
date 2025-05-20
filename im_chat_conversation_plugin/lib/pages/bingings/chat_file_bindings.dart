import 'package:get/get.dart';
import 'package:im_chat_conversation_plugin/pages/controllers/chat_file_controller.dart';

class ChatFileBindings extends Binding {
  @override
  List<Bind> dependencies() {
    // TODO: implement dependencies
    return [
      Bind.lazyPut(() => ChatFileController())
    ];
  }
}