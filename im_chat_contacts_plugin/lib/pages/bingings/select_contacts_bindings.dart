import 'package:get/get.dart';
import 'package:im_chat_contacts_plugin/pages/controllers/select_contacts_controller.dart';

class SelectContactsBindings extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(() => SelectContactsController())
    ];
  }
}