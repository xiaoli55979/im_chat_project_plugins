import 'package:get/get.dart';
import 'package:im_chat_contacts_plugin/pages/controllers/my_managed_group_controller.dart';

class MyManagedGroupBindings extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(() => MyManagedGroupController())
    ];
  }
}