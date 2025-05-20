import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:im_chat_common_plugin/core/base/controllers/base_controller.dart';
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';
import 'package:im_chat_contacts_plugin/routes/app_routes_contacts.dart';

class SelectFriendShareController extends BaseController {
  // 模拟最近聊天数据
  final List<String> recentChats = [
    SlocalCommon.getLocalizaContent(SlocalCommon.of(Get.context!).myCollection),
    SlocalCommon.getLocalizaContent(SlocalCommon.of(Get.context!).systemNotification),
    '22147',
    'xiaomi, 招商总局 (官方)1',
    'xiaomi, 招商总局 (官方)2',
    'xiaomi, 招商总局 (官方)3',
    'xiaomi, 招商总局 (官方)4',
  ];

  // 已选择好友列表
  final selectedFriends = [].obs;

  // 控制好友选择状态
  void toggleFriendSelection(String friend) {
      if (selectedFriends.value.contains(friend)) {
        selectedFriends.value.remove(friend);
      } else {
        if (selectedFriends.value.length < 50) {
          selectedFriends.value.add(friend);
        }
      }
      selectedFriends.refresh();
  }

  // 更多联系人
  moreContacts() {
    Get.toNamed(AppRoutesContacts.selectContacts);
  }
}