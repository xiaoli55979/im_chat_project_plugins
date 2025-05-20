import 'package:get/get.dart';
import 'package:im_chat_contacts_plugin/pages/controllers/select_friend_share_controller.dart';

class SelectFriendShareBindings extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(() => SelectFriendShareController())
    ];
  }
}