import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:im_chat_common_plugin/tools/project_utils.dart';

class CommonConfigOption {
  final ProjectType projectName; // 项目名称
  final Color themeColor; // 主题颜色
  final RxString appName; // 响应式应用名称
  final int version; // 版本号

  // 构造函数，使用命名参数并设置默认值
  CommonConfigOption({
    this.projectName = ProjectType.iChat, // 默认项目名称
    this.themeColor = Colors.blue, // 默认主题颜色
    String appName = "", // 允许为空，默认值为空字符串
    this.version = 1, // 默认版本号
  }) : appName = appName.obs; // 将 appName 转换为 RxString

  // 更新 appName 的方法
  void updateAppName(String newAppName) {
    appName.value = newAppName;
  }

  // 可选：添加一个方法打印配置信息
  void printConfig() {
    print('Project Name: $projectName');
    print('Theme Color: $themeColor');
    print('App Name: ${appName.value}'); // 打印动态的 appName
    print('Version: $version');
  }
}
