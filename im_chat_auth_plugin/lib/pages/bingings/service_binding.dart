import 'package:get/get.dart';
import 'package:im_chat_auth_plugin/pages/controllers/service_controller.dart';

class ServiceBinding extends Binding {
  @override
  List<Bind> dependencies() {
    // TODO: implement dependencies
    return [
      Bind.lazyPut (() => ServiceController(api: Get.find()))
    ];
  }

}