import 'package:get/get.dart';
import 'package:im_chat_auth_plugin/pages/controllers/help_set_controller.dart';

class HelpSetBinding extends Binding {
  @override
  List<Bind> dependencies() {
    // TODO: implement dependencies
    return [
      Bind.lazyPut(() => HelpSetController())
    ];
  }
}