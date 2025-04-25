import 'package:get/get.dart';
import 'package:im_chat_contacts_plugin/pages/controllers/friend_info_controller.dart';
import 'package:im_chat_contacts_plugin/pages/controllers/friend_more_controller.dart';

class FriendMoreBindings extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(() => FriendMoreController())
    ];
  }
}