import 'package:get/get.dart';
import 'package:im_chat_auth_plugin/pages/controllers/general_controller.dart';

class GeneralBinding extends Binding {
  @override
  List<Bind> dependencies() {
    // TODO: implement dependencies
    return [
      Bind.lazyPut(() => GeneralController())
    ];
  }
}