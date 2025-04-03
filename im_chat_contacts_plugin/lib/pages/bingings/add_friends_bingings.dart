import 'package:get/get.dart';

import '../controllers/add_friends_controller.dart';

class AddFriendsBindings extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(() => AddFriendsController(api: Get.find())),
    ];
  }
}
