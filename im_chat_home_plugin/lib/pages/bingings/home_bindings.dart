import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBindings extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(() => HomeController(api: Get.find())),
    ];
  }
}
