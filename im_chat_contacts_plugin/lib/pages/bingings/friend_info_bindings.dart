import 'package:get/get.dart';
import 'package:im_chat_contacts_plugin/pages/controllers/friend_info_controller.dart';

class FriendInfoBindings extends Binding {
  @override
  List<Bind> dependencies() {
    // TODO: implement dependencies
    return [
      Bind.lazyPut(() => FriendInfoController())
    ];
  }
}