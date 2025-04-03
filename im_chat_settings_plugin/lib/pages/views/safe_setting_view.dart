import 'package:flutter/material.dart';
import 'package:flutter_screen_lock_plug/lock_screen_manager.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';

import '../../routes/app_routes_setting.dart';
import '../controllers/safe_setting_controller.dart';
import 'app_lock_screen_set_page.dart';

class SafeSettingView extends GetView<SafeSettingController> {
  const SafeSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<SafeSettingController>(builder: (controller) {
      return BasicView(
        title: "安全设置",
        body: ListView(
          padding: EdgeInsets.all(10),
          children: [
            MenuItem(
              radiusTop: true,
              title: '密码保存时效',
              url: AppRoutesSetting.passwordAgeing,
            ),
            MenuItem(
              radiusBottom: true,
              hideLine: true,
              title: '修改密码',
              url: AppRoutesSetting.passwordChange,
            ),
            SizedBox(height: 10),
            MenuItem(
              radiusTop: true,
              radiusBottom: true,
              hideLine: true,
              title: '应用锁',
              value: controller.appLockScreenPwd.isNotEmpty ? "已打开" : "关闭",
              tinColor: Colors.grey,
              onPressed: () async {
                if (controller.appLockScreenPwd.isNotEmpty) {
                  ///  检测是否有密码
                  LockScreenManager.show(
                    password: controller.appLockScreenPwd,
                    context: Get.context!,
                    errorMaxPop: true,
                    onUnlockSuccess: () {
                      print("object_onUnlockSuccess");
                      MySharedPref.setAppLockScreenPwd("");
                      controller.getAppLockPwd();
                    },
                    onErrorExceeded: () {
                      print("object_onErrorExceeded");
                    },
                  );
                } else {
                  await Get.to(() => AppLockScreenSetPage());
                  controller.getAppLockPwd();
                }
              },
            ),
            SizedBox(height: 10),
            MenuItem(
              radiusTop: true,
              radiusBottom: true,
              hideLine: true,
              title: '注销账号',
            ),
          ],
        ),
      );
    });
  }

  // 分组标题构建函数
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey,
        ),
      ),
    );
  }
}
