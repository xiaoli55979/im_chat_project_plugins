import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:im_chat_common_plugin/api/provider.dart';
import 'package:im_chat_contacts_plugin/pages/views/contacts_view.dart';
import 'package:im_chat_conversation_plugin/pages/views/conversation_view.dart';
import 'package:im_chat_settings_plugin/pages/views/my_view.dart';
import 'package:wukongimfluttersdk/wkim.dart';

class HomeController extends GetxController {
  HomeController({required this.api});
  final ApiProvider api;
  int currentIndex = 0; // 当前选中的底部导航栏索引
  int allUnreadCount = 0;

  // 初始化页面选项
  final List<Widget> pages = [
    ConversationView(),
    ContactsView(),
    MyView(),
  ];

  @override
  void onReady() {
    super.onReady();
    initData();
  }

  void initData() {
    WKIM.shared.conversationManager.getAllUnreadCount().then((value) {
      allUnreadCount = value;
      print("object_getAllUnreadCount:$allUnreadCount");
      update();
    });
  }
}
