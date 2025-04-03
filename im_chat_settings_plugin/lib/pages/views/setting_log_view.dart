import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';

import '../controllers/setting_log_controller.dart';

class SettingLogView extends GetView<SettingLogController> {
  const SettingLogView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<SettingLogController>(builder: (controller) {
      return BasicView(
        title: '日志管理',
        actions: [
          TextButton(
              onPressed: () {
                controller.compressLogFolder();
              },
              child: Text(
                "日志压缩",
                style: TextStyle(fontSize: 16),
              ))
        ],
        body: ListView(
          padding: EdgeInsets.all(10),
          children: [
            // 日志文件列表
            ...controller.logFileList.map((file) {
              return Container(
                color: Colors.white,
                child: ListTile(
                  title: Text(
                    file.uri.pathSegments.last,
                    style: TextStyle(fontSize: 16),
                  ), // 显示文件名
                  subtitle: FutureBuilder<int>(
                    future: controller.getFileSize(file),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text("Loading size...");
                      } else if (snapshot.hasError) {
                        return Text("Error getting size");
                      } else {
                        final fileSize = snapshot.data;
                        return Text(
                          "Size: ${controller.formatSize(fileSize!)}",
                          style: TextStyle(fontSize: 14),
                        );
                      }
                    },
                  ),
                  onTap: () {
                    // 点击后打开日志详情页面
                    controller.openLogFileWithSystemApp(file);
                  },
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      controller.deleteLogFile(file); // 删除日志文件
                    },
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      );
    });
  }
}
