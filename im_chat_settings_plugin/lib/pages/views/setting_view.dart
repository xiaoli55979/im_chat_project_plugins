import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/database/user_manager.dart';
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';

import '../../routes/app_routes_setting.dart';
import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(builder: (controller) {
      return BasicView(
        title: "设置",
        body: ListView(
          padding: EdgeInsets.all(10),
          children: [
            MenuItem(
              radiusTop: true,
              icon: Icons.security,
              title: '安全设置',
              onPressed: () {
                Get.toNamed(AppRoutesSetting.safe);
              },
            ),
            MenuItem(
              radiusBottom: true,
              icon: Icons.lock,
              title: '隐私设置',
              onPressed: () {
                Get.toNamed(AppRoutesSetting.privacy);
              },
            ),
            SizedBox(height: 10),
            MenuItem(
              radiusTop: true,
              icon: Icons.chat,
              title: '聊天设置',
            ),
            MenuItem(
              icon: Icons.notifications,
              title: '通知设置',
            ),
            MenuItem(
              radiusBottom: true,
              icon: Icons.settings_system_daydream,
              title: '系统设置',
            ),
            SizedBox(height: 10),
            MenuItem(
              radiusTop: true,
              icon: Icons.delete,
              title: '清除缓存',
              onPressed: () async {
                await CacheManagerTool.clearCache();
                controller.loadCache();
              },
              tingObject: Text(
                controller.cacheSize,
                style: TextStyle(fontSize: 16),
              ),
            ),
            MenuItem(
              icon: Icons.report_problem,
              title: '故障日志上传',
              url: AppRoutesSetting.logger,
            ),
            MenuItem(
              radiusBottom: true,
              icon: Icons.info,
              title: '关于美聊',
            ),
            SizedBox(height: 10),
            MenuItem(
              radiusBottom: true,
              icon: Icons.info,
              title: '导出数据库',
              onPressed: () {
                final userManager = UserManager();
                userManager.copyDatabaseToDownloads();
              },
            ),
            SizedBox(height: 10),

            MenuItem(
              radiusTop: true,
              icon: Icons.switch_account,
              title: '切换账号',
              onPressed: () {
                showAdaptiveActionSheet(
                  context: context,
                  title: Column(
                    children: [
                      const Text(
                        '提示',
                        style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 15),
                      const Text(
                        '是否切换项目ID',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  androidBorderRadius: 30,
                  actions: <BottomSheetAction>[
                    BottomSheetAction(
                      title: const Text(
                        '确定切换',
                        style: TextStyle(fontSize: 16),
                      ),
                      onPressed: (context) {
                        Get.offAllNamed("/launch");
                        MySharedPref.setProjectIdKey("");
                      },
                    ),
                  ],
                  cancelAction: CancelAction(
                    title: Text(
                      '取消',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
            MenuItem(
              radiusBottom: true,
              icon: Icons.settings,
              title: '设置',
            ),
            SizedBox(height: 10),

            // 底部的退出登录按钮区域
            Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 350,
                    child: MainButton(
                      onPressed: () {
                        showAdaptiveActionSheet(
                          context: context,
                          title: Column(
                            children: [
                              Text(
                                '提示',
                                style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 15),
                              const Text(
                                '是否退出登录',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          androidBorderRadius: 30,
                          actions: <BottomSheetAction>[
                            BottomSheetAction(
                              title: const Text(
                                '确定退出',
                                style: TextStyle(fontSize: 16),
                              ),
                              onPressed: (context) {
                                controller.loginOut();
                              },
                            ),
                          ],
                          cancelAction: CancelAction(
                            title: Text(
                              '取消',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        );
                      },
                      text: "退出登录",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
