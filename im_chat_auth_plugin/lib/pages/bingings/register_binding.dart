import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(() => RegisterController(api: Get.find())),
    ];
  }
}
