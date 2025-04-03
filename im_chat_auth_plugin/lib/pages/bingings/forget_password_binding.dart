import 'package:get/get.dart';

import '../controllers/forget_password_controller.dart';

class ForgetPasswordBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(() => ForgetPasswordController(api: Get.find())),
    ];
  }
}
