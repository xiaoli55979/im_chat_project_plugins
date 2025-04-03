import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';

import '../../routes/app_routes_setting.dart';
import '../controllers/my_controller.dart';

class MyView extends GetView<MyController> {
  const MyView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<MyController>(builder: (controller) {
      return BasicView(
        title: "我的",
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 用户信息框
            _buileTopView(context, controller),
            // 功能列表
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(10),
                children: [
                  // _buildListItem(
                  //   context,
                  //   icon: Icons.devices,
                  //   title: '登录设备管理',
                  //   onTap: () {
                  //     // 跳转到登录设备管理页面
                  //   },
                  // ),
                  // _buildListItem(
                  //   context,
                  //   icon: Icons.share,
                  //   title: '分享邀请码',
                  //   onTap: () {},
                  // ),
                  // _buildListItem(
                  //   context,
                  //   icon: Icons.group_add,
                  //   title: '群发助手',
                  //   onTap: () {
                  //     // 跳转到群发助手页面
                  //   },
                  // ),
                  MenuItem(
                    radiusTop: true,
                    title: '我的邀请码',
                    icon: Icons.share,
                    url: AppRoutesSetting.myShare,
                  ),
                  MenuItem(
                    radiusBottom: true,
                    hideLine: true,
                    title: '设置',
                    icon: Icons.settings,
                    url: AppRoutesSetting.setting,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buileTopView(BuildContext context, MyController controller) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue, // 蓝色背景
        borderRadius: BorderRadius.circular(5), // 设置圆角
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=1'), // 用户头像
              ),
              Spacer(),
              // IconButton(
              //   onPressed: () {
              //     // 处理修改头像的逻辑
              //   },
              //   icon: Icon(Icons.edit, color: Colors.white),
              // ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            '用户名: Alice', // 用户名
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            '服务器ID: 147258', // 服务器ID
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 5),
          Text(
            '账号: 112366', // 账号
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
