import 'package:get/get.dart';
import 'package:im_chat_common_plugin/core/base/controllers/base_controller.dart';
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';
import 'package:im_chat_contacts_plugin/routes/app_routes_contacts.dart';

import '../../model/ui_contact_entity.dart';
class FriendInfoController extends BaseController {


final contactEntity = UiContactEntity();
  toRemark() {
    Get.toNamed(AppRoutesContacts.remark);
  }

  toMore() {
    Get.toNamed(AppRoutesContacts.friendMore);
  }

  toChat() {

    Get.toNamed("chat", arguments: {"channelID": contactEntity.wkChannel?.channelID, "channelType": contactEntity.wkChannel?.channelType});
  }
}