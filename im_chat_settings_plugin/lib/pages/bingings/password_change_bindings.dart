import 'package:get/get.dart';

import '../controllers/password_change_controller.dart';

class PasswordChangeBindings extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(() => PasswordChangeController(api: Get.find())),
    ];
  }
}
