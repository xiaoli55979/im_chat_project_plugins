import 'package:get/get.dart';

import '../controllers/contacts_controller.dart';

class ContactsBindings extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(() => ContactsController(api: Get.find())),
    ];
  }
}
