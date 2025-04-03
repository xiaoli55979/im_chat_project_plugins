import 'package:get/get.dart';

import '../controllers/my_controller.dart';

class MyBindings extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(() => MyController(api: Get.find())),
    ];
  }
}
