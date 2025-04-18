import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commonpont/bottom_bavigation_barItem.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        // appBar: AppBar(
        //   title: Text(_titles[_currentIndex]), // 动态切换标题
        //   centerTitle: true,
        // ),
        body: IndexedStack(
          index: controller.currentIndex,
          children: controller.pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex, // 当前选中的索引
          onTap: (index) {
            controller.currentIndex = index;
            controller.update();
          },
          items: [
            badgeNavItem(
              icon: Icons.message_outlined,
              label: "消息",
              badgeCount: controller.allUnreadCount,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contact_page_outlined),
              label: '通讯录',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '我的',
            ),
          ],
        ),
      );
    });
  }
}
