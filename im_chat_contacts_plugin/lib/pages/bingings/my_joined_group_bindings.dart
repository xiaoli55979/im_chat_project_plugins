import 'package:get/get.dart';
import 'package:im_chat_contacts_plugin/pages/controllers/my_joined_group_controller.dart';

class MyJoinedGroupBindings extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(() => MyJoinedGroupController(api: Get.find()))
    ];
  }
}