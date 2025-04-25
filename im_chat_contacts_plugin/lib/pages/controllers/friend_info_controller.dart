import 'package:get/get.dart';
import 'package:im_chat_common_plugin/core/base/controllers/base_controller.dart';
import 'package:im_chat_contacts_plugin/routes/app_routes_contacts.dart';

class FriendInfoController extends BaseController {
  toRemark() {
    Get.toNamed(AppRoutesContacts.remark);
  }
}