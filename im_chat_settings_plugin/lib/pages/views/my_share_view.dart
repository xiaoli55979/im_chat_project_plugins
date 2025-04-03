import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_chat_common_plugin/im_chat_common_plugin_library.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../controllers/my_share_controller.dart';
import 'dashed_line_view.dart';

class MyShareView extends GetView<MyShareController> {
  const MyShareView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyShareController>(
      builder: (controller) {
        return BasicView(
          title: "我的邀请码",
          body: Column(
            children: [
              // 用户信息块
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 6,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // 用户头像
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage('https://www.w3schools.com/w3images/avatar2.png'),
                    ),

                    SizedBox(width: 16),
                    // 用户信息
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "大军",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "扫描二维码加我为好友",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // 二维码块
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 6,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // 二维码
                    RepaintBoundary(
                      key: controller.qrCodeScreenshotKey,
                      child: Column(
                        children: [
                          Container(
                            color: Colors.white,
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: QrImageView(
                                data: controller.getQrCodeData(),
                                version: QrVersions.auto,
                                size: 150,
                              ), // 替换为真实二维码
                            ),
                          ),
                          SizedBox(height: 10),

                          // 服务器ID
                          Text(
                            "服务器ID: gc888",
                            style: TextStyle(fontSize: 14, color: Colors.black54),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 10),

                    // 有效期 + 编辑按钮
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "二维码有效期: ${DateUtil.formatDate(controller.qrCodeExpiry, format: 'yyyy年MM月dd日 HH:mm')}",
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.blue),
                          onPressed: () => _showDatePicker(context, controller),
                        ),
                      ],
                    ),

                    SizedBox(height: 10),
                    // 虚线
                    Padding(padding: EdgeInsets.symmetric(vertical: 8), child: DashedLineView()),

                    SizedBox(height: 10),
                    // 邀请说明
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "大军邀请您使用美聊，下载美聊后扫描此二维码可以自动加入服务器，完成注册并添加大军为好友。",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: Colors.black87),
                      ),
                    ),

                    SizedBox(height: 10),

                    // 自动添加好友开关
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              controller.autoAddFriend ? Icons.check_box : Icons.check_box_outline_blank,
                              color: controller.autoAddFriend ? Colors.blue : Colors.grey,
                            ),
                            SizedBox(width: 8),
                            Text("自动添加扫码用户为好友"),
                          ],
                        ),
                        Switch(
                          value: controller.autoAddFriend,
                          onChanged: (value) {
                            controller.toggleAutoAddFriend();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),
              SizedBox(
                width: 250,
                child: MainButton(onPressed: controller.save, text: "保存"),
              ),
              // 保存
            ],
          ),
        );
      },
    );
  }

  // iOS 风格日期选择器
  void _showDatePicker(BuildContext context, MyShareController controller) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return SafeArea(
            child: Container(
          height: 250,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.dateAndTime,
                  initialDateTime: controller.qrCodeExpiry,
                  onDateTimeChanged: (DateTime newDateTime) {
                    controller.qrNewCodeExpiry = newDateTime;
                  },
                ),
              ),
              SizedBox(
                width: 250,
                child: MainButton(
                    onPressed: () {
                      controller.updateQrCodeExpiry(controller.qrNewCodeExpiry);
                      Navigator.pop(context);
                    },
                    text: "确定"),
              ),
            ],
          ),
        ));
      },
    );
  }
}
